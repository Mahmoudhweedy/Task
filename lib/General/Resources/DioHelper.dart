import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:task/General/Constants/LoadingDialog.dart';
import 'package:task/General/utilities/CachHelper.dart';
import 'package:task/General/utilities/GlobalState.dart';

class DioHelper {
  Dio? _dio;
  final bool forceRefresh;
  final baseUrl = "http://207.244.243.120:9031/api/";

  DioHelper({this.forceRefresh = true}) {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(baseUrl: baseUrl, contentType: "application/json"),
      )..interceptors.add(LogInterceptor(responseBody: true));
    }
  }

  Future<dynamic> get(String url) async {
    _dio?.options.headers = await _getHeader();

    try {
      var response = await _dio!.get("$baseUrl$url");
      print("response ${response.statusCode}");
      var data = response.data;
      if (data != null) {
        return data;
      } else {
        EasyLoading.showToast('Error');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301) {
        tokenExpired();
      } else {
        print("FAIL");
      }
    }
    return null;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    if (showLoader) LoadingDialog.showLoadingDialog();
    _printRequestBody(body);

    try {
      var response = await _dio!.post("$baseUrl$url", data: jsonEncode(body));
      print("response ${response.statusCode}");
      if (showLoader) EasyLoading.dismiss();
      EasyLoading.showToast('SUCCESS!');
      if (response.data["responseCode"] == 1) return response.data;
    } on DioError catch (e) {
      if (showLoader) EasyLoading.dismiss();
      if (e.response?.statusCode == 401 || e.response?.statusCode == 301) {
        tokenExpired();
      } else {
        EasyLoading.showToast('Error');
      }
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    print(
        "-------------------------------------------------------------------");
    print(body);
    print(
        "-------------------------------------------------------------------");
  }

  _getHeader() async {
    String token = GlobalState.instance.get("token");
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void tokenExpired() {
    CachHelper.clearData();
    // ExtendedNavigator.root.push(Routes.login);
  }
}
