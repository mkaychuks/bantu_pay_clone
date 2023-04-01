import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormFieldWidget extends StatelessWidget {
  const MyTextFormFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.obscureText,
    this.icon,
    required this.onIconTap,
    this.validator,
    required this.controller
  });

  final String label;
  final String hintText;
  final bool obscureText;
  final IconData? icon;
  final void Function()? onIconTap;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h,),
        Text(label, style: TextStyle(fontSize: 14.sp)),
        SizedBox(height: 8.h,),
        SizedBox(
          width: double.infinity.w,
          child: TextFormField(
            obscureText: obscureText,
            validator: validator,
            controller: controller,
            maxLength: 20,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 16.sp),
              suffixIcon: obscureText
                  ? GestureDetector(
                      onTap: onIconTap,
                      child: const Icon(
                        Icons.visibility,
                        color: Colors.grey,
                        size: 20,
                      ),
                    )
                  : GestureDetector(
                      onTap: onIconTap,
                      child: const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }
}
