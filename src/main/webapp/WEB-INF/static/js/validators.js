// JavaScript Document
Validator = {
    require: /.+/,
    email: /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,
    phone: /^((\(\d{3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[0-9]\d{6,7}$/,
    mobile: /^((\(\d{3}\))|(\d{3}\-))?1\d{10}$/,
    url: /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
    idcard: /^\d{15}(\d{2}[A-Za-z0-9])?$/,
    Currency: /^\d+(\.\d+)?$/,
    Number: /^\d+$/,
    zip: /^[0-9]\d{5}$/,
    qq: /^[1-9]\d{4,8}$/,
    integer: /^[-\+]?\d+$/,
    double: /^[-\+]?\d+(\.\d+)?$/,
    english: /^[A-Za-z]+$/,
    chinese: /^[\u0391-\uFFE5]+$/,
    unSafe: /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/,
    isSafe: function(str) {
        return ! this.unSafe.test(str);
    },
    safestring: "this.IsSafe(value)",
    limit: "this.limit(value.length,getAttribute('min'),  getAttribute('max'))",
    limitB: "this.limit(this.LenB(value), getAttribute('min'), getAttribute('max'))",
    date: "this.IsDate(value, getAttribute('min'), getAttribute('format'))",
    repeat: "value == document.getElementsByName(getAttribute('to'))[0].value",
    range: "getAttribute('min') < value && value < getAttribute('max')",
    compare: "this.compare(value,getAttribute('operator'),getAttribute('to'))",
    custom: "this.Exec(value, getAttribute('regexp'))",
    group: "this.MustChecked(getAttribute('name'), getAttribute('min'), getAttribute('max'))",
    ErrorItem: [document.forms[0]],
    ErrorMessage: ["Please write:\t\t\t\t\n"],
    Validate: function(theForm, mode) {

        var obj = theForm || event.srcElement;
        var count = obj.elements.length;

        this.ErrorMessage.length = 1;
        this.ErrorItem.length = 1;
        this.ErrorItem[0] = obj;
        for (var i = 0; i < count; i++) {
            with(obj.elements[i]) {
                var _dataType = getAttribute("datatype");
                if (typeof(_dataType) == "object" || typeof(this[_dataType]) == "undefined") continue;
                this.ClearState(obj.elements[i]);
                if (getAttribute("require") == "false" && value == "") continue;

                switch (_dataType) {
                    case "date":
                    case "repeat":
                    case "range":
                    case "compare":
                    case "custom":
                    case "group":
                    case "limit":
                    case "limitB":
                    case "safestring":
                        if (!eval(this[_dataType])) {
                            this.AddError(i, getAttribute("msg"));
                        }
                        break;
                    default:
                        if (!this[_dataType].test(value)) {
                            this.AddError(i, getAttribute("msg"));
                        }
                        break;
                }
            }
        }
        if (this.ErrorMessage.length > 1) {
            mode = mode || 1;
            var errCount = this.ErrorItem.length;
            switch (mode) {
                case 2:
                    for (var i = 1; i < errCount; i++) this.ErrorItem[i].style.color = "red";
                case 1:
                    alert(this.ErrorMessage.join("\n"));
                    this.ErrorItem[1].focus();
                    break;
                case 3:
                    for (var i = 1; i < errCount; i++) {
                        try {
                            var span = document.createElement("SPAN");
                            span.id = "__ErrorMessagePanel";
                            span.style.color = "red";
                            this.ErrorItem[i].parentNode.appendChild(span);
                            span.innerHTML = this.ErrorMessage[i].replace(/\d+:/, "*");
                        } catch(e) {
                            alert(e.description);
                        }
                    }
                    this.ErrorItem[1].focus();
                    break;
                default:
                    alert(this.ErrorMessage.join("\n"));
                    break;
            }
            return false;
        }
        return true;
    },
    limit: function(len, min, max) {
        min = min || 0;
        max = max || Number.MAX_VALUE;
        return min <= len && len <= max;
    },
    LenB: function(str) {
        return str.replace(/[^\x00-\xff]/g, "**").length;
    },
    ClearState: function(elem) {
        with(elem) {
            if (style.color == "red") style.color = "";
            var lastNode = parentNode.childNodes[parentNode.childNodes.length - 1];
            if (lastNode.id == "__ErrorMessagePanel") parentNode.removeChild(lastNode);
        }
    },
    AddError: function(index, str) {
        this.ErrorItem[this.ErrorItem.length] = this.ErrorItem[0].elements[index];
        this.ErrorMessage[this.ErrorMessage.length] = this.ErrorMessage.length + ":" + str;
    },
    Exec: function(op, reg) {
        return new RegExp(reg, "g").test(op);
    },
    compare: function(op1, operator, op2) {
        switch (operator) {
            case "NotEqual":
                return (op1 != op2);
            case "GreaterThan":
                return (op1 > op2);
            case "GreaterThanEqual":
                return (op1 >= op2);
            case "LessThan":
                return (op1 < op2);
            case "LessThanEqual":
                return (op1 <= op2);
            default:
                return (op1 == op2);
        }
    },

    MustChecked: function(name, min, max) {
        var groups = document.getElementsByName(name);
        var hasChecked = 0;
        min = min || 1;
        max = max || groups.length;
        for (var i = groups.length - 1; i >= 0; i--) if (groups[i].checked) hasChecked++;
        return min <= hasChecked && hasChecked <= max;
    },

    IsDate: function(op, formatString) {
        formatString = formatString || "ymd";
        var m, year, month, day;
        switch (formatString) {
            case "ymd":
                m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([-./])(\\d{1,2})\\4(\\d{1,2})$"));
                if (m == null) return false;
                day = m[6];
                month = m[5]--;
                year = (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
                break;
            case "dmy":
                m = op.match(new RegExp("^(\\d{1,2})([-./])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
                if (m == null) return false;
                day = m[1];
                month = m[3]--;
                year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
                break;
            default:
                break;
        }
        if (!parseInt(month)) return false;
        month = month == 12 ? 0 : month;
        var date = new Date(year, month, day);
        return (typeof(date) == "object" && year == date.getFullYear() && month == date.getMonth() && day == date.getDate());
        function GetFullYear(y) {
            return ((y < 30 ? "20": "19") + y) | 0;
        }
    }
}