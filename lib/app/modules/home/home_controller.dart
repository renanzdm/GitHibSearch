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

enum OptionSelected { users, repositories,none }

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  _HomeControllerBase(this.gitHubSearchI);
  OverlayEntry overlayEntry;
  final GitHubSearchI gitHubSearchI;

  @observable
  OptionSelected optionSelected = OptionSelected.none;
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
      searchResult.fold((error) {
        failure = optionOf(error);
      }, (success) {
        List<GitUserModel> listAux = listUsers;
        listAux.insertAll(listAux.length, success);
        listUsers = List.from(listAux);
      });

      isLoading = false;
    }else{
      nextPage = 1;
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
    optionSelected = OptionSelected.repositories;
    if (valueQuery.isNotEmpty) {
      final searchResult = await gitHubSearchI.findRepositories(valueQuery, nextPage);
      searchResult.fold((erro) {
        failure = optionOf(erro);
        isLoading = false;
      }, (success) {
        listRepositories = success;
        isLoading = false;
      });
    }
  }
  @action
  nextResultsRepositories() async {
    if(nextPage<20){
        nextPage++;
        final searchResult = await gitHubSearchI.findRepositories(valueQuery, nextPage);
        searchResult.fold((error) {
    failure = optionOf(error);
        }, (success) {
            List<RepositoryModel> listAux = listRepositories;
            listAux.insertAll(listAux.length, success);
            listRepositories = List.from(listAux);
        });
        isLoading = false;
    }else{
      nextPage = 1;
    }
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
