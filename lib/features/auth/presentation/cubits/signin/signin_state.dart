part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoadingState extends SigninState {}

final class SigninSuccessState extends SigninState {
  SigninSuccessState(this.userEntity);
  final UserEntity userEntity;
}

final class SigninErrorState extends SigninState {
  SigninErrorState(this.message);
  final String message;
}
