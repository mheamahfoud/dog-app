import 'dart:io';
import 'package:dog_app/features/dog_breed/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageDisplay extends StatelessWidget {
  final File? imageFile;
  const ImageDisplay({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: (){ },
            child: Container(
              margin: EdgeInsets.all(20),
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(

                    image: imageFile == null
                        ? AssetImage(
                            'assets/dog.jpg')
                        : FileImage(imageFile!) as ImageProvider,
                    fit: BoxFit.fill),
              ),
            ),
          )
        ],
      ),
    );
  }

}
