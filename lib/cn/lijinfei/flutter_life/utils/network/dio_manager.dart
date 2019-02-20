import 'package:dio/dio.dart';

class DioManager {
  static Dio _dio;
  static Dio getDioSingleInstance(){
    if(_dio==null){
      _dio = new Dio();
      //拦截器添加
      _dio.interceptors.add(InterceptorsWrapper(
          onRequest:(RequestOptions options){
            // Do something before request is sent
            return options; //continue
            // If you want to resolve the request with some custom data，
            // you can return a `Response` object or return `dio.resolve(data)`.
            // If you want to reject the request with a error message,
            // you can return a `DioError` object or return `dio.reject(errMsg)`
          },
          onResponse:(Response response) {
            // Do something with response data
            return response; // continue
          },
          onError: (DioError e) {
            // Do something with response error
            return  e;//continue
          }
      ));

    }
    return _dio;
  }
}