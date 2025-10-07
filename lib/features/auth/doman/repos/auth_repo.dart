import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/features/auth/doman/entites/user_entites.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name ,
     String email,
     String password,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
     String email,
     String password,
  );
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addUserData({required UserEntity user});
  Future saveUserData({required UserEntity user});
  Future <UserEntity> getUserData({required String uid});
}