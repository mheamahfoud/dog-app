import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:dog_app/features/dog_breed/domain/usecases/get_dog_breed.dart';
import 'package:dog_app/features/dog_breed/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imgLib;
var x=1;
class DogBreedBloc extends Bloc<DogBreedEvent, DogBreedState> {
  late final GetBreedForDog dogBreed;

  DogBreedBloc({required this.dogBreed}) : super(Init()) {
    on<GetDogBreed>(
      _onDogBreddClassified,
      //   transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onDogBreddClassified(
    GetDogBreed event,
    Emitter<DogBreedState> emit,
  ) async {
    emit(Loading());
    imgLib.Image ? image = imgLib.decodeImage(File(event.image.path).readAsBytesSync());
   /* final failureOrBreed = await dogBreed(
      Params(image: image!),
    );*/
    await Future.delayed(const Duration(milliseconds: 350));
    emit(Loading());
    var failureOrBreed = await dogBreed(
      Params(image: image!),
    );
    if(failureOrBreed.isRight()){
      emit(Successed(result: failureOrBreed.toOption().toNullable()!));
    }

   /* failureOrBreed.fold(
        // (failure) => emit(Error(message: _mapFailureToMessage(failure))),
        (failure) => emit(Error(message: failure.Message)), (breed) {
      emit(Successed(result: breed));
    });*/
  }



}
