import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchstore/data/model/product.dart';
import 'package:watchstore/data/repo/productRepo.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  
  final IProductRepo _iProductRepo;

  ProductListBloc(this._iProductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      if (event is ProductListInit) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByCategorey(event.param);
          emit(ProductListLoaded(productList));
        } catch (e) {
          emit(ProductListError());
        }
      }
    });
  }
}
