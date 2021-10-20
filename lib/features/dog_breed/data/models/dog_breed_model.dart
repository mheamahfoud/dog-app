import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';

class DogBreedModel extends DogBreed {
  DogBreedModel({required String name, required double confidence})
      : super(name: name, confidence: confidence);

  factory DogBreedModel.fromJson(Map<String, dynamic> json) {
    return DogBreedModel(
      name: json['name'],
      confidence: json['confidence'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'confidence': confidence,
    };
  }

}
