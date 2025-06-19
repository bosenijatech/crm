import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';

class Leadoverviewscreen extends StatefulWidget {
  const Leadoverviewscreen({super.key});

  @override
  State<Leadoverviewscreen> createState() => _LeadoverviewscreenState();
}

class _LeadoverviewscreenState extends State<Leadoverviewscreen> {
  List<Map<String, String>> leadinfo = [
    {"left": "First Name", "right": "Banana"},
    {"left": "Last Name", "right": "Bike"},
    {"left": "Dog", "right": "Cat"},
    {"left": "Job Titile", "right": "Pencil"},
    {"left": "Best Way To Contact", "right": "Blue"},
    {"left": "Lead Status", "right": "Moon"},
    {"left": "Lead Source", "right": "Two"},
    {"left": "Type", "right": "No"},
    {"left": "Referred By", "right": "Cold"},
    {"left": "Assigned To", "right": "Out"},
    {"left": "Description", "right": "Out"},
  ];

  List<Map<String, String>> contactinfo = [
    {"left": "Phone (Business)", "right": "Banana"},
    {"left": "Email (Business)", "right": "Bike"},
    {"left": "Microsoft Teams", "right": "Cat"},
    {"left": "Unsubscribe", "right": "Pencil"},
    {"left": "Bounced", "right": "Blue"},
    {"left": "Bounced Reason", "right": "Moon"},
  ];

  List<Map<String, String>> addinfo = [
    {"left": "Potencial Amount", "right": "Banana"},
    {"left": "Estimate Close Date", "right": "Bike"},
    {"left": "Rank", "right": "Cat"},
    {"left": "Campaign", "right": "Pencil"},
    {"left": "Territory", "right": "Blue"},
    {"left": "Email Sequence", "right": "Moon"},
    {"left": "Follow Up Date", "right": "Two"},
    {"left": "Follow Up Description", "right": "No"},
    {"left": "Created By", "right": "Cold"},
    {"left": "Modified By", "right": "Out"},
    {"left": "Created On", "right": "Out"},
    {"left": "Modified On", "right": "Out"},
  ];
  List<Map<String, String>> add1info = [
    {"left": "Customer", "right": "Banana"},
    {"left": "Company", "right": "Bike"},
    {"left": "# of Employees", "right": "Cat"},
    {"left": "Annual Revenue", "right": "Pencil"},
    {"left": "Industry", "right": "Blue"},
  ];
  List<Map<String, String>> socialinfo = [
    {"left": "Facebook", "right": "Banana"},
    {"left": "Twitter", "right": "Bike"},
    {"left": "Linkedin", "right": "Cat"},
    {"left": "Website", "right": ""},
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
          IconButton(
            icon: SvgPicture.asset(
              AppAssets.hamburger, // your SVG asset path
              width: 18,
              height: 18,
            ),
            onPressed: () {
              // Handle dot menu tap
            },
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
              itemCount: add1info.length,
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
                            add1info[index]['left'] ?? '',
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
    );
  }
}
