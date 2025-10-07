import 'dart:convert';

import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/services/shared_preferences_single_tone.dart';
import 'package:fruits_app/features/auth/data/models/user_model.dart';
import 'package:fruits_app/features/auth/doman/entites/user_entites.dart';

UserEntity? getUser() {
  final jsonString = SharedPreferencesService.getString(kUser);

  // لو مفيش بيانات محفوظة أصلاً
  if (jsonString == null || jsonString.isEmpty) {
    print('⚠️ No user data found in SharedPreferences');
    return null;
  }

  try {
    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserModel.fromJson(jsonMap);
  } catch (e) {
    print('❌ Error decoding user data: $e');
    return null;
  }
}
