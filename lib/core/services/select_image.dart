import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

Future<File?> pickAndEditImage() async {
  // 1. اختيار أو التقاط الصورة
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return null;

  // 2. قص / تعديل الصورة
  final croppedFile = await ImageCropper().cropImage(
    sourcePath: pickedFile.path,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'تعديل الصورة',
        toolbarColor: Colors.blue,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        title: 'تعديل الصورة',
      ),
    ],
  );

  if (croppedFile == null) return null;

  return File(croppedFile.path);
}
