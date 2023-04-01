import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.foregroundColor
  });

  final String title;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity.w,
      height: 60.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,

        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 18.sp, letterSpacing: 1.2),
        ),
      ),
    );
  }
}
