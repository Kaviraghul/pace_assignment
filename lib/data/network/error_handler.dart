// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:pace_assignment/data/network/failure.dart';

enum DataSource {
  OK,
  API_KEY_DISABLES,
  API_KEY_EXHAUSTED,
  API_KEY_INVALID,
  API_KEY_MISSING,
  PARAMETER_INVALID,
  PARAMETERS_MISSING,
  RATE_LIMITED,
  SOURCES_TOO_MANY, 
  SOURCE_DOES_NOT_EXIST,
  UNEXPECTED_ERROR,

  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode{

  // API status code

  static const String OK                     = "ok";  // success with data
  static const String API_KEY_DISABLES       = "apiKeyDisabled";  
  static const String API_KEY_EXHAUSTED      = "apiKeyExhausted";  
  static const String API_KEY_INVALID        = "apiKeyInvalid";  
  static const String API_KEY_MISSING        = "apiKeyMissing";  
  static const String PARAMETER_INVALID      = "parameterInvalid";  
  static const String PARAMETERS_MISSING     = "parametersMissing";  
  static const String RATE_LIMITED           = "rateLimited";  
  static const String SOURCES_TOO_MANY       = "sourcesTooMany";  
  static const String SOURCE_DOES_NOT_EXIST  = "sourceDoesNotExist";  
  static const String UNEXPECTED_ERROR       = "unexpectedError";  

  // Local status code  for network layer and interlogics

  static const String DEFAULT                = "-1";
  static const String CONNECT_TIMEOUT        = "-2";
  static const String CANCEL                 = "-3";
  static const String RECIEVE_TIMEOUT        = "-4";
  static const String SEND_TIMEOUT           = "-5";
  static const String CACHE_ERROR            = "-6";
  static const String NO_INTERNET_CONNECTION = "-7";

}





class ResponseMessage{

  // API status code

  static const String OK                     = "The request was executed successfully.";  // success with data
  static const String API_KEY_DISABLES       = "Your API key has been disabled.";  
  static const String API_KEY_EXHAUSTED      = "Your API key has no more requests available.";  
  static const String API_KEY_INVALID        = "Your API key hasn't been entered correctly.";  
  static const String API_KEY_MISSING        = "Your API key is missing from the request.";  
  static const String PARAMETER_INVALID      = "You've included a parameter in your request which is currently not supported.";  
  static const String PARAMETERS_MISSING     = "Required parameters are missing from the request and it cannot be completed.";  
  static const String RATE_LIMITED           = "You have been rate limited. Back off for a while before trying the request again.";  
  static const String SOURCES_TOO_MANY       = "You have requested too many sources in a single request.";  
  static const String SOURCE_DOES_NOT_EXIST  = "You have requested a source which does not exist.";  
  static const String UNEXPECTED_ERROR       = "This shouldn't happen, and if it does then it's our fault, not yours. Try the request again shortly.";

  // Local status code  for network layer and interlogics

  static const String DEFAULT                = "something went wrong, try again later";
  static const String CONNECT_TIMEOUT        = "time out error, try again later";
  static const String CANCEL                 = "request was cancelled, try again later";
  static const String RECIEVE_TIMEOUT        = "time out error, try again later";
  static const String SEND_TIMEOUT           = "time out error, try again later";
  static const String CACHE_ERROR            = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";

}

extension DataSourceExtension on DataSource{
  Failure getFailure(){
    switch(this){
      case DataSource.API_KEY_DISABLES:
         return Failure(ResponseCode.API_KEY_DISABLES, ResponseMessage.API_KEY_DISABLES);
      case DataSource.API_KEY_EXHAUSTED:
         return Failure(ResponseCode.API_KEY_EXHAUSTED, ResponseMessage.API_KEY_EXHAUSTED);
      case DataSource.API_KEY_INVALID:
         return Failure(ResponseCode.API_KEY_INVALID, ResponseMessage.API_KEY_INVALID);
      case DataSource.API_KEY_MISSING:
         return Failure(ResponseCode.API_KEY_MISSING, ResponseMessage.API_KEY_MISSING);
      case DataSource.PARAMETER_INVALID:
         return Failure(ResponseCode.PARAMETER_INVALID, ResponseMessage.PARAMETER_INVALID);
      case DataSource.PARAMETERS_MISSING:
         return Failure(ResponseCode.PARAMETERS_MISSING, ResponseMessage.PARAMETERS_MISSING);
      case DataSource.RATE_LIMITED:
         return Failure(ResponseCode.RATE_LIMITED, ResponseMessage.RATE_LIMITED);
      case DataSource.SOURCES_TOO_MANY:
         return Failure(ResponseCode.SOURCES_TOO_MANY, ResponseMessage.SOURCES_TOO_MANY);
      case DataSource.SOURCE_DOES_NOT_EXIST:
         return Failure(ResponseCode.SOURCE_DOES_NOT_EXIST, ResponseMessage.SOURCE_DOES_NOT_EXIST);
      case DataSource.UNEXPECTED_ERROR:
         return Failure(ResponseCode.UNEXPECTED_ERROR, ResponseMessage.UNEXPECTED_ERROR);
      case DataSource.CONNECT_TIMEOUT:
         return Failure(ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
         return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
         return Failure(ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
         return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
         return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
         return Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
         return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
    }
}



class ErrorHandler implements Exception{
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      failure = _handleError(error);
    }else{
      failure = DataSource.DEFAULT.getFailure();
    } 
  }

  Failure _handleError(DioError error){
    switch(error.type){

      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECIEVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch(error.error){
          case ResponseCode.API_KEY_DISABLES:
            return DataSource.API_KEY_DISABLES.getFailure();
          case ResponseCode.API_KEY_EXHAUSTED:
            return DataSource.API_KEY_EXHAUSTED.getFailure();
          case ResponseCode.API_KEY_INVALID:
            return DataSource.API_KEY_INVALID.getFailure();
          case ResponseCode.API_KEY_MISSING:
            return DataSource.API_KEY_MISSING.getFailure();
          case ResponseCode.PARAMETER_INVALID:
            return DataSource.PARAMETER_INVALID.getFailure();
          case ResponseCode.PARAMETERS_MISSING:
            return DataSource.PARAMETERS_MISSING.getFailure();
          case ResponseCode.RATE_LIMITED:
            return DataSource.RATE_LIMITED.getFailure();
          case ResponseCode.SOURCES_TOO_MANY:
            return DataSource.SOURCES_TOO_MANY.getFailure();
          case ResponseCode.SOURCE_DOES_NOT_EXIST:
            return DataSource.SOURCE_DOES_NOT_EXIST.getFailure();
          case ResponseCode.UNEXPECTED_ERROR:
            return DataSource.UNEXPECTED_ERROR.getFailure();
            
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}



class ApiInternalStatus{
  static const String OK = "ok";
  static const String ERROR = "error";
}