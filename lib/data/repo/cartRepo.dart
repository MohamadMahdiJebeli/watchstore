import 'package:flutter/material.dart';
import 'package:watchstore/data/conf/remoteConf.dart';
import 'package:watchstore/data/model/cart.dart';
import 'package:watchstore/data/src/cartDataSrc.dart';

abstract class ICartRepository{
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> countCartItems();
  Future<String> payCard();
}

class CartRepo implements ICartRepository{
  final ICartDataSrc _iCartDataSrc;

  ValueNotifier<int> cartCount = ValueNotifier(0);
  CartRepo(this._iCartDataSrc);
  
  @override
  Future<UserCart> addToCart({required int productId})=>_iCartDataSrc.addToCart(productId: productId).then((value) {
    cartCount.value = value.cartList.length;
    return value;
  },);
  
  @override
  Future<UserCart> deleteFromCart({required int productId})=> _iCartDataSrc.deleteFromCart(productId: productId).then((value) {
    cartCount.value = value.cartList.length;
    return value;
  },);
  
  @override
  Future<UserCart> getUserCart()=> _iCartDataSrc.getUserCart();
  
  @override
  Future<UserCart> removeFromCart({required int productId}) => _iCartDataSrc.removeFromCart(productId: productId);
  
  @override
  Future<int> countCartItems()=> _iCartDataSrc.countCartItems().then((value) => cartCount.value = value,);
  
  @override
  Future<String> payCard()=> _iCartDataSrc.payCard();

}

final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));