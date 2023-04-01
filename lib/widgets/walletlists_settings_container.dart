import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key, this.child, this.height});

  final double? height;
  final Widget? child;
  final double? width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r), color: Colors.white),
      child: child,
    );
  }
}