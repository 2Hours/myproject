function post(url, data, fun) {
    $.ajax({
        url:url,
        data:data,
        type:"POST",
        dataType:"JSON",
        success:function (data) {
            console.log(data.code+"  "+data.result);
            if (data.code==0) {
                fun(data);
            }else {
                console.log(JSON.stringify(data));
                alert(data.message);
            }
        },
        error:function (data) {
            alert("网络异常");
        }
    })
}
function getUserType(type) {
    //1、会员 2、平台  3、商家    4、区运营中心  5、报单中心  6、代理商
    var typeName='';
    switch (type) {
        case 1:
            typeName = "会员";
            break;
        case 2:
            typeName = "平台";
            break;
        case 3:
            typeName = "商家";
            break;
        case 4:
            typeName = "区运营中心";
            break;
        case 5:
            typeName = "报单中心";
            break;
        case 6:
            typeName = "代理商";
            break;
    }
    return typeName;
}
function getAccountType(typeInt) {
    var type=typeInt;
    //1、分润   2、提现审核中  3、支付  4、奖金分润  5、奖金提现   6、提现成功
    switch (typeInt){
        case 10:
            type="分润";
            break;
        case 41:
            type="提现审核中";
            break;
        case 20:
            type="支付";
            break;
        case 11:
            type="奖金分润";
            break;
        case 50:
            type="奖金提现";
            break;
        case 42:
            type="提现成功";
            break
    }
    return type;
}
//审核状态：1、待审核  2、审核通过  3、审核不通过
function getAuditStatus(typeInt) {
    var type=typeInt;
    switch (typeInt){
        case 1:
            type="待审核";
            break;
        case 2:
            type="审核通过";
            break;
        case 3:
            type="审核不通过";
            break;
    }
    return type;
}
//商家营业状态：1、营业中   2、休息中
function getWorkStatus(typeInt) {
    var type=typeInt;
    switch (typeInt){
        case 1:
            type="营业中";
            break;
        case 2:
            type="休息中";
            break;
    }
    return type;
}
