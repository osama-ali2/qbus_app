import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:qbus/models/error_model/ValidatingErrorResponse.dart';
import '../models/error_model/ErrorResponse.dart';
import '../res/strings.dart';
import '../res/toasts.dart';
import 'models.dart';

class MyApi {
  static Future<dynamic> callPostApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.post(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic modelobj =
                await Models.getModelObject(modelName, _response.data);
            if (modelobj.code == 1) {
              return modelobj;
            } else {
              Toasts.getErrorToast(text: modelobj.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            ErrorResponse errorResponse = await Models.getModelObject(
                Models.errorModel, ex.response?.data);
            Toasts.getErrorToast(text: errorResponse.data?.message);
            if (errorResponse.code == 0) {
              return errorResponse;
            } else {
              Toasts.getErrorToast(text: errorResponse.message);
            }
            return null;
          case 401:
            ValidatingErrorResponse validatingErrorResponse =
                await Models.getModelObject(
                    Models.validateErrorModel, ex.response?.data);
            validatingErrorResponse.data!.validateErrors!.map((res) {
              Toasts.getErrorToast(text: res.toString());
            });
            if (validatingErrorResponse.code == 0) {
              return validatingErrorResponse;
            } else {
              Toasts.getErrorToast(text: validatingErrorResponse.message);
            }

            return null;
          case 500:
            Toasts.getErrorToast(text: "Internal Server Error");
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  static Future<dynamic> callGetApi(
      {String? url,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.get(url!,
            options: Options(headers: myHeaders), queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic getModelObj =
                await Models.getModelObject(modelName, _response.data);
            if (getModelObj.code == 1) {
              return getModelObj;
            } else {
              Toasts.getErrorToast(text: getModelObj.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: "No internet");
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 500:
            Toasts.getErrorToast(text: "Internal Server Error");
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return;
    }
  }

  static Future<dynamic> callPutApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.put(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic modelobj =
                await Models.getModelObject(modelName, _response.data);
            if (modelobj.code == 1) {
              return modelobj;
            } else {
              Toasts.getErrorToast(text: modelobj.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 500:
            Toasts.getErrorToast(text: "Internal Server Error");
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }

  //   Delete
  static Future<dynamic> callDeleteApi(
      {String? url,
      dynamic body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? myHeaders,
      dynamic modelName}) async {
    try {
      var dio = Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        Response _response = await dio.delete(url!,
            options: Options(headers: myHeaders),
            data: body,
            queryParameters: parameters);
        switch (_response.statusCode) {
          case 200:
            dynamic modelobj =
                await Models.getModelObject(modelName, _response.data);
            if (modelobj.code == 1) {
              return modelobj;
            } else {
              Toasts.getErrorToast(text: modelobj.message);
            }
            return null;

          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.noInternetError);
        return null;
      }
    } on DioError catch (ex) {
      if (ex.response != null) {
        ErrorResponse errorResponse =
            await Models.getModelObject(Models.errorModel, ex.response?.data);
        switch (ex.response!.statusCode) {
          case 400:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          case 401:
            Toasts.getErrorToast(text: errorResponse.data?.message);
            return null;
          default:
            Toasts.getErrorToast(text: Strings.badHappenedError);
            return null;
        }
      } else {
        Toasts.getErrorToast(text: Strings.badHappenedError);
      }
    } on Exception {
      Toasts.getErrorToast(text: Strings.badHappenedError);
      return null;
    }
  }
}
