import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchstore/data/model/cart.dart';
import 'package:watchstore/data/repo/cartRepo.dart';
import 'package:watchstore/screens/register/cubit/register_cubit.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _iCartRepository;

  CartBloc(this._iCartRepository) : super(CartInitialState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitialState) {
  emit(CartLoadingState());
  final cartList = await _iCartRepository.getUserCart();
  emit(CartLoadedState(cartList));
} else if(event is RemoveFromCartEvent){
  await _iCartRepository.removeFromCart(productId: event.productId).then((value) => emit(CartItemRemoveState(value)),);
} else if (event is DeleteFromCartEvent){
  await _iCartRepository.deleteFromCart(productId: event.productId).then((value) => emit(CartItemDeleteState(value)),);
} else if(event is AddToCartEvent){
  await _iCartRepository.addToCart(productId: event.productId).then((value) => emit(CartItemAddState(value)),);
} else if(event is CartItemCountEvent){
  await _iCartRepository.countCartItems().then((value) => emit(CartCountState()),);
} else if(event is CartPayEvent){
  await _iCartRepository.payCard().then((value) => emit(RecivedPayLinkState(value)),);
}
      } catch (e) {
        emit(CartErrorState());
      }
    });
  }
}
