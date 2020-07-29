import 'package:dartz/dartz.dart';
import 'package:github_perfil/app/shared/models/git_user_model.dart';
import 'package:github_perfil/app/shared/models/repository_model.dart';
import 'package:github_perfil/app/shared/utils/custom_exception.dart';

abstract class GitHubSearchI {
  Future<Either<Failure, List<GitUserModel>>> findPerfis(
      String userName, int nextPage);
  Future<Either<Failure, List<RepositoryModel>>> findRepositories(
      String repository, int nextPage);
}
