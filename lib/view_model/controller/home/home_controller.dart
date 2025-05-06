import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _homeApi = HomeRepository();

  final rxRequest = Status.loading.obs;

  final userListModel = UserListModel().obs;

  void setRxRequestStatus(Status value) {
    rxRequest.value = value;
  }

  void setUserList(UserListModel value) {
    userListModel.value = value;
  }

  void userListApi() async {
    _homeApi.userListApi().then(
      (value) {
        setRxRequestStatus(Status.completed);

        setUserList(value);
      },
    ).onError(
      (error, stackTrace) {
        setRxRequestStatus(Status.error);
      },
    );
  }
}
