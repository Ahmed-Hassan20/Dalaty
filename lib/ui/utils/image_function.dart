import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageFunction {
  static Future<File?> cameraPicker() async {
    PermissionStatus cameraStatus = await Permission.camera.request();
    if (cameraStatus.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image != null) {
        return File(image.path);
      }
    } else {
      print('Camera permission denied');
    }
    return null;
  }

  static Future<File?> galleryPicker() async {
    PermissionStatus status;

    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt <= 32) {
        status = await Permission.storage.request();
      } else {
        status = await Permission.photos.request();
      }
    } else if (Platform.isIOS) {
      status = await Permission.photos.request();
    } else {
      return null; // Unsupported platform
    }

    if (status.isGranted) {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        return File(image.path);
      }
    } else {
      print('Gallery permission denied');
    }
    return null;
  }
}
