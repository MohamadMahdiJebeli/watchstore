import 'package:dio/dio.dart';
import 'package:watchstore/utils/sharedPreferencesKey.dart';
import 'package:watchstore/utils/sharedPreferencesManger.dart';

class AuthInterceptor extends Interceptor {
  
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) async {
    String? token = SharedPreferencesManager().getString(SharedPreferencesKey.token);

    if (token!= null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}

class DioManager {
  static final Dio _dio = Dio();
  
  static Dio get dio{
    _dio.interceptors.add(AuthInterceptor());
    return _dio;
  }
}