class Failure implements Exception {}

class SearchFailure extends Failure {
  final String error;

  SearchFailure(this.error);
}
