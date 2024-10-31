abstract class Failure {
  final String errMessage;
  Failure({required this.errMessage});
}

abstract class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
}
