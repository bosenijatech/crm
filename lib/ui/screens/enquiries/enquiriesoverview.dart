import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';

class Enquiriesoverview extends StatefulWidget {
  const Enquiriesoverview({super.key});

  @override
  State<Enquiriesoverview> createState() => _EnquiriesoverviewState();
}

class _EnquiriesoverviewState extends State<Enquiriesoverview> {
  List<Map<String, String>> enqurieinfo = [
    {"left": "Name", "right": ""},
    {"left": "Sales Stage", "right": ""},
    {"left": "Customer", "right": ""},
    {"left": "Probability (%)", "right": ""},
    {"left": "Contact", "right": ""},
    {"left": "Type", "right": ""},
    {"left": "Lead Source ", "right": ""},
    {"left": "PDF Template", "right": ""},
    {"left": "Close Date", "right": ""},
    {"left": "Next Step", "right": ""},
    {"left": "Assigned To", "right": ""},
    {"left": "Amount", "right": ""},
    {"left": "Campaign", "right": ""},
    {"left": "Description", "right": ""},
    {"left": "Follow up Date", "right": ""},
    {"left": "Created By", "right": ""},
    {"left": "Modified By", "right": ""},
    {"left": "Created On", "right": ""},
    {"left": "Modified On", "right": ""},
    {"left": "Last Contacted", "right": ""},
    {"left": "Email Sequence", "right": ""},
  ];

  List<Map<String, String>> companyinfo = [
    {"left": "Market", "right": ""},
    {"left": "Segment", "right": ""},
    {"left": "Territory", "right": ""},
  ];

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
                "Enquiry Information",
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
              itemCount: enqurieinfo.length,
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
                            enqurieinfo[index]['left'] ?? '',
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
                            enqurieinfo[index]['right'] ?? '',
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
                "Company Information",
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
              itemCount: companyinfo.length,
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
                            companyinfo[index]['left'] ?? '',
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
                            companyinfo[index]['right'] ?? '',
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
            const SizedBox(height: 100),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 20,
                child: SvgPicture.asset(AppAssets.edit, width: 20, height: 20),
              ),
              title: const Text(
                'Edit',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 20,
                child: SvgPicture.asset(
                  AppAssets.follow,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Schedule Follow Up',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
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
              title: const Text(
                'Add Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
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
              title: const Text(
                'Log Call',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
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
              title: const Text(
                'Convert',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 20,
                child: SvgPicture.asset(
                  AppAssets.email,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'Send Emails',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
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
              title: const Text(
                'Duplicate',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 6),
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
              title: const Text(
                'Delete',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
