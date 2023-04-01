import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/welcome_screen.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widgets/list_tile_widget.dart';
import 'package:myapp/widgets/profile_card_widget.dart';
import 'package:myapp/widgets/settings_header.dart';
import 'package:myapp/widgets/walletlists_settings_container.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Settings",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              const SettingsHeaderWidget(
                title: "Profile",
                prefixIcon: Icons.person_2_outlined,
              ),
              SizedBox(height: 12.h),
              const ProfileCardWidget(
                title: Text("Achufusi Ifeanyi",
                    style: TextStyle(fontWeight: FontWeight.w500)),
                leading: CircleAvatar(radius: 22,child: CircleAvatar(backgroundColor: Colors.white,radius: 20, child: Text('A', style: TextStyle(color: Colors.black),),)),
                trailing: Icon(Icons.chevron_right, color: Colors.deepOrange),
              ),
              SizedBox(height: 16.h),
              const SettingsHeaderWidget(
                  title: "Wallet", prefixIcon: Icons.wallet),
              SizedBox(height: 16.h),
              ContainerWidget(
                height: 295,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: walletSettingList.length,
                  itemBuilder: (context, index) {
                    return SettingListTile(
                      leading: Icon(
                        walletSettingList[index]["icon"],
                        size: 20,
                      ),
                      title: walletSettingList[index]["title"],
                      trailing: const Icon(Icons.chevron_right,
                          color: Colors.deepOrange),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              const SettingsHeaderWidget(
                  prefixIcon: Icons.settings_sharp, title: "Preferences"),
              SizedBox(height: 16.h),
              ContainerWidget(
                height: 225,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: preferenceSettingsList.length,
                  itemBuilder: (context, index) {
                    return SettingListTile(
                        leading: Icon(
                          preferenceSettingsList[index]["icon"],
                          size: 20,
                        ),
                        title: preferenceSettingsList[index]["title"],
                        trailing: preferenceSettingsList[index]["trailing"]);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              const SettingsHeaderWidget(
                  prefixIcon: Icons.lock, title: "Security"),
              SizedBox(height: 16.h),
              ContainerWidget(
                height: 295,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: securitySettingList.length,
                  itemBuilder: (context, index) {
                    return SettingListTile(
                        leading: Icon(
                          securitySettingList[index]["icon"],
                          size: 20,
                        ),
                        title: securitySettingList[index]["title"],
                        trailing: securitySettingList[index]["trailing"]);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              const SettingsHeaderWidget(
                  prefixIcon: Icons.more_horiz_sharp, title: "More"),
              SizedBox(height: 16.h),
              ContainerWidget(
                height: 230,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: moreSettingsList.length,
                  itemBuilder: (context, index) {
                    return SettingListTile(
                      leading: Icon(
                        moreSettingsList[index]["icon"],
                        size: 20,
                      ),
                      title: moreSettingsList[index]["title"],
                      trailing: moreSettingsList[index]["trailing"],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                moreSettingsList[index]["onTap"],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.logout,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepOrange),
                    ),
                  )
                ],
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
