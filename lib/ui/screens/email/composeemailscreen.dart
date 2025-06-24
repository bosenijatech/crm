import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import '../../widgets/custom_textfield.dart';

class Composeemailscreen extends StatefulWidget {
  const Composeemailscreen({super.key});

  @override
  State<Composeemailscreen> createState() => _ComposeemailscreenState();
}

class _ComposeemailscreenState extends State<Composeemailscreen> {
  //Assigned To
  Map<String, String> selectedSubassign = {};

  List<String> mainassign = [
    "Cases",
    "Contacts",
    "Customers",
    "Estimates",
    "Expense Reports",
    "Invoices",
    "Leads",
    "Enquiries",
    "Sales Order",
    "Projects",
    "Suppliers",
    "Timesheets",
    "Work Orders",
  ];
  Map<String, List<String>> subassign = {
    "Cases": ["Task 1", "Task 2"],
    "Contacts": ["Task 1", "Task 2"],
    "Customers": ["Task 1", "Task 2"],
    "Estimates": ["Task 1", "Task 2"],
    "Expense Reports": ["Task 1", "Task 2"],
    "Invoices": ["Task 1", "Task 2"],
    "Leads": ["Task 1", "Task 2"],
    "Enquiries": ["Task 1", "Task 2"],
    "Sales Order": ["Task 1", "Task 2"],
    "Projects": ["Task 1", "Task 2"],
    "Suppliers": ["Task 1", "Task 2"],
    "Timesheets": ["Task 1", "Task 2"],
    "Work Orders": ["Task 1", "Task 2"],
  };

  void _showMainAssignSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false, // set to true if you want full height control
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          height: 300, // Adjust this value to your desired height
          child: ListView.builder(
            itemCount: mainassign.length,
            itemBuilder: (context, index) {
              String person = mainassign[index];
              return ListTile(
                title: Text(person),
                onTap: () {
                  Navigator.pop(context);
                  _showSubAssignDialog(person);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showSubAssignDialog(String person) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Select task for $person"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: subassign[person]!.map((task) {
              return RadioListTile<String>(
                title: Text(task),
                value: task,
                groupValue: selectedSubassign[person],
                onChanged: (value) {
                  setState(() {
                    selectedSubassign[person] = value!;
                  });
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _removeselectedassign(String person) {
    setState(() {
      selectedSubassign.remove(person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Compose Email",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppAssets.pin,
                    width: 18,
                    height: 18,
                    color: AppColor.darker,
                  ),
                ),
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppAssets.tag,
                    width: 18,
                    height: 18,
                    color: AppColor.darker,
                  ),
                ),
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppAssets.send,
                    width: 18,
                    height: 18,
                    color: AppColor.darker,
                  ),
                ),
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppAssets.dot,
                    width: 18,
                    height: 18,
                    color: AppColor.darker,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'From',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: CustomRoundedTextField()),
                ],
              ),
              SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Template',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: CustomRoundedTextField()),
                ],
              ),
              SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'To',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: CustomRoundedTextField()),
                ],
              ),
              SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.darkgreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'CC',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: CustomRoundedTextField()),
                ],
              ),
              SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 80,
                    decoration: BoxDecoration(
                      color: AppColor.lightorange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'BCC',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(child: CustomRoundedTextField()),
                ],
              ),
              SizedBox(height: 10),
              CustomRoundedTextField(width: double.infinity, lines: 8),
              Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Assigned To",
                        style: TextStyle(
                          color: AppColor.mainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: _showMainAssignSheet,
                      ),
                    ],
                  ),

                  // Show selected items
                  selectedSubassign.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: selectedSubassign.entries.map((entry) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${entry.key}: ${entry.value}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () =>
                                          _removeselectedassign(entry.key),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : SizedBox.shrink(),
                      
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                            "Tags",
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                  Text(
                            "Attachments",
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
