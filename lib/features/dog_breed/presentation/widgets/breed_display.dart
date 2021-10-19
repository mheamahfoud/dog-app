import 'package:dog_app/features/dog_breed/domain/entities/dog_breed.dart';
import 'package:flutter/material.dart';

class BreedDisplay extends StatelessWidget {
  final DogBreed dogBreed;

  const BreedDisplay({
    Key? key,
    required this.dogBreed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        children: <Widget>[
          Text(
            dogBreed.name.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            dogBreed.confidence.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
       /*   Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Text(
                  numberTrivia.text,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}