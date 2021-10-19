import 'package:dartz/dartz.dart';
import 'package:dog_app/core/error/exceptions.dart';
import 'package:dog_app/core/error/failures.dart';
import 'package:dog_app/core/network/network_info.dart';
import 'package:dog_app/features/dog_breed/data/datasources/classification/tflite/classifier.dart';
import 'package:dog_app/features/dog_breed/data/datasources/classification/tflite/classifier_float.dart';
import 'package:dog_app/features/dog_breed/data/datasources/dog_breed_cache_reslut.dart';
import 'package:dog_app/features/dog_breed/data/models/dog_breed_model.dart';
import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:dog_app/features/dog_breed/domain/repositories/dog_breed_repository.dart';
import 'package:meta/meta.dart';
import 'package:image/image.dart' as imgLib;

typedef Future<DogBreed> _ConcreteOrRandomChooser();

class DogBreedRepositoryImpl implements DogBreedRepository {
  final ClassifierFloat classifier;
  final DogBreedLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DogBreedRepositoryImpl({
    required this.classifier,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, DogBreed>> getDogBreed(imgLib.Image image) async {
    //if (await networkInfo.isConnected) {
      try {
        var pred = await classifier.predict(image);
        DogBreed model =
            DogBreedModel(name: pred.label, confidence: pred.score);
      //  localDataSource.cacheDogBreed(model as DogBreedModel);
        return Right(model);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    //}
    /*else {
      try {
        final localBreed = await localDataSource.getLastDogBreed();
        return Right(localBreed);
      } on CacheException catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }*/
  }
}
