import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/Constants.dart';
import 'package:flutter_life/cn/lijinfei/flutter_life/utils/network/dio_manager.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseRequest{

  Observable<Response<String>> doRequest(){
    Dio dio = DioManager.getDioSingleInstance();
    CancelToken token = new CancelToken();
    Future<Response<String>> future =dio.post(
      requestUrl(),
      options: requestOptions(),
      data: getParams(),
      cancelToken:token,
    );
    Observable<Response<String>> obs = Observable.fromFuture(future).doOnCancel((){
      print("token.cancel();");
      token.cancel();
    });
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

}