import 'package:dio/dio.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/data/model/product.dart';
import 'package:watchstore/data/model/productDetails.dart';
import 'package:watchstore/utils/responseValidator.dart';

abstract class IProductDataSrc{
  Future<ProductDetailesModel> getProductDetails(int id);
  Future<List<ProductModel>> getAllByCategorey(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getAllByStored(String routeParam);
  Future<List<ProductModel>> searchProduct(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc{

  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products =  <ProductModel>[];

    final response = await httpClient.get(EndPoints.productsByBrand+id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data'] as List)){
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategorey(int id) async {
    List<ProductModel> products =  <ProductModel>[];

    final response = await httpClient.get(EndPoints.productsByCategory+id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['products_by_category']['data'] as List)){
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }


  @override
  Future<List<ProductModel>> getAllByStored(String routeParam) async {
    List<ProductModel> products =  <ProductModel>[];

    final response = await httpClient.get(EndPoints.baseURL+routeParam);
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data'] as List)){
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> searchProduct(String searchKey) async {
    List<ProductModel> products =  <ProductModel>[];

    final response = await httpClient.get(EndPoints.baseURL+searchKey);
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data'] as List)){
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
  
  @override
  Future<ProductDetailesModel> getProductDetails(int id) async {
    final response = await httpClient.get(EndPoints.productDetails + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode??0);
    return ProductDetailesModel.fromJson(response.data['data'][0]);
  }

}