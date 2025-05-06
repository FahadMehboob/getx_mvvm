import 'package:getx_mvvm/models/login_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel model) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', model.token.toString());
    sp.setBool('isLogin', model.isLogin!);
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    final token = sp.getString('token');
    final isLogin = sp.getBool('isLogin');
    return UserModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.clear();
    return true;
  }
}
