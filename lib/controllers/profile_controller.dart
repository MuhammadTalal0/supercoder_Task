import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  // Form fields
  final userId = 'asdf123'.obs;
  final email = 'asdf123@naver.com'.obs;
  final phone = '010-1234-5678'.obs;
  final nickname = '장발산'.obs;
  final instagram = 'ffkdo_sa'.obs;
  final link = 'https://www.naver.com/'.obs;

  final portfolioFileName = ''.obs;

  // UI state
  final isSaving = false.obs;
  final canSave = false.obs;
  final profileImagePath = RxnString();

  void onFieldChanged() {
    canSave.value = true;
  }

  Future<void> changePhone() async {
    // Fake action for demo
    phone.value = phone.value; // no-op
  }

  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final x = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (x != null) {
      profileImagePath.value = x.path;
    }
  }

  Future<void> pickPortfolioPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      portfolioFileName.value = result.files.single.name;
      canSave.value = true;
    }
  }

  Future<void> openLink() async {
    final uri = Uri.parse(link.value);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> save() async {
    isSaving.value = true;
    await Future.delayed(const Duration(milliseconds: 800));
    isSaving.value = false;
    canSave.value = false;
  }
}
