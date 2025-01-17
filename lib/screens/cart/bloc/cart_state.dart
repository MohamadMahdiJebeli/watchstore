part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

final class CartInitialState extends CartState {}
final class CartLoadingState extends CartState {}

final class CartLoadedState extends CartState {
  final UserCart userCart;

  const CartLoadedState(this.userCart);

  @override
  List<Object> get props => [userCart];
}

final class CartErrorState extends CartState{}

final class CartItemDeleteState extends CartState{
  final UserCart userCart;

  const CartItemDeleteState(this.userCart);

  @override
  List<Object> get props => [userCart];
}

final class CartItemRemoveState extends CartState{
  final UserCart userCart;

  const CartItemRemoveState(this.userCart);

  @override
  List<Object> get props => [userCart];
}

final class CartItemAddState extends CartState{
  final UserCart userCart;
  const CartItemAddState(this.userCart);

  @override
  List<Object> get props => [userCart];
}

final class CartCountState extends CartState{}
final class RecivedPayLinkState extends CartState{
  final String url;

  const RecivedPayLinkState(this.url);

  @override
  List<Object> get props => [url];
}