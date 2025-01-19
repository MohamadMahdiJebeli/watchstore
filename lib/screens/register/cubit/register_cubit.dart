import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watchstore/data/constant.dart';
import 'package:watchstore/data/model/user.dart';
import 'package:watchstore/res/appStrings.dart';
import 'package:watchstore/res/dimens.dart';
import 'package:watchstore/utils/sharedPreferencesKey.dart';
import 'package:watchstore/utils/sharedPreferencesManger.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  pickThelocation({required context}) async{
    await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: AppStrings.location,
      textCancelPicker: AppStrings.cancel,
      textConfirmPicker: AppStrings.confirm,
      zoomOption: const ZoomOption(initZoom: 8),
      initCurrentUserPosition: const UserTrackingOption.withoutUserPosition(),
      radius: AppDimens.medium,).then((value)=>emit(LocationPickedState(location: value)));
  }

  register({required User user}) async{
    emit(LoadingState());

    try {
      String? token = SharedPreferencesManager().getString(SharedPreferencesKey.token);
      _dio.options.headers["Authorization"] = "Bearer $token";
      await _dio.post(EndPoints.register,data: FormData.fromMap(user.toMap()),).then((value){
        print(value.data);
        if (value.statusCode==201) {
          emit(OKResponseState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
      print(e.toString());
    }

  }
}
