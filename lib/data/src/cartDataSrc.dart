// ignore: file_names
import 'package:dio/dio.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/data/model/cart.dart';
import 'package:watchstore/utils/responseValidator.dart';

abstract class ICartDataSrc{
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> countCartItems();
  Future<String> payCard();
}

class CartRemoteDataSrc implements ICartDataSrc{
  
  final Dio httpClient;
  static const productIdJsonKey = 'product_id';

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<UserCart> addToCart({required int productId}) async =>
   await httpClient.post(EndPoints.addToCart,data: {productIdJsonKey : productId}).then((value) {

      HTTPResponseValidator.isValidStatusCode(value.statusCode??0);
      return UserCart.fromJson(value.data['data']);
    },);

  @override
  Future<UserCart> deleteFromCart({required int productId}) async => 
  await httpClient.post(EndPoints.deleteFromCart,data: {productIdJsonKey : productId}).then((value) {
      
      HTTPResponseValidator.isValidStatusCode(value.statusCode??0);
      return UserCart.fromJson(value.data['data']);
    },);

  @override
  Future<UserCart> getUserCart() async {

    final response = await httpClient.post(EndPoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<UserCart> removeFromCart({required int productId}) async =>
  await httpClient.post(EndPoints.removeFromCart,data: {productIdJsonKey : productId}).then((value) {

      HTTPResponseValidator.isValidStatusCode(value.statusCode??0);
      return UserCart.fromJson(value.data['data']);
    },);
  
  @override
  Future<int> countCartItems() async {
    final response = await httpClient.post(EndPoints.userCart);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }
  
  @override
  Future<String> payCard() async {
      final response = await httpClient.post(EndPoints.payment);
      HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
      return response.data['action'];
  }

}