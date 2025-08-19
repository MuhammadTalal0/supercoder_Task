import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../controllers/permission_controller.dart';
import '../routes/app_routes.dart';
import 'widgets/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = Get.put(SettingsController());
    final perms = Get.put(PermissionController());

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('안녕하세요,', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text('홍길동님', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                // floating circle "이미지 등록"
                GestureDetector(
                  onTap: () async {
                    await perms.requestPhotos();
                    Get.toNamed(Routes.basicInfo);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [
                      BoxShadow(blurRadius: 8, color: Color(0x22000000), offset: Offset(0, 2))
                    ]),
                    child: Column(
                      children: const [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(height: 4),
                        Text('이미지 등록', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            // "나의 캠페인" stats
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(blurRadius: 12, color: Color(0x11000000), offset: Offset(0, 4))],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Stat(number: settings.myApply),
                  const Icon(Icons.chevron_right),
                  _Stat(number: settings.myProgress),
                  const Icon(Icons.chevron_right),
                  _Stat(number: settings.myDone),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Menu list
            _MenuItem('내 정보', () => Get.toNamed(Routes.myInfo)),
            _MenuItem('공지사항', () {}),
            _MenuItem('1:1문의', () {}),
            _MenuItem('FAQ', () {}),
            _MenuItem('약관 및 정책', () {}),
            _MenuItem('로그아웃', () {}),
            _MenuItem('회원탈퇴', () {}),

            const SizedBox(height: 24),
            AppButton(text: '캠페인 매칭으로 이동', onPressed: () => Get.toNamed(Routes.campaign), filled: false),
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _MenuItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _Stat extends StatelessWidget {
  final RxInt number;
  const _Stat({required this.number});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        Text('${number.value}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        const SizedBox(height: 4),
        const Text('신청', style: TextStyle(color: Colors.grey)),
      ],
    ));
  }
}
