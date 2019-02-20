import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/model/weather.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/request/weather_request.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/common/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase{

  final StreamController<Weather> _streamController = StreamController<Weather>();

//  HomeBloc();

  requestData(){
    WeatherRequest request = new WeatherRequest();
    Observable<Response<String>> obs = request.doRequest();
    //    StreamSubscription subscription =
    obs.map<Weather>((Response<String> response){
      //将data转为实体
      Weather w = new Weather();//data
      print(response);
      return w;
    }).doOnListen(() {
      print("onListen,请求开始");
    }).doOnCancel((){
      print("onCancel,请求取消");
    }).listen((Weather weather) {
      _streamController.add(weather);
    }, onDone: () {
      print("onDone");
    }, onError: (Object error) {
      print(error);
    });

    //取消监听后自动取消请求。
//    subscription.cancel();
  }


  @override
  void dispose() {
    _streamController.close();
  }

}