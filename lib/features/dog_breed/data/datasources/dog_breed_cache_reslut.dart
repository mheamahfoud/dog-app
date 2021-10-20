import 'dart:convert';
import 'package:dog_app/core/error/exceptions.dart';
import 'package:dog_app/core/utils/AppConst.dart';
import 'package:dog_app/features/dog_breed/data/models/dog_breed_model.dart';
import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class DogBreedLocalDataSource {
  /// Gets the cached [DogBreedModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<DogBreedModel> getLastDogBreed();

  Future<void> cacheDogBreed(DogBreedModel breedToCache);
}



class DogBreedDataSourceImpl implements DogBreedLocalDataSource {
   final SharedPreferences sharedPreferences;

  DogBreedDataSourceImpl({required this.sharedPreferences});

  @override
  Future<DogBreedModel> getLastDogBreed() {
    final jsonString = sharedPreferences.getString(AppConst.CACHED_DOG_BREED);
    if (jsonString != null) {
      return Future.value(DogBreedModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheDogBreed(DogBreedModel breedToCache) {
    return sharedPreferences.setString(
      AppConst.CACHED_DOG_BREED,
      json.encode(breedToCache.toJson()),
    );
  }
}