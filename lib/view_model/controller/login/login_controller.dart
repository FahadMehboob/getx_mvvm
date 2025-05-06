import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login_model/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/route_names.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();

  final _userPreference = UserPreferences();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  final loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found' ||
          value['error'] == 'Missing email or username' ||
          value['error'] == 'Missing password') {
        Utils.snackBar("Login", "User Not Found");
      } else {
        UserModel userModel = UserModel(token: value['token'], isLogin: true);
        _userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RouteNames.homeScreen);
        }).onError(
          (error, stackTrace) {
            Utils.snackBar('Error', error.toString());
          },
        );
        Utils.snackBar("Login", "Login Succesfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
