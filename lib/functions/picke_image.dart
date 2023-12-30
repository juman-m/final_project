import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<String?> getImage() async {
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    imageFile = File(image.path);

    return imageFile.path;
  }
  return null;
}
