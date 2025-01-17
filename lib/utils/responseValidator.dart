import 'package:watchstore/res/appStrings.dart';

class HTTPResponseValidator{
  static bool isValidStatusCode(int statusCode){
    if (statusCode>=200 && statusCode<300) {
      return true;
    } else {
      throw HTTPExpetion(statusCode);
    }
  }
}

class HTTPExpetion implements Exception {
  final int statusCode;
  HTTPExpetion(this.statusCode);

  @override
  String toString(){
    String massage;

    switch (statusCode) {
      case 400:
        massage = "Bad Request";
        break;

      case 401:
        massage = "Unauthorized";
        break;

      case 403:
        massage = "Forbidden";
        break;

      case 409:
        massage = "Conflict";
        break;
      
      case 500:
        massage = "Internal Server Error";
        break;

      default:
        massage = AppStrings.error;
    }
    return "HTTPExpetion: Status Code $statusCode, :$massage";
  }
}