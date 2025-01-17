import 'package:watchstore/data/model/banner.dart';
import 'package:watchstore/data/model/category.dart';
import 'package:watchstore/data/model/product.dart';
import 'package:watchstore/data/model/slide.dart';

class HomeModel{
  List<SlideModel> slider;
  List<CategoryModel> category;
  List<ProductModel> amazingProducts;
  List<ProductModel> mostSellerProducts;
  List<ProductModel> newestProducts;
  BannerModel banner;

  HomeModel({
    required this.slider,
    required this.category,
    required this.amazingProducts,
    required this.mostSellerProducts,
    required this.newestProducts,
    required this.banner,
  });

  factory HomeModel.fromJson(Map<String,dynamic> json){
    return HomeModel(
      slider: (json['sliders'] as List<dynamic>).map((e)=>SlideModel.fromJson(e)).toList(), 
      category: (json['categories'] as List<dynamic>).map((e)=>CategoryModel.fromJson(e)).toList(), 
      amazingProducts: (json['amazing_products'] as List<dynamic>).map((e)=>ProductModel.fromJson(e)).toList(),
      mostSellerProducts: (json['most_seller_products'] as List<dynamic>).map((e)=>ProductModel.fromJson(e)).toList(), 
      newestProducts: (json['newest_products'] as List<dynamic>).map((e)=>ProductModel.fromJson(e)).toList(),
      banner: BannerModel.fromJson(json['banner']));
  }
}