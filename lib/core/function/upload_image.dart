import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Picks an image from the device camera.
/// Returns a [File] if an image is captured, otherwise `null`.
Future<File?> pickImageFromCamera() async {
  try {
    final XFile? xfile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );

    if (xfile != null && xfile.path.isNotEmpty) {
      return File(xfile.path);
    }
  } catch (e) {
    // Handle camera error if needed
    debugPrint('Camera Error: $e');
  }
  return null;
}

/// Picks an image or SVG file from the device gallery.
/// Set [isSvg] to `true` to restrict selection to SVG files only.
/// Returns a [File] if a file is picked, otherwise `null`.
Future<File?> pickFileFromGallery({bool isSvg = false}) async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ['svg', 'SVG']
          : [
              'png',
              'PNG',
              'jpg',
              'JPG',
              'jpeg',
              'JPEG',
              'gif',
              'GIF',
              'bmp',
              'BMP',
              'webp',
              'WEBP',
              'heic',
              'HEIC',
              'tiff',
              'TIFF'
            ],
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path!);
    }
  } catch (e) {
    // Handle file picker error if needed
    debugPrint('File Picker Error: $e');
  }
  return null;
}

// Future<File?> fileUploadGallery({bool isSvg = false}) async {
//   FilePickerResult? result = await FilePicker.platform.pickFiles(
//     type: FileType.custom,
//     allowedExtensions: isSvg
//         ? ['svg', 'SVG']
//         : [
            // 'png', 'PNG',
            // 'jpg', 'JPG',
            // 'jpeg', 'JPEG',
            // 'gif', 'GIF',
            // 'bmp', 'BMP',
            // 'webp', 'WEBP',
            // 'heic', 'HEIC',
            // 'tiff', 'TIFF'
//           ],
//   );

//   if (result != null && result.files.single.path != null) {
//     return File(result.files.single.path!);
//   } else {
//     return null;
//   }
// }
