import 'dart:io';

import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as imgLib;

abstract class ImageCatchState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitState extends ImageCatchState {}

class ImageLoadedState extends ImageCatchState {
  final File  image;
  ImageLoadedState({required this.image});
  @override
  List<Object> get props => [image];
}

class ImageErrorState extends ImageCatchState {
  final String message;
  ImageErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
