import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/errors/exception.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/hleper_functions/delete_user.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firebase_auth_services.dart';
import 'package:fruits_app/core/services/shared_preferences_single_tone.dart';
import 'package:fruits_app/core/utils/backend_endpoint.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/doman/entites/user_entites.dart';
import 'package:fruits_app/features/auth/doman/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DataBaseServices dataBaseServices;
  AuthRepoImpl(
      {required this.firebaseAuthServices, required this.dataBaseServices});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String name, String email, String password) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);

      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log("Exception AuthRepoImpl - createUserWithEmailAndPassword: $e and ");
      return left(ServerFailure("حدث خطأ ما. الرجاء المحاولة مرة أخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      saveUserData(user: userEntity);
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log("Exception AuthRepoImpl - signInWithEmailAndPassword: $e");
      return left(ServerFailure("حدث خطأ ما. الرجاء المحاولة مرة أخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEnriry = UserModel.fromFirebaseUser(user);
      var isUeserExisits = await dataBaseServices.isExisits(
          path: BackendEndpoint.isUsersExist, documentId: user.uid);
      if (isUeserExisits) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEnriry);
      }
    saveUserData(user:  userEnriry);
      return right(userEnriry);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log("Exception AuthRepoImpl - createUserWithEmailAndPassword: $e and ");
      return left(ServerFailure("حدث خطأ ما. الرجاء المحاولة مرة أخرى."));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUeserExisits = await dataBaseServices.isExisits(
          path: BackendEndpoint.isUsersExist, documentId: user.uid);
      if (isUeserExisits) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log("Exception AuthRepoImpl - createUserWithEmailAndPassword: $e and ");
      return left(ServerFailure("حدث خطأ ما. الرجاء المحاولة مرة أخرى."));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await dataBaseServices.addData(
        path: BackendEndpoint.addUserData,
        data: UserModel.fromEntity(user).toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseServices.getUserData(
        path: BackendEndpoint.getUserData, uid: uid);
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesService.setString(kUser, jsonData);
  }
}
