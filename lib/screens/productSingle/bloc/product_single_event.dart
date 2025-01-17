import 'package:equatable/equatable.dart';

sealed class ProductSingleEvent extends Equatable {
  const ProductSingleEvent();

  @override
  List<Object> get props => [];
}

class ProductSingleInit extends ProductSingleEvent {
  final id;
  const ProductSingleInit({required this.id});
}