import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/utils/sharedPreferencesManger.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){
    emit(LoggedOutState());
  }
  final Dio _dio = Dio();

  sendSMS(String phoneNumber) async{
    emit(LodingState());

    try {
      await _dio.post(EndPoints.sendSMS,data: {"mobile":phoneNumber}).then((value) {
        print(value.toString());
        if (value.statusCode==201) {
          emit(SentState(phoneNumber: phoneNumber));
        }else{
          emit(ErrorState());
        }
      },);
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String phoneNumber ,String code) async{
    emit(LodingState());

    try {
      await _dio.post(EndPoints.checkSMSCode,data: {"mobile":phoneNumber,"code":code}).then((value) {
        debugPrint(value.toString());

        if (value.statusCode==201) {
          
          SharedPreferencesManager().saveString("token", value.data["data"]["token"]);

          if (value.data["data"]["is_registered"]) {
            emit(VerifiedRegisterdState());
          } else {
            emit(VerifiedNotRegisterdState());
          }
        }else{
          emit(ErrorState());
        }
      },);
    } catch (e) {
      emit(ErrorState());
    }
  }

  registration() async{

  }

  logout(){
    
  }
}
