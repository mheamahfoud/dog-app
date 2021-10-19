import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as imgLib;

abstract class ImageCatchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetImageEvent extends ImageCatchEvent {
 // final File image ;
 // GetImageEvent({required this.image});
 //@override
 // List<Object> get props => [image];
}

