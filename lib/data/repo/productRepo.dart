// ignore: file_names
import 'package:dio/dio.dart';
import 'package:watchstore/data/model/product.dart';
import 'package:watchstore/data/model/productDetails.dart';
import 'package:watchstore/data/src/productDataSrc.dart';

abstract class IProductRepo{
  Future<List<ProductModel>> getAllByCategorey(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getAllByStored(String routeParam);
  Future<List<ProductModel>> searchProduct(String searchKey);
  Future<ProductDetailesModel> getProductDetails(int id);
}

class Productrepository implements IProductRepo{
  
  final IProductDataSrc _iProductDataSrc;

  Productrepository(this._iProductDataSrc);
  
  @override
  Future<List<ProductModel>> getAllByBrand(int id) => _iProductDataSrc.getAllByBrand(id);
  
  @override
  Future<List<ProductModel>> getAllByCategorey(int id) => _iProductDataSrc.getAllByCategorey(id);
  
  @override
  Future<List<ProductModel>> getAllByStored(String routeParam) => _iProductDataSrc.getAllByStored(routeParam);
  
  @override
  Future<List<ProductModel>> searchProduct(String searchKey) => _iProductDataSrc.searchProduct(searchKey);
  
  @override
  Future<ProductDetailesModel> getProductDetails(int id) => _iProductDataSrc.getProductDetails(id);

}

final productRepository = Productrepository(ProductRemoteDataSrc(Dio()));