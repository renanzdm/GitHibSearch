import 'package:mobx/mobx.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @observable
  int currentPage = 0;
  @action
  changePage(int page) {
    currentPage = page;
  }
}
