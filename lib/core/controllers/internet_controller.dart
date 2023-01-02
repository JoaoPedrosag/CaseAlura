import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';

part 'internet_controller.g.dart';

class InternetController = _InternetController with _$InternetController;

abstract class _InternetController with Store {
  @observable
  bool internet = false;

  @action
  checkInternet() async {
    internet = await InternetConnectionChecker().hasConnection;
  }
}
