import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import 'widgets/list_item_tile.dart';

class MyInfoPage extends StatelessWidget {
  const MyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()), title: const Text('내정보')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          children: [
            ListItemTile(title: '기본 정보', onTap: () => Get.toNamed(Routes.basicInfo)),
            const Divider(height: 1),
            ListItemTile(title: '비밀번호 설정', onTap: () => Get.toNamed(Routes.changePassword)),
            const Divider(height: 1),
            ListItemTile(title: '관심 카테고리', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
