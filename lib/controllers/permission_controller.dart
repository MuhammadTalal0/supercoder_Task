import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  final cameraGranted = false.obs;
  final photosGranted = false.obs;

  Future<void> requestCamera() async {
    final status = await Permission.camera.request();
    cameraGranted.value = status.isGranted;
  }

  Future<void> requestPhotos() async {
    // Android 13+: READ_MEDIA_IMAGES. Older: storage
    final statuses = await [
      Permission.photos, // iOS
      Permission.storage, // Android < 13
      Permission.mediaLibrary, // iOS media
      Permission.videos, // Android 13+
      Permission.audio,  // safe for completeness
    ].request();

    final granted = statuses.values.any((s) => s.isGranted);
    photosGranted.value = granted;
  }
}
