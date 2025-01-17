import 'package:watchstore/data/conf/remoteConf.dart';
import 'package:watchstore/data/model/adderess.dart';
import 'package:watchstore/data/model/order.dart';
import 'package:watchstore/data/model/userInfo.dart';
import 'package:watchstore/data/src/userInfoDataSrc.dart';

abstract class IUserInfoRepo{
  Future<UserInfoModel> getUserInfo();
  Future<AddressModel> getUserAddress();
  Future<OrderModel> userReciveOrder();
  Future<OrderModel> userCancelledOrders();
  Future<OrderModel> userProcessingOrders();
}

class UserInfoRepository implements IUserInfoRepo{
  final IUserInfoDataSrc _userInfoDataSrs;

  UserInfoRepository(this._userInfoDataSrs);
  
  @override
  Future<AddressModel> getUserAddress() => _userInfoDataSrs.getUserAddress();

  @override
  Future<UserInfoModel> getUserInfo() => _userInfoDataSrs.getUserInfo();

  @override
  Future<OrderModel> userCancelledOrders() => _userInfoDataSrs.userCancelledOrders();

  @override
  Future<OrderModel> userProcessingOrders() => _userInfoDataSrs.userProcessingOrders();

  @override
  Future<OrderModel> userReciveOrder() => _userInfoDataSrs.userReciveOrder();

}

final userInfoRepository = UserInfoRepository(UserInfoRemoteDataSrc(DioManager.dio));