import 'dart:async';
import 'dart:io';

import 'package:dog_app/features/dog_breed/presentation/bloc/bloc.dart';
import 'package:dog_app/features/dog_breed/presentation/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imglib;
import '../../../../injection_container.dart';

class DogBreedPage extends StatelessWidget {
  const DogBreedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DogBreedBloc>(
          create: (_) => sl<DogBreedBloc>(),
        ),
        BlocProvider<ImageCatchBloc>(
          create: (_) => sl<ImageCatchBloc>(),
        ),
        /* BlocProvider<BlocC>(
            create: (BuildContext context) => BlocC(),
          ),*/
      ],
      child: DogBreedPage1(),
    );
    return BlocProvider<DogBreedBloc>(
      create: (_) => sl<DogBreedBloc>(),
      child: DogBreedPage1(),
    );
  }
}

class DogBreedPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _currentTap = 0;
    GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Dog Breed'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(child: buildBody(context)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
        selectedItemColor: Colors.amberAccent,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(
          color: Colors.deepOrangeAccent,
        ),
        iconSize: 40,
        onTap: (value) async {
          if (value == 2) {
              context.read<ImageCatchBloc>().add(GetImageEvent());
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
            ),
            label: 'Call',
          ),
          // title: SizedBox.shrink()),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera,
            ),
            label: 'Camera',
          ),
          // title: SizedBox.shrink()),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_to_photos,
            ),
            label: 'Gallery',
          )

          //    CircleAvatar(
          //     radius: 15.0,
          //     backgroundImage:NetworkImage('http://www.dog-learn.com/dog-breeds/siberian-husky/images/siberian-husky-u5.jpg')
          //    ),)
          //  title: SizedBox.shrink())
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    BlocListener<ImageCatchBloc, ImageCatchState>(
        listener: (context, state) {
          if (state is ImageLoadedState) {

          }

        });
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            BlocConsumer<ImageCatchBloc, ImageCatchState>(
                listener: (context, state) {
                  if (state is ImageLoadingState ) {
                  print('beforrrrrrrrrrrrrrrrrrrrrrrrr');}

                 else  if (state is ImageLoadedState ) {
                    context.read<DogBreedBloc>().add(GetDogBreed(image: state.image));
                  //print('afterrrrrrrrrrrrrrr');
                 }
                  // do stuff here based on BlocA's state
                },               // do stuff here based on BlocA's state
              builder: (BuildContext context, state) {
                if (state is ImageLoadedState) {

                  return ImageDisplay(imageFile: state.image,
                  );
                }
                else if (state is ImageLoadingState) {

                  return ImageDisplay(
                    imageFile: null,
                  );
                }
                else
                  return ImageDisplay(
                    imageFile: null,
                  );
              },
            ),

            SizedBox(height: 20),
            BlocBuilder<DogBreedBloc, DogBreedState>(builder: (context, state) {
              if (state is Loading ) {
                return LoadingWidget();
              } else if (state is Successed) {
                return BreedDisplay(
                  dogBreed: state.result,
                );
              } else if (state is Error) {
                return MessageDisplay(
                  message: state.message,
                  isError: true,
                );
              }

              return Text('');
            }),
          ],
        ),
      ),
    );
  }

  BlocProvider<DogBreedBloc> buildBody1(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DogBreedBloc>(),
      child: Text(''),
    );
  }
}
