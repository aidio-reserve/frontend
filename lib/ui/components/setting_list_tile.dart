import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    super.key,
    required this.title,
    required this.iconName,
    this.subtitle,
    this.trailing,
    required this.onTap,
  });

  final String title;
  final IconData iconName;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconName,
        color: Theme.of(context).colorScheme.primary,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      trailing: Icon(Icons.arrow_forward_ios,
          color: Theme.of(context).colorScheme.primary),
      onTap: () {
        onTap?.call();
      },
    );
  }
}
