import 'package:equatable/equatable.dart';

class DogBreed extends Equatable {
  final String name;
  final double confidence;
  DogBreed({required this.name, required this.confidence});

  @override
// TODO: implement props
  List<Object?> get props => [name, confidence];
}
