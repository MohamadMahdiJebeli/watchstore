import 'package:dio/dio.dart';
import 'package:watchstore/data/model/home.dart';
import 'package:watchstore/data/src/homeDataSrc.dart';

abstract class IHomeRepo{
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepo{
  
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);
  
  @override
  Future<HomeModel> getHome() => _homeDataSrc.getHome();
}

final homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));