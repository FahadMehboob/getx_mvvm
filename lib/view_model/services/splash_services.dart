import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/route_names.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences.dart';

import '../../utils/utils.dart';

class SplashServices {
  UserPreferences userPreferences = UserPreferences();
  void isLogin() {
    userPreferences.getUser().then(
      (value) {
        print(value.token);
        print(value.isLogin);
        if (value.isLogin == false || value.isLogin.toString() == 'null') {
          Timer(const Duration(seconds: 3), () {
            Get.toNamed(RouteNames.loginScreen);
          });
        } else {
          Timer(const Duration(seconds: 3), () {
            Get.toNamed(RouteNames.homeScreen);
          });
        }
      },
    ).onError(
      (error, stackTrace) {
        Utils.snackBar('Error', error.toString());
      },
    );
  }
}
