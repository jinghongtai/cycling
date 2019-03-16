import com.ht.domain.Bankuai;
import com.ht.service.PostClassService;
import com.ht.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

/**
 * 版权归公司所有
 * 项目名称： 应用支撑平台;
 * 创建者    :  jinghongtai;
 * 创建日期: 2019年01月12日 18:10;
 *
 * @version: 1.0
 */
@RunWith(JunitSpring.class)
@ContextConfiguration(locations = {
    "classpath*:application*.xml"
})
@WebAppConfiguration
public class UserServiceTest {

    @Autowired
    private UserService userService;

     @Autowired
    private PostClassService postClassService;


    @Test
    public void query(){

        List<Bankuai> bankuais = postClassService.queryPostClass();
        System.out.println(bankuais);
    }




}
