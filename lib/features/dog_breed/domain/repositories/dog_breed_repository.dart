import 'package:dartz/dartz.dart';
import 'package:dog_app/core/error/failures.dart';
import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:image/image.dart' as imgLib;
abstract class DogBreedRepository {
  Future<Either<Failure, DogBreed>> getDogBreed(imgLib.Image image);
}