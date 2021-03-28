import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_shop_app/blocs/login/bloc/login_bloc.dart';
import 'package:mobile_shop_app/data/models/user_model.dart';
import 'package:mobile_shop_app/data/repositories/user/i_user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository implements IUserRepository {
  Future<void> storeUser(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String setUser = jsonEncode(user.toJson());
    prefs.setString('User', setUser);
  }

  Future<bool> verifyUser(UserModel loginUser) async {
    print(loginUser);
    UserModel? user = await getUser();
    print(user);
    if (user!.userName != null) {
      print('inside 1 condition');
      if (user.email == loginUser.email &&
          user.password == loginUser.password) {
        return true;
      } else {
        return false;
      }
    } else {
      print('inside else');
      return false;
    }
  }

  void signOut(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(LoggingIn());
  }

  Future<UserModel>? getUser() async {
    print('we are in get User now hehe');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? getUser = prefs.getString('User');
    print('this is $getUser');
    if (getUser != null) {
      UserModel user = UserModel.fromJson(jsonDecode(getUser));
      print(user);
      return user;
    } else {
      return UserModel();
    }
  }
}
