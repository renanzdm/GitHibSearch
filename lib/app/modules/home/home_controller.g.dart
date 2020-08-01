// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$optionSelectedAtom = Atom(name: '_HomeControllerBase.optionSelected');

  @override
  OptionSelected get optionSelected {
    _$optionSelectedAtom.reportRead();
    return super.optionSelected;
  }

  @override
  set optionSelected(OptionSelected value) {
    _$optionSelectedAtom.reportWrite(value, super.optionSelected, () {
      super.optionSelected = value;
    });
  }

  final _$listUsersAtom = Atom(name: '_HomeControllerBase.listUsers');

  @override
  List<GitUserModel> get listUsers {
    _$listUsersAtom.reportRead();
    return super.listUsers;
  }

  @override
  set listUsers(List<GitUserModel> value) {
    _$listUsersAtom.reportWrite(value, super.listUsers, () {
      super.listUsers = value;
    });
  }

  final _$listRepositoriesAtom =
      Atom(name: '_HomeControllerBase.listRepositories');

  @override
  List<RepositoryModel> get listRepositories {
    _$listRepositoriesAtom.reportRead();
    return super.listRepositories;
  }

  @override
  set listRepositories(List<RepositoryModel> value) {
    _$listRepositoriesAtom.reportWrite(value, super.listRepositories, () {
      super.listRepositories = value;
    });
  }

  final _$nextPageAtom = Atom(name: '_HomeControllerBase.nextPage');

  @override
  int get nextPage {
    _$nextPageAtom.reportRead();
    return super.nextPage;
  }

  @override
  set nextPage(int value) {
    _$nextPageAtom.reportWrite(value, super.nextPage, () {
      super.nextPage = value;
    });
  }

  final _$valueQueryAtom = Atom(name: '_HomeControllerBase.valueQuery');

  @override
  String get valueQuery {
    _$valueQueryAtom.reportRead();
    return super.valueQuery;
  }

  @override
  set valueQuery(String value) {
    _$valueQueryAtom.reportWrite(value, super.valueQuery, () {
      super.valueQuery = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$failureAtom = Atom(name: '_HomeControllerBase.failure');

  @override
  Option<Failure> get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<Failure> value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$nextResultsUsersAsyncAction =
      AsyncAction('_HomeControllerBase.nextResultsUsers');

  @override
  Future nextResultsUsers() {
    return _$nextResultsUsersAsyncAction.run(() => super.nextResultsUsers());
  }

  final _$getListModelAsyncAction =
      AsyncAction('_HomeControllerBase.getListModel');

  @override
  Future getListModel() {
    return _$getListModelAsyncAction.run(() => super.getListModel());
  }

  final _$getListRepositoriesAsyncAction =
      AsyncAction('_HomeControllerBase.getListRepositories');

  @override
  Future getListRepositories() {
    return _$getListRepositoriesAsyncAction
        .run(() => super.getListRepositories());
  }

  final _$nextResultsRepositoriesAsyncAction =
      AsyncAction('_HomeControllerBase.nextResultsRepositories');

  @override
  Future nextResultsRepositories() {
    return _$nextResultsRepositoriesAsyncAction
        .run(() => super.nextResultsRepositories());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeValueQuery(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeValueQuery');
    try {
      return super.changeValueQuery(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
optionSelected: ${optionSelected},
listUsers: ${listUsers},
listRepositories: ${listRepositories},
nextPage: ${nextPage},
valueQuery: ${valueQuery},
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
