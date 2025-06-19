import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';

class Estimateoverviewscreen extends StatefulWidget {
  const Estimateoverviewscreen({super.key});

  @override
  State<Estimateoverviewscreen> createState() => _EstimateoverviewscreenState();
}

class _EstimateoverviewscreenState extends State<Estimateoverviewscreen> {
  List<Map<String, String>> estimateinfo = [
    {"left": "Estimate #", "right": ""},
    {"left": "Estimate Date", "right": ""},
    {"left": "Customer", "right": ""},
    {"left": "Expiration Date", "right": ""},
    {"left": "Contact", "right": ""},
    {"left": "Type", "right": ""},
    {"left": "PDF Template", "right": ""},
    {"left": "Payment Term", "right": ""},
    {"left": "Currency", "right": ""},
    {"left": "Status", "right": ""},
    {"left": "Discount", "right": ""},
    {"left": "Billing Address", "right": ""},
    {"left": "Shipping Address", "right": ""},
    {"left": "Email id", "right": ""},
    {"left": "Mobile Number", "right": "98847487"},
    {"left": "Notes to Customer", "right": ""},
    {"left": "Cover Page", "right": ""},
    {"left": "Terms & Condition", "right": ""},
    {"left": "Created By", "right": ""},
    {"left": "Modified By", "right": ""},
    {"left": "Created On", "right": ""},
    {"left": "Modified On", "right": ""},
  ];

  List<Map<String, String>> serviceinfo = [
    {"left": "Task Name", "right": ""},
    {"left": "Hours", "right": ""},
    {"left": "Rate", "right": ""},
    {"left": "Tax Code", "right": ""},
    {"left": "Amount", "right": ""},
  ];
  List<Map<String, String>> summaryinfo = [
    {"left": "Sub Total", "right": ""},
    {"left": "Discount", "right": ""},
    {"left": "Tax", "right": ""},
    {"left": "Shipping & Handling", "right": ""},
    {"left": "Total", "right": ""},
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
          "EST-0001 Overview",
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
                "Estimate Details",
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
              itemCount: estimateinfo.length,
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
                            estimateinfo[index]['left'] ?? '',
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
                                estimateinfo[index]['right'] ?? '',
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                               if (estimateinfo[index]['right'] == '98847487')
                                CircleAvatar(
                                  radius: 16, 
                                  backgroundColor: AppColor
                                      .primary, 
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
                "Service Provided",
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
              itemCount: serviceinfo.length,
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
                            serviceinfo[index]['left'] ?? '',
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
                            serviceinfo[index]['right'] ?? '',
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
                "Summary Section",
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
              itemCount: serviceinfo.length,
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
                            serviceinfo[index]['left'] ?? '',
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
                            serviceinfo[index]['right'] ?? '',
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
