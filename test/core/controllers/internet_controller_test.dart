import 'package:case_alura/core/controllers/internet_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('must return true if you have internet ', () async {
    final controllerInternet = InternetController();
    await controllerInternet.checkInternet();
    expect(controllerInternet.internet, true);
  });
}
