import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/base_request.dart';

class WeatherRequest extends BaseRequest{
  @override
  Object getParams() {
    // TODO: implement getParams
    return null;
  }

  @override
  String requestUrl() {
    // TODO: implement requestUrl
    return "http://apicloud.mob.com/v1/weather/query?key=29c3df55e11f5&city=海淀&province=北京";
  }

}