import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/controller/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginController.emailController.value,
                    focusNode: loginController.emailFocusNode.value,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginController.emailFocusNode.value,
                          loginController.passwordFocusNode.value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('email_hint'.tr, 'enter_email'.tr);
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    controller: loginController.passwordController.value,
                    focusNode: loginController.passwordFocusNode.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar('password_hint'.tr, 'enter_password'.tr);
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.toastMessage('Congratulations login Successful');
                    },
                    decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: const OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() {
              return RoundButton(
                loading: loginController.loading.value,
                title: 'login'.tr,
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.loginApi();
                  }
                },
                width: 200,
              );
            })
          ],
        ),
      ),
    );
  }
}
