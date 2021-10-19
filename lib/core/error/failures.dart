import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure(this.Message) ;
  final String Message ;
  @override
  // TODO: implement props
  List<Object?> get props => [props];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String Message) : super(Message);
}

class CacheFailure extends Failure {
  CacheFailure(String Message) : super(Message);
}