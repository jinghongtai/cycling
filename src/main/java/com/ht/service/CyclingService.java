package com.ht.service;

import com.ht.dao.CycleDao;
import com.ht.domain.Cycling;
import com.ht.utils.BeanUtil;
import com.ht.utils.PageVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by TT on 2019/3/3.
 */
@Service("cyclingService")
public class CyclingService {


    @Resource(name = "cyclingDAO")
    private CycleDao cyclingDao;

    /**
     * 分页查询骑行活动信息
     * @param cycling
     * @return
     * @throws IllegalAccessException
     * @throws IntrospectionException
     * @throws InvocationTargetException
     */
    @Transactional(readOnly = true)
    public PageVo queryInof(Cycling cycling) throws IllegalAccessException, IntrospectionException, InvocationTargetException {
        // 查询总页数
        Map<String, Object> notNullProperty = BeanUtil.getNotNullProperty(cycling);
        Long aLong = cyclingDao.queryCount(notNullProperty, null);
        // 查询记录
        List<Cycling> resultList = cyclingDao.query(notNullProperty, null, "beginTime", "desc");
        return PageVo.returnPage(resultList,aLong);
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public Map<String,String> saveCycling(Cycling cycling){
        Map<String,String> map = new HashMap<String,String>();
        map.put("status","error");
        if(!StringUtils.isEmpty(cycling.getFlagPersonLimit())&&"N".equals(cycling.getFlagPersonLimit())){
            cycling.setLimit(null);
        }
        if(StringUtils.isEmpty(cycling.getId())){
            // 新增骑行活动
            cycling.setAllowRelease("N");
            cyclingDao.save(cycling);
        }else{
            cyclingDao.update(cycling);
        }
        map.put("status","success");
        return map;
    }

    /**
     * 根据主键查询详情数据
     * @return
     * @param id
     */
    @Transactional(readOnly = true)
    public Cycling queryById(String id){
        if(!StringUtils.isEmpty(id)){
            Map<String,Object> paramMap = new HashMap<String,Object>();
            paramMap.put("id",id);
            List<Cycling> cyclings = cyclingDao.query(paramMap,null,null,null);
            return cyclings!=null&&cyclings.size()>0?cyclings.get(0):null;
        }else
            return null;
    }


}
