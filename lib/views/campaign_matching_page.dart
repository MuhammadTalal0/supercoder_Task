import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/campaign_controller.dart';
import 'widgets/tag_chip.dart';
import '../theme/app_theme.dart';

class CampaignMatchingPage extends StatelessWidget {
  const CampaignMatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(CampaignController());

    final tabs = ['신청', '진행중', '완료'];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new), onPressed: () => Get.back()),
        title: const Text('캠페인 매칭', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: [
          // Tabs
          SizedBox(
            height: 44,
            child: Obx(() => Row(
              children: List.generate(tabs.length, (i) {
                final selected = c.tabIndex.value == i;
                return Expanded(
                  child: InkWell(
                    onTap: () => c.changeTab(i),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(tabs[i], style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selected ? Colors.black : Colors.grey,
                        )),
                        const SizedBox(height: 8),
                        Container(height: 2, color: selected ? AppTheme.primary : const Color(0xFFE9E9EE)),
                      ],
                    ),
                  ),
                );
              }),
            )),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Obx(() => ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (_, i) {
                final item = c.campaigns[i];
                return _CampaignCard(item: item);
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemCount: c.campaigns.length,
            )),
          ),
        ],
      ),
    );
  }
}

class _CampaignCard extends StatelessWidget {
  final dynamic item;
  const _CampaignCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(blurRadius: 12, color: Color(0x11000000), offset: Offset(0, 4))]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(item.desc, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: item.tags.take(4).map<Widget>((t) => TagChip(t)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
