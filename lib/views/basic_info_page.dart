import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import 'widgets/app_button.dart';
import 'widgets/app_text_field.dart';

class BasicInfoPage extends StatelessWidget {
  const BasicInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());

    final idCtrl = TextEditingController(text: c.userId.value);
    final emailCtrl = TextEditingController(text: c.email.value);
    final phoneCtrl = TextEditingController(text: c.phone.value);
    final nickCtrl = TextEditingController(text: c.nickname.value);
    final igCtrl = TextEditingController(text: c.instagram.value);
    final linkCtrl = TextEditingController(text: c.link.value);
    final portfolioCtrl = TextEditingController();

    void watch() {
      c.userId.value = idCtrl.text;
      c.email.value = emailCtrl.text;
      c.phone.value = phoneCtrl.text;
      c.nickname.value = nickCtrl.text;
      c.instagram.value = igCtrl.text;
      c.link.value = linkCtrl.text;
      c.onFieldChanged();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
        title: const Text('기본정보'),
      ),
      body: Obx(() => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppTextField(label: '아이디', hint: 'asdf123', controller: idCtrl, enabled: false),
          AppTextField(label: '이메일', hint: 'asdf123@naver.com', controller: emailCtrl, enabled: true, keyboardType: TextInputType.emailAddress),
          AppTextField(
            label: '휴대폰 번호',
            hint: '010-1234-5678',
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            trailing: ElevatedButton(
              onPressed: c.changePhone,
              style: ElevatedButton.styleFrom(minimumSize: const Size(0, 36), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: const Text('변경하기'),
            ),
          ),
          AppTextField(label: '닉네임', hint: '장발산', controller: nickCtrl),
          AppTextField(label: '인스타그램 아이디', hint: 'ffkdo_sa', controller: igCtrl),
          AppTextField(label: '대표 작업 링크', hint: 'https://www.naver.com/', controller: linkCtrl, trailing: IconButton(icon: const Icon(Icons.open_in_new), onPressed: c.openLink)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text('포트폴리오', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 8),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    controller: portfolioCtrl..text = c.portfolioFileName.value.isEmpty ? '포트폴리오.pdf' : c.portfolioFileName.value,
                    readOnly: true,
                    decoration: const InputDecoration(hintText: '포트폴리오.pdf'),
                  ),
                  IconButton(icon: const Icon(Icons.attach_file), onPressed: c.pickPortfolioPdf),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            text: '저장하기',
            loading: c.isSaving.value,
            onPressed: c.canSave.value ? () { watch(); c.save(); } : null,
            filled: true,
          ),
          const SizedBox(height: 12),
        ],
      )),
    );
  }
}
