class AddressModel {
  final String address;
  final double lat;
  final double lng;
  final String postalCode;

  AddressModel({
    required this.address,
    required this.lat,
    required this.lng,
    required this.postalCode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'],
      lat: json['lat'].toDouble(),
      lng: json['lng'].toDouble(),
      postalCode: json['postal_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'lat': lat,
      'lng': lng,
      'postal_code': postalCode,
    };
  }
}
