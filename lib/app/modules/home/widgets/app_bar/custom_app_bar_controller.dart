import 'package:mobx/mobx.dart';

part 'custom_app_bar_controller.g.dart';

class CustomAppBarController = _CustomAppBarController
    with _$CustomAppBarController;

abstract class _CustomAppBarController with Store {

@observable
bool textOrTextField = false;

@action
 changeState(){
  textOrTextField = !textOrTextField;

}



}
