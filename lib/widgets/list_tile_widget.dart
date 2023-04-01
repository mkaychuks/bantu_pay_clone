import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingListTile extends StatelessWidget {
   const SettingListTile(
      {super.key, this.leading, this.subtitle, this.title, this.trailing, this.onTap});

  final Widget? leading;
  final Widget? trailing;
  final String? title;
  final Widget? subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: leading,
          title: Text(title ?? "", style: const TextStyle(fontSize: 10)),
          trailing: trailing,
          subtitle: subtitle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: const Divider(),
        )
      ],
    );
  }
}