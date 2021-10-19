
import 'package:dartz/dartz.dart';
import 'package:dog_app/core/error/failures.dart';
import 'package:dog_app/core/localization/exceptions/exception.dart';

class InputConverter {
  Future<Either<Failure, int>> stringToUnsignedInteger(String str) async {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return  Right(integer);
    } on FormatException  catch(e){
      return Left(InvalidInputFailure(Exceptions.INVALID_INPUT_FAILURE_MESSAGE));
      //return Left(InvalidInputFailure(e.message));
    }
  }
}

class InvalidInputFailure extends Failure {
  InvalidInputFailure(String Message) : super(Message);
}