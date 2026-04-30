import 'dart:convert';

import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_test_myself/feature/auth/data/models/user_model.dart';
import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserDataKey);

  var userEntity = UserModel.fromJson(jsonDecode(jsonString!));
  return userEntity;
}
