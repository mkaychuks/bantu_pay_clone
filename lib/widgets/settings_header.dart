import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({
    super.key,
    required this.prefixIcon,
    required this.title
  });

  final String title;
  final IconData prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(prefixIcon),
        SizedBox(width: 10.w,),
        Text(title, style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),)
      ],
    );
  }
}