import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';

class Expenseoverviewscreen extends StatefulWidget {
  const Expenseoverviewscreen({super.key});

  @override
  State<Expenseoverviewscreen> createState() => _ExpenseoverviewscreenState();
}

class _ExpenseoverviewscreenState extends State<Expenseoverviewscreen> {
  List<Map<String, String>> expenseinfo = [
    {"left": "Memo", "right": ""},
    {"left": "Category", "right": ""},
    {"left": "Category Account", "right": ""},
    {"left": "Expense Date", "right": ""},
    {"left": "Billable", "right": ""},
    {"left": "Lead Source", "right": ""},
    {"left": "Receipt", "right": ""},
    {"left": "Amount", "right": ""},
    {"left": "Attendees", "right": ""},
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
          "Demo Overview",
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                "Expense Details",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: expenseinfo.length,
              itemBuilder: (context, index) {
                String label = expenseinfo[index]['left'] ?? '';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                          ),
                          child: Text(
                                  expenseinfo[index]['right'] ?? '',
                                  style: const TextStyle(
                                    color: Colors.deepPurple,
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
                child: Icon(Icons.add, color: Colors.white, size: 20),
              ),
              title: const Text(
                'Create Exp Report',
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
                'From Exp Report',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(height: 6),
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
