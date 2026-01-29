// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_error_model.dart';


// wallahy I will refactor this .. Omar Ahmed
enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  // الـ Constants دي كمان يفضل تتغير لو عايز تشيل كل التحذيرات
  static const String noContent = ApiErrors.noContent; 
  static const String badRequest = ApiErrors.badRequestError; 
  static const String unauthorised = ApiErrors.unauthorizedError; 
  static const String forbidden = ApiErrors.forbiddenError; 
  static const String internalServerError = ApiErrors.internalServerError; 
  static const String    notFound = ApiErrors.notFoundError; 

  // الـ Variables دي هي اللي مطلعالك الـ Error حالياً:
  static String connectTimeout = ApiErrors.timeoutError; // بدلاً من CONNECT_TIMEOUT
  static String cancel = ApiErrors.defaultError;         // بدلاً من CANCEL
  static String receiveTimeout = ApiErrors.timeoutError; // بدلاً من RECIEVE_TIMEOUT
  static String sendTimeout = ApiErrors.timeoutError;    // بدلاً من SEND_TIMEOUT
  static String cacheError = ApiErrors.cacheError;       // بدلاً من CACHE_ERROR
  static String noInternetConnection = ApiErrors.noInternetError; // بدلاً من NO_INTERNET_CONNECTION
  static String defaultError = ApiErrors.defaultError;   // بدلاً من DEFAULT
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(
            code: ResponseCode.NO_CONTENT, message: ResponseMessage.noContent);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(
            code: ResponseCode.BAD_REQUEST,
            message: ResponseMessage.badRequest);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(
            code: ResponseCode.FORBIDDEN, message: ResponseMessage.forbidden);
      case DataSource.UNAUTORISED:
        return ApiErrorModel(
            code: ResponseCode.UNAUTORISED,
            message: ResponseMessage.unauthorised);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(
            code: ResponseCode.NOT_FOUND, message: ResponseMessage.notFound);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            message: ResponseMessage.internalServerError);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            message: ResponseMessage.connectTimeout);
      case DataSource.CANCEL:
        return ApiErrorModel(
            code: ResponseCode.CANCEL, message: ResponseMessage.cancel);
      case DataSource.RECIEVE_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.RECIEVE_TIMEOUT,
            message: ResponseMessage.receiveTimeout);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(
            code: ResponseCode.SEND_TIMEOUT,
            message: ResponseMessage.sendTimeout);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(
            code: ResponseCode.CACHE_ERROR,
            message: ResponseMessage.cacheError);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            message: ResponseMessage.noInternetConnection);
      case DataSource.DEFAULT:
        return ApiErrorModel(
            code: ResponseCode.DEFAULT, message: ResponseMessage.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
    // case DioExceptionType.badResponse:
    //   return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}