part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitEvent extends ProfileEvent{}
class ProfileLoadingEvent extends ProfileEvent{}
class ProfileLoadedEvent extends ProfileEvent{}
class ProfileErrorEvent extends ProfileEvent{}