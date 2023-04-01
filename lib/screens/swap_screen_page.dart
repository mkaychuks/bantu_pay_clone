import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/walletlists_settings_container.dart';

class SwapPageScreen extends StatelessWidget {
  const SwapPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent,),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// The header of the page that has
              /// swap as its name
              Text(
                'Swap',
                style: TextStyle(
                    fontSize: 24.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              /// the container that house the swap area
              ContainerWidget(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("From"),
                      // Dropdown
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Select source asset",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
    
                      /// the spacer and the arrow button
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                              child: Divider(
                            color: Colors.grey,
                          )),
                          CircleAvatar(
                            radius: 33,
                            backgroundColor: Colors.grey.shade100,
                            child: const CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.blue,
                                size: 30,
                              ),
                            ),
                          ),
                          const Expanded(
                              child: Divider(
                            color: Colors.grey,
                          ))
                        ],
                      ),
                      const Text("To"),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Select destination asset",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 40.h),
                      const Text("Amount to Swap"),
                      TextFormField(decoration: const InputDecoration(hintText: "0"),),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
    
              SizedBox(height: 20.h),
              /// the button
              MyCustomButton(
                onPressed: () {},
                title: "Swap",
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
