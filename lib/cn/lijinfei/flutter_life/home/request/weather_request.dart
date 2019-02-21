import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/base_request.dart';

class WeatherRequest extends BaseRequest{
  String locationInfoStr;
  @override
  Object getParams() {

    return null;
  }

  @override
  String requestUrl() {

//    return "http://apicloud.mob.com/v1/weather/query?key=29c3df55e11f5&city=海淀&province=北京";
//  return "http://www.google.com.hk";
    return "http://apicloud.mob.com/v1/weather/query?key=29c3df55e11f5&"+locationInfoStr;
//  return "http://llls.cjsjf.cis";
  }
  @override
  String requestType(){
    return "GET";
  }

}