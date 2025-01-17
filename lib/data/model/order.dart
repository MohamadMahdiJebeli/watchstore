class OrderModel {
  final int id;
  final int code;
  final String status;
  final List<OrderDetail> orderDetails;

  OrderModel({
    required this.id,
    required this.code,
    required this.status,
    required this.orderDetails,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      code: json['code'],
      status: json['status'],
      orderDetails: (json['order_details'] as List)
          .map((e) => OrderDetail.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'status': status,
      'order_details': orderDetails.map((e) => e.toJson()).toList(),
    };
  }
}

class OrderDetail {
  final int id;
  final String product;
  final int count;
  final int price;
  final int discountPrice;
  final String status;

  OrderDetail({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
    required this.discountPrice,
    required this.status,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      product: json['product'],
      count: json['count'],
      price: json['price'],
      discountPrice: json['discount_price'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'count': count,
      'price': price,
      'discount_price': discountPrice,
      'status': status,
    };
  }
}
