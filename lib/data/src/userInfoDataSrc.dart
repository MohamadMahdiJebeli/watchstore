import 'package:dio/dio.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/data/model/adderess.dart';
import 'package:watchstore/data/model/order.dart';
import 'package:watchstore/data/model/userInfo.dart';
import 'package:watchstore/utils/responseValidator.dart';

abstract class IUserInfoDataSrc{
  Future<UserInfoModel> getUserInfo();
  Future<AddressModel> getUserAddress();
  Future<OrderModel> userReciveOrder();
  Future<OrderModel> userCancelledOrders();
  Future<OrderModel> userProcessingOrders();
}

class UserInfoRemoteDataSrc implements IUserInfoDataSrc{

  final Dio httpClient;

  UserInfoRemoteDataSrc(this.httpClient);

  @override
  Future<AddressModel> getUserAddress() => throw UnimplementedError();

 @override
  Future<UserInfoModel> getUserInfo() async => 
    await httpClient.post(EndPoints.profile).then((value) {
      HTTPResponseValidator.isValidStatusCode(value.statusCode ?? 0);

      return UserInfoModel.fromJson(value.data['data']['user_info']);
    });
  @override
  Future<OrderModel> userCancelledOrders() {
    // TODO: implement userCancelledOrders
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> userProcessingOrders() {
    // TODO: implement userProcessingOrders
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> userReciveOrder() {
    // TODO: implement userReciveOrder
    throw UnimplementedError();
  }

}
