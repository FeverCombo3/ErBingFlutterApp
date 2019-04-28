import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_project/net/Code.dart';
import 'package:flutter_project/net/ResultData.dart';
import 'package:flutter_project/style/Config.dart';

class HttpManager{

  static const CONTENT_TYPE_JSON = "application/json";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token":null,
  };

  static netFetch(url,params,Map<String,String> header,Options option,{noTip = false}) async{

    var connectivityResult = await (new Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.none){
      return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),false,Code.NETWORK_ERROR);
    }

    Map<String,String> headers = new HashMap();
    if(header != null){
      headers.addAll(header);
    }

    if(option != null){
      option.headers = headers;
    }else{
      option = new Options(method: "get");
      option.headers = headers;
    }

    option.connectTimeout = 15000;

    Dio dio = new Dio();
    Response response;
    try{
      response = await dio.request(url,data: params,options: option);
    } on DioError catch (e){
      Response errorResponse;
      if(e.response != null){
        errorResponse = e.response;
      }else{
        errorResponse = new Response(statusCode: 666);
      }
      if(e.type == DioErrorType.CONNECT_TIMEOUT){
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if(Config.DEBUG){
        print('请求url：' + url);
        print('请求头: ' + option.headers.toString());
        if(params != null){
          print('请求参数：' + params.toString());
        }
        if(response != null){
          print('返回参数：' + response.toString());
        }
      }
    }

    try {
      if (option.contentType != null && option.contentType.primaryType == "text") {
        return new ResultData(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + url);
      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
    }

    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
  }
}