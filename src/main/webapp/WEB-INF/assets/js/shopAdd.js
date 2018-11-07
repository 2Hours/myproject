
$('.imgNav').eq(0).show();

var index = 0;
var type = 1;
$('.tab li').click(function () {
	type = $(this).data("type");
     index = $(this).index();
    console.log($(this).index());
    $(this).addClass('active').siblings().removeClass('active');
    $('.imgNav').eq(index).show().siblings('.imgNav').hide();

});






//创建地图
var longitude = '';
var latitude = '';
//$('.getAddress').click(function () {
//    if($('.address').val() ==''){
//        alert('请输入地址');
//        return
//    }
//    getLat()
//});
function getLat() {
    var map = new BMap.Map("mapContent"); // 创建地图实例
    var point = new BMap.Point(116.404, 39.915); // 创建点坐标
    map.centerAndZoom(point, 15);
    map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
    var geoc = new BMap.Geocoder();
    var anme = $("#address").val();
    geoc.getPoint(anme, function(point){
        if (point) {

            latitude = point.lat;
            longitude = point.lng;
            console.log(longitude);
            map.centerAndZoom(point, 16);
            map.addOverlay(new BMap.Marker(point));
        }else{
            alert("您选择地址没有解析到结果!");
        }
    }, "北京市");
}


