import 'package:flutter/material.dart';

class ListItemTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const ListItemTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      dense: true,
      visualDensity: const VisualDensity(vertical: -2),
    );
  }
}
