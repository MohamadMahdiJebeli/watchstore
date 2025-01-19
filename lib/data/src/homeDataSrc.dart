import 'package:dio/dio.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/data/model/home.dart';
import 'package:watchstore/utils/responseValidator.dart';

abstract class IHomeDataSrc{
  Future<HomeModel> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc{
  
  final Dio httpClient;

  HomeRemoteDataSrc(this.httpClient);
  
  @override
  Future<HomeModel> getHome() async {

    final HomeModel home;

    final response = await httpClient.get(EndPoints.home);
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    home = HomeModel.fromJson(response.data['data']);
    return home; 
  }

}