import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/Constants.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/dio_manager.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseRequest{

  Observable<Response<String>> doRequest({CancelToken token}){
    Dio dio = DioManager.getDioSingleInstance();
    Future<Response<String>> future;
    if(requestType()=="POST"){
      future =dio.post(
        requestUrl(),
        options: requestOptions(),
        data: getParams(),
        cancelToken:token,
      );
    }else if(requestType()=="GET"){
      future =dio.get(
        requestUrl(),
        options: requestOptions(),
        cancelToken:token,
      );
    }

    Observable<Response<String>> obs = Observable.fromFuture(future);
    return obs;
  }

  String requestUrl();

  Object getParams();

  Options requestOptions(){
    Options opt = new Options(
        contentType: ContentType.json,
        responseType: ResponseType.plain
    );
    return opt;
  }

  String requestType(){
    return "POST";
  }


}