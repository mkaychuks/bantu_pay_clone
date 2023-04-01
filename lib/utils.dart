import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/about_screen.dart';
import 'package:myapp/screens/help_support_page.dart';
import 'package:myapp/screens/otp_screen.dart';

final List walletSettingList = [
  {
    "icon": Icons.people,
    "title": "Referral",
    "onTap": const OTPScreen(),
  },
  {"icon": Icons.diamond, "title": "Curated Assets"},
  {"icon": Icons.cloud_download_outlined, "title": "Import Wallet"},
  {"icon": Icons.cloud_upload_outlined, "title": "Backup Wallet"},
];

final List preferenceSettingsList = [
  {
    "icon": Icons.language,
    "title": "Language",
    "onTap": const OTPScreen(),
    "trailing": SizedBox(
      width: 70.w,
      child: DropdownButtonFormField(
        elevation: 0,
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
        ),
        value: "ENG",
        items: [
          DropdownMenuItem(
            value: "ENG",
            child: Text(
              "ENG",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          DropdownMenuItem(
            value: "FRN",
            child: Text(
              "FRN",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ],
        onChanged: (Object? value) {},
      ),
    ),
  },
  {
    "icon": Icons.currency_exchange,
    "title": "Currency",
    "trailing": SizedBox(
      width: 70.w,
      child: DropdownButtonFormField(
        elevation: 0,
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
        ),
        value: "NGN",
        items: [
          DropdownMenuItem(
            value: "NGN",
            child: Text(
              "NGN",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          DropdownMenuItem(
            value: "USD",
            child: Text(
              "USD",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ],
        onChanged: (Object? value) {},
      ),
    ),
  },
  {
    "icon": Icons.draw,
    "title": "Theme",
    "trailing": SizedBox(
      width: 80.w,
      child: DropdownButtonFormField(
        elevation: 0,
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
        ),
        value: "Light",
        items: [
          DropdownMenuItem(
            value: "Light",
            child: Text(
              "Light",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          DropdownMenuItem(
            value: "Dark",
            child: Text(
              "Dark",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ],
        onChanged: (Object? value) {},
      ),
    ),
  },
];

bool switchState = false;

final List securitySettingList = [
  {
    "icon": Icons.key,
    "title": "Password Management",
    "trailing": const Icon(
      Icons.chevron_right,
      color: Colors.deepOrange,
    ),
    "onTap": const OTPScreen(),
  },
  {
    "icon": Icons.visibility_off,
    "title": "Hide my Balance",
    "trailing": Switch(
      value: true,
      onChanged: (value) {},
    ),
  },
  {
    "icon": Icons.timer,
    "title": "Time Out",
    "trailing": SizedBox(
      width: 135.w,
      child: DropdownButtonFormField(
        elevation: 0,
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
        icon: const Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
        ),
        value: "10 mins of inactivity",
        items: [
          DropdownMenuItem(
            value: "10 mins of inactivity",
            child: Text(
              "10 mins of inactivity",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          DropdownMenuItem(
            value: "5 mins of inactivity",
            child: Text(
              "5 mins of inactivity",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
        ],
        onChanged: (Object? value) {},
      ),
    ),
  },
  {
    "icon": Icons.fingerprint,
    "title": "Biometrics",
    "trailing": Switch(
      value: switchState,
      onChanged: (value) {
        switchState = value;
      },
    )
  },
];

final List moreSettingsList = [
  {
    "icon": Icons.chat_bubble_sharp,
    "title": "Help & Support",
    "trailing": const Icon(
      Icons.chevron_right,
      color: Colors.deepOrange,
    ),
    "onTap": const HelpAndSupportScreen()
  },
  {
    "icon": Icons.handshake,
    "title": "Terms of Use",
    "trailing": const Icon(
      Icons.chevron_right,
      color: Colors.deepOrange,
    ),
  },
  {
    "icon": Icons.info,
    "title": "About",
    "onTap": const AboutScreen(),
    "trailing": Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Version: 2.2.5", style: TextStyle(fontSize: 12.sp)),
        SizedBox(
          width: 4.w,
        ),
        const Icon(
          Icons.chevron_right,
          color: Colors.deepOrange,
        ),
      ],
    )
  },
];


final List helpAndSupportList = [
  {
    "leading": Icons.question_mark,
    "title": "BantuTalk",
    "externalLink": "https://www.google.com" 
  },
  {
    "leading": Icons.telegram,
    "title": "Telegram",
    "externalLink": "https://www.telegram.org" 
  },
  {
    "leading": Icons.facebook,
    "title": "Facebook",
    "externalLink": "https://www.facebook.com" 
  },
  {
    "leading": Icons.video_label,
    "title": "YouTube",
    "externalLink": "https://www.youtube.com" 
  },
  {
    "leading": Icons.camera_alt_outlined,
    "title": "Instagram",
    "externalLink": "https://www.instagram.com" 
  },
  {
    "leading": Icons.reddit,
    "title": "Reddit",
    "externalLink": "https://www.reddit.com" 
  },
  {
    "leading": Icons.mail,
    "title": "Medium",
    "externalLink": "https://www.medium.com" 
  }
];

