import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About BantuPay",
                style: TextStyle(
                    fontWeight: FontWeight.w500, letterSpacing: 1, fontSize: 26),
              ),
              SizedBox(height: 120.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Container(
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.deepOrange,
                      ),
                      child: Icon(
                        Icons.currency_bitcoin,
                        color: Colors.grey.shade100,
                        size: 34,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "v2.2.5",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "The BantuPay wallet is built and maintained by the the Bantu Blockchain Foundation. Your use of the BantuPay wallet is governed by our terms and conditions",
                      style: TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.h),
                    Text("2021 Bantu Blockchain Foundation. All rights reserved",
                        style: TextStyle(fontSize: 12.sp)),
                    SizedBox(height: 40.h),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
