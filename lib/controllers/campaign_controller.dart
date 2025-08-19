import 'package:get/get.dart';

class CampaignController extends GetxController {
  final tabIndex = 0.obs;

  void changeTab(int i) => tabIndex.value = i;

  // Mock campaign data
  final campaigns = List.generate(5, (i) => Campaign(
    title: '회사명 나오는 자리',
    desc: '소개말 나오는 자리입니다. 한줄만 나옵니다...',
    imageUrl: i.isEven
        ? 'https://picsum.photos/seed/p$i/600/400'
        : 'https://picsum.photos/seed/q$i/600/400',
    tags: const ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
  )).obs;
}

class Campaign {
  final String title;
  final String desc;
  final String imageUrl;
  final List<String> tags;
  Campaign({required this.title, required this.desc, required this.imageUrl, required this.tags});
}
