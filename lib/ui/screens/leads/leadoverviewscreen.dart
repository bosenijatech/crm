import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class Leadoverviewscreen extends StatefulWidget {
  const Leadoverviewscreen({super.key});

  @override
  State<Leadoverviewscreen> createState() => _LeadoverviewscreenState();
}

class _LeadoverviewscreenState extends State<Leadoverviewscreen> {
  List<Map<String, String>> leadinfo = [
    {"left": "First Name", "right": ""},
    {"left": "Last Name", "right": ""},
    {"left": "Job Titile", "right": ""},
    {"left": "Best Way To Contact", "right": ""},
    {"left": "Lead Status", "right": ""},
    {"left": "Lead Source", "right": ""},
    {"left": "Type", "right": ""},
    {"left": "Referred By", "right": ""},
    {"left": "Assigned To", "right": ""},
    {"left": "Description", "right": ""},
  ];

  List<Map<String, String>> contactinfo = [
    {"left": "Phone (Business)", "right": "98847487"},
    {"left": "Email (Business)", "right": ""},
    {"left": "Microsoft Teams", "right": ""},
    {"left": "Unsubscribe", "right": ""},
    {"left": "Bounced", "right": ""},
    {"left": "Bounced Reason", "right": ""},
  ];

  List<Map<String, String>> addinfo = [
    {"left": "Potencial Amount", "right": ""},
    {"left": "Estimate Close Date", "right": ""},
    {"left": "Rank", "right": ""},
    {"left": "Campaign", "right": ""},
    {"left": "Territory", "right": ""},
    {"left": "Email Sequence", "right": ""},
    {"left": "Follow Up Date", "right": ""},
    {"left": "Follow Up Description", "right": ""},
    {"left": "Created By", "right": ""},
    {"left": "Modified By", "right": ""},
    {"left": "Created On", "right": ""},
    {"left": "Modified On", "right": ""},
  ];
  List<Map<String, String>> bussinfo = [
    {"left": "Customer", "right": ""},
    {"left": "Company", "right": ""},
    {"left": "# of Employees", "right": ""},
    {"left": "Annual Revenue", "right": ""},
    {"left": "Industry", "right": ""},
  ];
  List<Map<String, String>> socialinfo = [
    {"left": "Facebook", "right": ""},
    {"left": "Twitter", "right": ""},
    {"left": "Linkedin", "right": ""},
    {"left": "Website", "right": ""},
  ];

  //Call
  void _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgLight,
      appBar: AppBar(
        toolbarHeight: 120,
        elevation: 1,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.apbarclr, AppColor.bgLight],
            ),
          ),
        ),
        title: Text(
          "Subburaj Overview",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
         Builder(
    builder: (context) => IconButton(
      icon: SvgPicture.asset(
        AppAssets.hamburger,
        width: 18,
        height: 18,
      ),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    ),
  ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Lead Information",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: leadinfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Text(
                            leadinfo[index]['left'] ?? '',
                            style: TextStyle(
                              color: AppColor.darker,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.lightpurpule,
                          ),
                          child: Text(
                            leadinfo[index]['right'] ?? '',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Contact Information",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contactinfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Text(
                            contactinfo[index]['left'] ?? '',
                            style: TextStyle(
                              color: AppColor.darker,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.lightpurpule,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                contactinfo[index]['right'].toString() ?? '',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              if (contactinfo[index]['right'] == '98847487')
                                CircleAvatar(
                                  radius: 16, // size of the circle
                                  backgroundColor: AppColor
                                      .primary, // background circle color
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.call,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      _makePhoneCall('98847487');
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Additional Information",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: addinfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Text(
                            addinfo[index]['left'] ?? '',
                            style: TextStyle(
                              color: AppColor.darker,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.lightpurpule,
                          ),
                          child: Text(
                            addinfo[index]['right'] ?? '',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Business Details",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bussinfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Text(
                            bussinfo[index]['left'] ?? '',
                            style: TextStyle(
                              color: AppColor.darker,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.lightpurpule,
                          ),
                          child: Text(
                            addinfo[index]['right'] ?? '',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Business Details",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: socialinfo.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(color: AppColor.white),
                          child: Text(
                            socialinfo[index]['left'] ?? '',
                            style: TextStyle(
                              color: AppColor.darker,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColor.lightpurpule,
                          ),
                          child: Text(
                            addinfo[index]['right'] ?? '',
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
  child: ListView(
    children: [
    const SizedBox(height: 100,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.edit, 
      width: 20,
      height: 20,
    ),
  ),
  title: const Text('Edit',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.follow, 
      width: 20,
      height: 20,
      color: Colors.white
    ),
  ),
  title: const Text('Schedule Follow Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.addtask, 
      width: 20,
      height: 20,
    ),
  ),
  title: const Text('Add Task',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.logcall, 
      width: 20,
      height: 20,
    ),
  ),
  title: const Text('Log Call',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.convert, 
      width: 20,
      height: 20,
    ),
  ),
  title: const Text('Convert',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.email, 
      width: 20,
      height: 20,
         color: Colors.white
    ),
  ),
  title: const Text('Send Emails',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.duplicate, 
      width: 20,
      height: 20,
   
    ),
  ),
  title: const Text('Duplicate',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
SizedBox(height: 6,),
  ListTile(
  leading: CircleAvatar(
    backgroundColor: AppColor.primary,
    radius: 20,
    child: SvgPicture.asset(
      AppAssets.delete, 
      width: 20,
      height: 20,
    ),
  ),
  title: const Text('Delete',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
    
    ],
  ),
),

    );
  }
}
