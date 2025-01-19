part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class LodingState extends AuthState {}
final class ErrorState extends AuthState {}
final class SentState extends AuthState {
  // ignore: prefer_typing_uninitialized_variables
  final phoneNumber;
  SentState({
    required this.phoneNumber
  });
}
final class VerifiedRegisterdState extends AuthState {}
final class VerifiedNotRegisterdState extends AuthState {}
final class LoggedInState extends AuthState {}
final class LoggedOutState extends AuthState {}
