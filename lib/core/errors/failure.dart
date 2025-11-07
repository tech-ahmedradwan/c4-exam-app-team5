abstract class Failure {
  const Failure(this.message, {this.code});
  final String message;
  final int? code;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}
