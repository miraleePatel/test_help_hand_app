import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart' as d;
import '../Utils/constants.dart';



class DioAPIManager {

  Future<dynamic> multiPartRequest({
    required File file,
  }) async {
    if (kDebugMode) {
      print("File: ${file.path}");
    }
    var responseJson;
    String filename = file.path.split('/').last;
    if (kDebugMode) {
      print("filename: ${file.path.split('/').last}");
    }
    try {
      /// Show progress loader
      showProgressIndicator();

      var headers = {
        "Content-Type": "multipart/form-data",
        'Authorization':
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIwIiwibmFtZSI6InRhb2JhbzJ5b3UiLCJyb2xlIjoiYWRtaW4iLCJjdXN0b21lcmlkIjoiIiwiZXhwIjoxNjI2MTAyNzgwLCJpc3MiOiJ0YW9iYW8yeW91IiwiYXVkIjoiaHR0cHM6Ly93d3cudGFvYmFvMnlvdS5jb20ifQ.gIhTvIMLXxpq6bUFPbp242szDgPRl33SaF3k5f6T3-U",
      };

      d.Dio dio = d.Dio();
      var formData = d.FormData.fromMap({
        'file': await d.MultipartFile.fromFile(
          file.path,
          filename: filename,
        ),
      });
      if (kDebugMode) {
        print("url :::::: ${formData.files.first}");
      }
      d.Response response = await dio.post(
        "https://api.taobao2you.com/api/General/upload-file-with-type?UploadType=10",
        data: formData,
        options: d.Options(headers: headers),
      );

      if (kDebugMode) {
        print(response.data);
      }

      responseJson = _response(response);

      /// Check api response and handle exception
    } on SocketException {
      throw  errorSnackBar(message: 'No Internet Connection');
          } on TimeoutException catch (_) {
      throw errorSnackBar(message:'Server Error');
    } finally {
      /// dismiss progress loader
      EasyLoading.dismiss();
    }
    return responseJson;
  }

  /// Check response status and handle exception
  // static _response(d.Response response) {
  static _response(d.Response response) {
    // print(response.data);
    switch (response.statusCode) {
    /// Successfully get api response
      case 200:

          var responseJson = response.data;
          return responseJson;


    /// Successfully get api response
      case 201:
         var responseJson = response.data;
          return responseJson;
    /// Bad request need to check url
      case 400:
        return errorSnackBar(message: "Invalid request data");

    /// Authorisation token invalid
      case 403:
        return errorSnackBar(message: "Unauthorized access");


    /// Error occured while Communication with Server
      case 500:
        return errorSnackBar(message: "Unauthorized access");

      default:
        return errorSnackBar(message: "An error occurred while Communication with Server with StatusCode: ${response.statusCode}");
    }
  }


}
