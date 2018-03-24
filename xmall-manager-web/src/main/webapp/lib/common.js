/*刷新表格*/
function refresh(){
    var table = $('.table').DataTable();
    table.ajax.reload(null,false);// 刷新表格数据，分页信息不会重置
}

/*时间转换*/
function date(data){
    if(data==null||data==""){
        return "";
    }
    var time = new Date(data);
    var y = time.getFullYear();//年
    var m = time.getMonth() + 1;//月
    if (m >= 0 && m <= 9) {
        m = "0" + m;
    }
    var d = time.getDate();//日
    if (d >= 0 && d <= 9) {
        d = "0" + d;
    }
    var h = time.getHours();//时
    if (h >= 0 && h <= 9) {
        h = "0" + h;
    }
    var mm = time.getMinutes();//分
    if (mm >= 0 && mm <= 9) {
        mm = "0" + mm;
    }
    return (y+"-"+m+"-"+d+" "+h+":"+mm);
}

/*时间转换2*/
function dateAll(data){
    if(data==null||data==""){
        return "";
    }
    var time = new Date(data);
    var y = time.getFullYear();//年
    var m = time.getMonth() + 1;//月
    if (m >= 0 && m <= 9) {
        m = "0" + m;
    }
    var d = time.getDate();//日
    if (d >= 0 && d <= 9) {
        d = "0" + d;
    }
    var h = time.getHours();//时
    if (h >= 0 && h <= 9) {
        h = "0" + h;
    }
    var mm = time.getMinutes();//分
    if (mm >= 0 && mm <= 9) {
        mm = "0" + mm;
    }
    var ss = time.getSeconds();//秒
    if (ss >= 0 && ss <= 9) {
        ss = "0" + ss;
    }
    return (y+"-"+m+"-"+d+" "+h+":"+mm+":"+ss);
}