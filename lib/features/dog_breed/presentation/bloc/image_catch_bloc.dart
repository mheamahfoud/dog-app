import 'dart:io';
import 'package:dog_app/features/dog_breed/presentation/bloc/image_catch_event.dart';
import 'package:dog_app/features/dog_breed/presentation/bloc/image_catch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as imgLib;

class ImageCatchBloc extends Bloc<ImageCatchEvent, ImageCatchState> {
  ImageCatchBloc() : super(InitState()) {
    on<GetImageEvent>(
      _onGetImageForClassification,
      //   transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onGetImageForClassification(
    GetImageEvent event,
    Emitter<ImageCatchState> emit,
  ) async {
    //
    //   emit(Loading());
    // emit(ImageLoadingState());
    // try{
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image != null) {
        emit(ImageLoadedState(image: File(image.path)));
    }

    //  }
    // catch(e){
    //   emit(ImageErrorState(message: e.toString()));
    // }
  }
}
