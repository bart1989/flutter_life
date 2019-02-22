import 'dart:async';
import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/model/location_model.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/model/weather_model.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/request/location_request.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/home/request/weather_request.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/common/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
//import 'package:location/location.dart';
import 'package:amap_location/amap_location.dart';

class HomeBloc implements BlocBase{

  final PublishSubject<Weather> _streamController = PublishSubject<Weather>();//创建流
  StreamSink<Weather> get steamSink => _streamController.sink;//用于往流里扔
  Stream<Weather> get outSteam => _streamController.stream;//用于输出流


//  HomeBloc();

  Observable<Weather> requestWeatherData(String locationInfoStr){
    WeatherRequest request = new WeatherRequest();
    request.locationInfoStr = locationInfoStr;
    Observable<Response<String>> obs = request.doRequest();//.asBroadcastStream();
    Observable<Weather> weatherObs = obs.map<Weather>((Response<String> response){
      print(response.data);
      print('=================================================');
      Map map = json.decode(response.data.toString());
      String retCode = map['retCode'];
      if(retCode == "200"){
        //将data转为实体
        List results = map['result'];
        List<Weather> weatherList= new List<Weather>();
        for(int i=0;i<results.length;i++){
          Map weatherMap = results[i];
          Weather w = Weather.fromJson(weatherMap);
          weatherList.add(w);
        }

        Weather weather = weatherList[0];
        return weather;
      }
      //不是200就暂时不给下游任何数据
    });
    weatherObs.doOnListen(() {
      print("weatherObs,开始监听");
    }).doOnCancel((){
      print("weatherObs,取消监听");
    });
    return weatherObs;
  }




  Observable<LocationModel> locationAddress(String locationStr){
    LocationRequest request = new LocationRequest();
    request.locationStr = locationStr;
    Observable<Response<String>> obs = request.doRequest();//.asBroadcastStream();
    Observable<LocationModel> locationModelObs = obs.map<LocationModel>((Response<String> response){
      print(response.data);
      Map map = json.decode(response.data.toString());
      int retCode = map['status'];
      if(retCode == 0){
        //将data转为实体
        Map result = map['result'];
        LocationModel model = LocationModel.fromJson(result);
        return model;
      }
      //不是200就暂时不给下游任何数据
    });

    locationModelObs.doOnListen(() {
      print("locationModelObs,开始监听");
    }).doOnCancel((){
      print("locationModelObs,取消监听");
    });
    return locationModelObs;
  }

  void requestLocation() {
     AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters))
         .then((bool flag){
       Observable<AMapLocation> obs = Observable.fromFuture(AMapLocationClient.getLocation(true));
       obs.flatMap((AMapLocation locationData){
         String locationStr = locationData.latitude.toString()+","+locationData.longitude.toString();
         print("locationStr:"+locationStr);
         return locationAddress(locationStr);
       }).flatMap((LocationModel model){
         String province = model.addressComponent.province.replaceAll(new RegExp('省'), "").replaceAll(new RegExp('市'), "");
         String city = model.addressComponent.city.replaceAll(new RegExp('市'), "").replaceAll(new RegExp('区'), "");;
         String locationInfoStr = "city="+city+"&province="+province;
         print("locationInfoStr:"+locationInfoStr);
         return requestWeatherData(locationInfoStr);
       }).doOnListen((){
         print("开始监听，展示个loading");
       }).doOnCancel((){
         print("取消监听，取消个loading");

       }).listen((Weather weather){
         print(weather);
         steamSink.add(weather);
       });
     });

/*
    var location = new Location();
    //检查权限，iOS设备会在第一次调用时弹出允许对话框
    location.hasPermission().then((bool flag){
      print("是否有权限呢？   "+flag.toString());
    });

    try {
      Observable<LocationData> obs = Observable.fromFuture(location.getLocation());
      obs.flatMap((LocationData locationData){
        String locationStr = locationData.latitude.toString()+","+locationData.longitude.toString();
        print("locationStr:"+locationStr);
        return locationAddress(locationStr);
      }).flatMap((LocationModel model){
        String province = model.addressComponent.province.replaceAll(new RegExp('省'), "").replaceAll(new RegExp('市'), "");
        String city = model.addressComponent.city.replaceAll(new RegExp('市'), "").replaceAll(new RegExp('区'), "");;
        String locationInfoStr = "city="+city+"&province="+province;
        print("locationInfoStr:"+locationInfoStr);
        return requestWeatherData(locationInfoStr);
      }).doOnListen((){
        print("开始监听，展示个loading");
      }).doOnCancel((){
        print("取消监听，取消个loading");

      }).listen((Weather weather){
        print(weather);
        steamSink.add(weather);
      });
    } on Exception {
      location = null;
    }
    */
  }

  @override
  void dispose() {
    _streamController.close();
  }

}