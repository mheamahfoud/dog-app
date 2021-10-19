import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dog_app/features/dog_breed/domain/usecases/get_dog_breed.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/utils/input_converter.dart';
import 'package:http/http.dart' as http;

import 'features/dog_breed/data/datasources/classification/tflite/classifier.dart';
import 'features/dog_breed/data/datasources/classification/tflite/classifier_float.dart';
import 'features/dog_breed/data/datasources/dog_breed_cache_reslut.dart';
import 'features/dog_breed/data/repositories/dog_breed_repository_impl.dart';
import 'features/dog_breed/domain/repositories/dog_breed_repository.dart';
import 'features/dog_breed/presentation/bloc/bloc.dart';
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  //! Features - Number Trivia
  // Bloc
  sl.registerFactory(
        () => DogBreedBloc(
      dogBreed: sl(),
    ),
  );

  sl.registerFactory(
        () => ImageCatchBloc(
    ),
  );

// Use cases
  sl.registerLazySingleton(() => GetBreedForDog(sl()));



  // Repository
  sl.registerLazySingleton<DogBreedRepository>(
        () => DogBreedRepositoryImpl(
          classifier: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton(() => ClassifierFloat());
  // Data sources
  sl.registerLazySingleton<Classifier>(
        () => ClassifierFloat(),
  );
  sl.registerLazySingleton<DogBreedLocalDataSource>(
        () => DogBreedDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());

  //sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

}