import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:github_perfil/app/shared/models/git_user_model.dart';
import 'package:github_perfil/app/shared/models/repository_model.dart';
import 'package:github_perfil/app/shared/repositories/git_hub_search_interface.dart';
import 'package:github_perfil/app/shared/utils/custom_exception.dart';

class GitHubSearch implements GitHubSearchI {
  final Dio dio;

  GitHubSearch(this.dio);

  @override
  Future<Either<Failure, List<GitUserModel>>> findPerfis(
      String userName, int nextPage) async {
    try {
      Response response = await dio.get(
          'https://api.github.com/search/users?q=$userName&page=$nextPage&per_page=50');
      return right(GitUserModel.fromJsonList(response.data['items'] as List));
    } on DioError catch (e) {
      print(e.message);
      return left(SearchFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<RepositoryModel>>> findRepositories(
      String repository, int nextPage) async {
    try {
      Response response = await dio.get(
          'https://api.github.com/search/repositories?q=$repository&page=$nextPage&per_page=50');
      return right(
          RepositoryModel.fromJsonList(response.data["items"] as List));
    } on DioError catch (e) {
      print(e.message);
      return left(SearchFailure(e.message));
    }
  }
}
