import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchstore/data/model/productDetails.dart';
import 'package:watchstore/data/repo/productRepo.dart';
import 'package:watchstore/screens/productSingle/bloc/product_single_event.dart';

part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepo _iProductReop;

  ProductSingleBloc(this._iProductReop) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInit) {
        try {
          emit(ProductSingleLoading());
          final productDetailes =
              await _iProductReop.getProductDetails(event.id);
          emit(ProductSingleLoaded(productDetailes));
        } catch (e) {
          emit(ProductSingleError());
        }
      }
    });
  }
}