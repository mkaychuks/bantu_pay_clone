import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/widgets/list_tile_widget.dart';
import 'package:myapp/widgets/walletlists_settings_container.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.grey.shade100,
            elevation: 0),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help and Support",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.h),
              Text(
                "Please visit our BantuTalk community forum or visit any of our social media sites below for help. Be sure to subscribe or follow us in order to reciev our latest updates",
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20.h),
              ContainerWidget(
                height: 600.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: helpAndSupportList.length,
                  itemBuilder: (context, index) {
                    return SettingListTile(
                      leading: Icon(helpAndSupportList[index]["leading"]),
                      title: helpAndSupportList[index]["title"],
                      trailing: const Icon(Icons.chevron_right, color: Colors.deepOrange,),
                      onTap: () async {
                        final url = helpAndSupportList[index]["externalLink"];

                        final uri = Uri.parse(url);

                        if(await canLaunchUrl(uri)){
                          await launchUrl(uri);
                        } else {
                          throw "Could not launch $uri";
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
