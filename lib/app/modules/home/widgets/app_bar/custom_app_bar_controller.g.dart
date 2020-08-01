// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomAppBarController on _CustomAppBarController, Store {
  final _$textOrTextFieldAtom =
      Atom(name: '_CustomAppBarController.textOrTextField');

  @override
  bool get textOrTextField {
    _$textOrTextFieldAtom.reportRead();
    return super.textOrTextField;
  }

  @override
  set textOrTextField(bool value) {
    _$textOrTextFieldAtom.reportWrite(value, super.textOrTextField, () {
      super.textOrTextField = value;
    });
  }

  final _$_CustomAppBarControllerActionController =
      ActionController(name: '_CustomAppBarController');

  @override
  dynamic changeState() {
    final _$actionInfo = _$_CustomAppBarControllerActionController.startAction(
        name: '_CustomAppBarController.changeState');
    try {
      return super.changeState();
    } finally {
      _$_CustomAppBarControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textOrTextField: ${textOrTextField}
    ''';
  }
}
