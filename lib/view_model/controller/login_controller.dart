import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
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
      if (value['error'] == 'user not found') {
        Utils.snackBar("Login", "User Not Found");
      } else {
        Utils.snackBar("Login", "Login Succesfully");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
