import 'package:crm/ui/screens/calllog/callloghomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../dashboard.dart';

class Createcalllogscreen extends StatefulWidget {
  const Createcalllogscreen({super.key});

  @override
  State<Createcalllogscreen> createState() => _CreatecalllogscreenState();
}

class _CreatecalllogscreenState extends State<Createcalllogscreen> {
  final TextEditingController callsubController = TextEditingController();
  final TextEditingController callsummaryController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  final TextEditingController durationController = TextEditingController();
  bool isBillable = false;

  String? type;
  String? priority;
  String? category;
  String? period;

  List<String> typelist = ["Incoming", "Outgoing"];
  List<String> periodlist = ["Seconds", "Minutes", "Hours"];

  //time and date
  final TextEditingController startTimeController = TextEditingController();

  TimeOfDay? startTime;

  DateTime? startDate;

  final TextEditingController startDateController = TextEditingController();

  //Attendees
  Map<String, String> selectedSubattendees = {};

  List<String> mainattendees = ["Employee", "Contact", "Team"];
  Map<String, List<String>> subattendees = {
    "Employee": ["Task 1", "Task 2"],
    "Contact": ["Task 1", "Task 2"],
    "Team": ["Task 1", "Task 2"],
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
          height: 180, // Adjust this value to your desired height
          child: ListView.builder(
            itemCount: mainattendees.length,
            itemBuilder: (context, index) {
              String person = mainattendees[index];
              return ListTile(
                title: Text(person),
                onTap: () {
                  Navigator.pop(context);
                  _showSubAttendeesDialog(person);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showSubAttendeesDialog(String person) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Select task for $person"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: subattendees[person]!.map((task) {
              return RadioListTile<String>(
                title: Text(task),
                value: task,
                groupValue: selectedSubattendees[person],
                onChanged: (value) {
                  setState(() {
                    selectedSubattendees[person] = value!;
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
      selectedSubattendees.remove(person);
    });
  }

  //Associated With
  Map<String, String> selectedSubassociate = {};

  List<String> mainassociate = [
    "Cases",
    "Contacts",
    "Customers",
    "Employees",
    "Estimates",
    "Expense Reports",
    "Invoices",
    "Items",
    "Leads",
    "Enquiries",
    "Sales Order View",
    "Projects",
    "Sales Receipts",
    "Suppliers",
    "Timesheets",
    "Work Orders",
  ];
  Map<String, List<String>> subassociate = {
    "Cases": ["Task 1", "Task 2"],
    "Contacts": ["Task 1", "Task 2"],
    "Customers": ["Task 1", "Task 2"],
    "Employees": ["Task 1", "Task 2"],
    "Estimates": ["Task 1", "Task 2"],
    "Expense Reports": ["Task 1", "Task 2"],
    "Invoices": ["Task 1", "Task 2"],
    "Items": ["Task 1", "Task 2"],
    "Leads": ["Task 1", "Task 2"],
    "Enquiries": ["Task 1", "Task 2"],
    "Sales Order View": ["Task 1", "Task 2"],
    "Projects": ["Task 1", "Task 2"],
    "Sales Receipts": ["Task 1", "Task 2"],
    "Suppliers": ["Task 1", "Task 2"],
    "Timesheets": ["Task 1", "Task 2"],
    "Work Orders": ["Task 1", "Task 2"],
  };

  void _showMainAssociateSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false, // set to true if you want full height control
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Container(
          height: 400, // Adjust this value to your desired height
          child: ListView.builder(
            itemCount: mainassociate.length,
            itemBuilder: (context, index) {
              String person = mainassociate[index];
              return ListTile(
                title: Text(person),
                onTap: () {
                  Navigator.pop(context);
                  _showSubAssociateDialog(person);
                },
              );
            },
          ),
        );
      },
    );
  }

  void _showSubAssociateDialog(String person) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Select Associate with $person"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: subassociate[person]!.map((task) {
              return RadioListTile<String>(
                title: Text(task),
                value: task,
                groupValue: selectedSubassociate[person],
                onChanged: (value) {
                  setState(() {
                    selectedSubassociate[person] = value!;
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

  void _removeselectedassociate(String person) {
    setState(() {
      selectedSubassociate.remove(person);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgLight,
      appBar: AppBar(
        leading: const BackButton(),
        toolbarHeight: 120,
        elevation: 1,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.apbarclr, AppColor.bgLight],
            ),
          ),
        ),
        title: const Text(
          "Create Log Call",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
          Get.to(() => Callloghomescreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Row(
              children: [
                Text("Create", style: TextStyle(color: Colors.white)),
                SizedBox(width: 4),
                Icon(Icons.add, size: 14, color: Colors.white),
              ],
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Call Log Detail",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Call Subject',
              control: callsubController,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Call Summary',
              control: callsummaryController,
            ),
            const SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: typelist,
              labelText: "Type",
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Billable",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: isBillable,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      setState(() {
                        isBillable = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            //start date
            Row(
              children: [
                Expanded(
                  child: CustomRoundedTextField(
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColor.primary,
                    ),
                    width: double.infinity,
                    labelText: 'Start Date',
                    control: startDateController,
                    readOnly: true, // Prevent manual typing
                    onTap: () async {
                      FocusScope.of(
                        context,
                      ).requestFocus(FocusNode()); // Close keyboard if open

                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (picked != null) {
                        setState(() {
                          startDate = picked;
                          startDateController.text =
                              "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: CustomRoundedTextField(
                    suffixIcon: Icon(
                      Icons.access_time,
                      color: AppColor.primary,
                    ),
                    width: double.infinity,
                    labelText: 'Start Time',
                    control: startTimeController,
                    readOnly: true,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: startTime ?? TimeOfDay.now(),
                      );
                      if (picked != null) {
                        setState(() {
                          startTime = picked;
                          startTimeController.text = picked.format(context);
                        });
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CustomRoundedTextField(
                    width: double.infinity,
                    labelText: 'Duration',
                    control: durationController,
                    type: TextInputType.number,
                  ),
                ),
                SizedBox(width: 30),
                Expanded(
                  child: CustomDropdownWidget(
                    valArr: periodlist,
                    labelText: "Duration Type",
                    onChanged: (value) {
                      setState(() {
                        period = value;
                      });
                    },
                    labelField: (item) => item.toString(),
                  ),
                ),
              ],
            ),

            Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Attendees",
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
                selectedSubattendees.isNotEmpty
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
                          children: selectedSubattendees.entries.map((entry) {
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
                                    icon: Icon(Icons.delete, color: Colors.red),
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
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Associated With",
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: _showMainAssociateSheet,
                    ),
                  ],
                ),

                // Show selected items
                selectedSubassociate.isNotEmpty
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
                          children: selectedSubassociate.entries.map((entry) {
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
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () =>
                                        _removeselectedassociate(entry.key),
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
          ],
        ),
      ),
    );
  }
}
