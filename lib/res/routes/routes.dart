import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/route_names.dart';
import 'package:getx_mvvm/view/login/login_screen.dart';
import 'package:getx_mvvm/view/splahs_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteNames.splashScreen,
          page: () => const SpalshScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteNames.loginScreen,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        // GetPage(
        //   name: RouteName.homeView,
        //   page: () => HomeView(),
        //   transitionDuration: Duration(milliseconds: 250),
        //   transition: Transition.leftToRightWithFade,
        // ),
      ];
}
