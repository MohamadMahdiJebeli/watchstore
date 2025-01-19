import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watchstore/data/model/userInfo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(userInfoRepository) : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      try {
        if (event is ProfileInitEvent) {
          emit(ProfileLoadingState());
          final userInfo = await userInfoRepository.getUserInfo();
          emit(ProfileLoadedState(userInfo: userInfo));
        } else {
          emit(ProfileErrorState());
        }
      } catch (e) {
        emit(ProfileErrorState());
      }
    });
  }
}
