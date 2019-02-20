

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/Constants.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/dio_manager.dart';
import 'package:rxdart/rxdart.dart';

class HttpService{
  Dio _dio = DioManager.getDioSingleInstance();

  CancelToken doTestRequest({void callback(Response<String> response) ,Map param}){
    CancelToken token = new CancelToken();
    Future<Response<String>> future =_dio.post(
        Constants.TEST_URL,
        options: defaultOptions(),
        data: param,
        cancelToken:token
    );
    future.then((response){
      Response<String> realResponse = response;
      callback(response);
    });
    return token;
  }

  Observable<Response<String>> doTestRequestRxDart(String url,{Map param,Options opt}){
    CancelToken token = new CancelToken();
    Future<Response<String>> future =_dio.post(
        Constants.TEST_GOOGLE_URL,
        options: defaultOptions(),
        data: param,
        cancelToken:token,
    );

    Observable<Response<String>> obs = Observable.fromFuture(future).doOnCancel((){
      print("token.cancel();");
      token.cancel();
    });
    return obs;
  }



  Options defaultOptions(){
    Options opt = new Options(contentType: ContentType.json,
      responseType: ResponseType.plain
    );
    return opt;
  }
}
