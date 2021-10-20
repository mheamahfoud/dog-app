import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:dog_app/features/dog_breed/domain/repositories/dog_breed_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:image/image.dart' as imgLib;
class GetBreedForDog implements UseCase<DogBreed, Params> {
  final DogBreedRepository repository;

  GetBreedForDog(this.repository);

  @override
  Future<Either<Failure, DogBreed>> call(Params params) async {
    return await repository.getDogBreed(params.image);
  }
}

class Params extends Equatable {
  late final imgLib.Image image;

  Params({required this.image});

  @override
  List<Object> get props => [image];
}
