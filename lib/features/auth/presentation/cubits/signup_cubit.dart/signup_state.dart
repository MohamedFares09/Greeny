import 'package:fruits_app/features/auth/doman/entites/user_entites.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {
  final UserEntity userentity;
  SignupSuccessState(this.userentity);
}

class SignupErrorState extends SignupState {
  final String message;
  SignupErrorState(this.message);
}
