import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "History",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Center(
                child: Text("No financial transactions yet"),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
