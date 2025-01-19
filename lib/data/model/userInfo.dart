// ignore: file_names
import 'package:watchstore/data/model/adderess.dart';

class UserProfileResponse {
  final bool result;
  final String message;
  final UserData data;

  UserProfileResponse({
    required this.result,
    required this.message,
    required this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      result: json['result'],
      message: json['message'],
      data: UserData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class UserData {
  final UserInfoModel userInfo;
  final int userProcessingCount;
  final int userReceivedCount;
  final int userCancelCount;

  UserData({
    required this.userInfo,
    required this.userProcessingCount,
    required this.userReceivedCount,
    required this.userCancelCount,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userInfo: UserInfoModel.fromJson(json['user_info']),
      userProcessingCount: json['user_processing_count'],
      userReceivedCount: json['user_received_count'],
      userCancelCount: json['user_cancel_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_info': userInfo.toJson(),
      'user_processing_count': userProcessingCount,
      'user_received_count': userReceivedCount,
      'user_cancel_count': userCancelCount,
    };
  }
}

class UserInfoModel {
  final int id;
  final String name;
  final String mobile;
  final String phone;
  final AddressModel address;

  UserInfoModel({
    required this.id,
    required this.name,
    required this.mobile,
    required this.phone,
    required this.address,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      phone: json['phone'],
      address: AddressModel.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'phone': phone,
      'address': address.toJson(),
    };
  }
}