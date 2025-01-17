part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitialState extends ProfileState {}
final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadedState extends ProfileState {
  final UserInfoModel userInfo;

  const ProfileLoadedState({required this.userInfo});

  @override
  List<Object> get props => [userInfo];
}

final class ProfileErrorState extends ProfileState{}