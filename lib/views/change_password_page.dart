import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/app_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();
  final currentCtrl = TextEditingController();
  final newCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  final canSubmit = false.obs;

  void _validate() {
    canSubmit.value = (currentCtrl.text.isNotEmpty && newCtrl.text.length >= 8 && newCtrl.text == confirmCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()), title: const Text('비밀번호 설정')),
      body: Obx(() => Form(
        key: formKey,
        onChanged: _validate,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _pwField('기본 비밀번호 *', '8-16자리 영문, 숫자, 특수문자 조합', currentCtrl),
            _pwField('새 비밀번호 *', '8-16자리 영문, 숫자, 특수문자 조합', newCtrl),
            _pwField('비밀번호 확인 *', '비밀번호를 재입력해 주세요.', confirmCtrl),
            const SizedBox(height: 24),
            AppButton(text: '완료', onPressed: canSubmit.value ? () {} : null, filled: true),
          ],
        ),
      )),
    );
  }

  Widget _pwField(String label, String hint, TextEditingController c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        TextFormField(
          controller: c,
          obscureText: true,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
