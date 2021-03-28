import 'package:flutter/material.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';

abstract class IUserRepository {
  Future<void> storeUser(UserModel user);
  Future<UserModel>? getUser();
  void signOut(BuildContext context);
  Future<bool> verifyUser(UserModel loginUser);
}
