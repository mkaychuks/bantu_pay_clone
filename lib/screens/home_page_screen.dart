import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/asset_card.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/total_balance_card.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: const Text("Home"),
          elevation: 0,
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.qr_code_scanner_outlined, color: Colors.black)),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications, color: Colors.black))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TotalBalanceCard(),
              SizedBox(height: 20.h),
              Text(
                "ASSETS",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              const AssetCard(),
              SizedBox(height: 20.h),
              MyCustomButton(
                onPressed: () {},
                title: "Activate Wallet",
                foregroundColor: Colors.white,
                backgroundColor: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
