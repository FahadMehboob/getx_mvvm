import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/route_names.dart';
import 'package:getx_mvvm/view_model/controller/home/home_controller.dart';
import 'package:getx_mvvm/view_model/controller/user_preferences/user_preferences.dart';

import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreferences userPreferences = UserPreferences();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userPreferences.removeUser().then((value) {
                  Get.toNamed(RouteNames.loginScreen);
                }).onError(
                  (error, stackTrace) {
                    Utils.snackBar('Error', error.toString());
                  },
                );
              },
              icon: const Icon(Icons.logout)),
        ],
        backgroundColor: Colors.amber,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
