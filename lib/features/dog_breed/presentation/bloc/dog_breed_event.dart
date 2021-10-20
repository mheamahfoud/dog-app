import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as imgLib;

abstract class DogBreedEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetDogBreed extends DogBreedEvent {
  final File image ;
   GetDogBreed({required this.image});
  @override
  List<Object> get props => [image];
}

