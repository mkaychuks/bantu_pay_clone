import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalBalanceCard extends StatelessWidget {
  const TotalBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      width: double.infinity,
      height: 150.h,
      decoration: BoxDecoration(
          color: Colors.deepOrange, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // the total balance and the eye row
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Total Balance", style: TextStyle(fontSize: 18.sp, color: Colors.white),),
              SizedBox(width: 12.w,),
              const Icon(Icons.visibility, color: Colors.white,),
            ],
          ),
          SizedBox(height: 20.h,),
          Text("0", style: TextStyle(fontSize: 30.sp, color: Colors.white),),
          Text("= 0 USD", style: TextStyle(fontSize: 24.sp, color: Colors.white),),
        ],
      ),
    );
  }
}