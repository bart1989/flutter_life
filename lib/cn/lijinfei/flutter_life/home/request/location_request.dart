import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/base_request.dart';

class LocationRequest extends BaseRequest{
  String locationStr;

  @override
  Object getParams() {

    return null;
  }

  @override
  String requestUrl() {
//    return "http://apicloud.mob.com/v1/weather/query?key=29c3df55e11f5&city=海淀&province=北京";
//  return "http://www.google.com.hk";
    //逆地理编码接口
    //http://api.map.baidu.com/geocoder/v2/?location=35.658651,139.745415&output=json&pois=1&ak=XbAUcnuvVrazheaNFpdCWmL9
    return "http://api.map.baidu.com/geocoder/v2/?output=json&pois=1&ak=XbAUcnuvVrazheaNFpdCWmL9&coordtype=wgs84ll&location="+locationStr;
//  return "http://llls.cjsjf.cis";
  }
  @override
  String requestType(){
    return "GET";
  }

}