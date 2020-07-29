import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:github_perfil/app/shared/models/git_user_model.dart';
import 'package:github_perfil/app/shared/models/repository_model.dart';
import 'package:github_perfil/app/shared/repositories/git_hub_search_interface.dart';
import 'package:github_perfil/app/shared/utils/custom_exception.dart';
import 'package:mobx/mobx.dart';

import 'widgets/options_search/options_search_widget.dart';

part 'home_controller.g.dart';

enum OptionSelected { users, repositories }

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this.gitHubSearchI);
  OverlayEntry overlayEntry;
  final GitHubSearchI gitHubSearchI;
  @observable
  OptionSelected optionSelected = OptionSelected.users;
  @observable
  List<GitUserModel> listUsers = List<GitUserModel>();
  @observable
  List<RepositoryModel> listRepositories = [];
  @observable
  int nextPage = 1;
  @observable
  String valueQuery = '';
  @observable
  bool isLoading = false;
  @observable
  Option<Failure> failure = none();

  @action
  changeValueQuery(String value) => valueQuery = value;

  @action
  nextResultsUsers() async {
    if (nextPage < 20) {
      nextPage++;
      final searchResult = await gitHubSearchI.findPerfis(valueQuery, nextPage);
      searchResult.fold((erro) {
        failure = optionOf(erro);
      }, (success) {
        List<GitUserModel> listAux = listUsers;
        listAux.insertAll(listAux.length, success);
        listUsers = List.from(listAux);
      });

      isLoading = false;
    }
  }

  @action
  getListModel() async {
    optionSelected = OptionSelected.users;
    if (valueQuery.isNotEmpty) {
      final searchResult = await gitHubSearchI.findPerfis(valueQuery, nextPage);
      searchResult.fold((erro) {
        failure = optionOf(erro);
        isLoading = false;
      }, (success) {
        listUsers = success;
        isLoading = false;
      });
    }
  }

  @action
  getListRepositories() async {
    nextPage = 1;
    isLoading = false;

    optionSelected = OptionSelected.repositories;
    // if (valueQuery.isNotEmpty)
    //   listRepositories =
    //      // await gitHubSearchI.findRepositories(valueQuery, nextPage);
  }

  void showOptions(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(
      builder: (context) => OptionsSearchWidget(
        searchUsers: () {
          getListModel();
          overlayEntry.remove();
        },
        searchRepositories: () {
          getListRepositories();
          overlayEntry.remove();
        },
      ),
    );
    overlayState.insert(overlayEntry);
  }
}
