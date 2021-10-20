import 'dart:io';

import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:equatable/equatable.dart';

abstract class DogBreedState extends Equatable {
  @override
  List<Object> get props => [];
}

class Init extends DogBreedState {}



class Successed extends DogBreedState {
  final DogBreed  result;
  Successed({required this.result});
  @override
  List<Object> get props => [result];
}

class Error extends DogBreedState {
  final String message;
  Error({required this.message});
  @override
  List<Object> get props => [message];
}
class Loading extends DogBreedState {}

