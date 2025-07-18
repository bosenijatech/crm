
import 'package:crm/ui/screens/task/taskhomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant.dart';

import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../dashboard.dart';

class Createtaskscreen extends StatefulWidget {
  const Createtaskscreen({super.key});

  @override
  State<Createtaskscreen> createState() => _CreatetaskscreenState();
}

class _CreatetaskscreenState extends State<Createtaskscreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController estimatedurationController =
      TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final TextEditingController dueDateController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  bool isBillable = false;
  DateTime? dueDate;
  String? status;
  String? priority;
  String? category;

  List<String> categorylist = [];

  //Assigned To
  Map<String, String> selectedSubassign = {};
  List<String> statuslist = [
    'Aborted',
    'Completed',
    'In Progress',
    'Not Started',
    'Scheduled',
  ];
  List<String> prioritylist = ['High', 'Medium', 'Low'];
  List<String> mainassign = ["Employee", "Contact", "Team"];
  Map<String, List<String>> subassign = {
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

  //time
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  // time Validation Function
  bool _isEndTimeAfterStartTime(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return endMinutes > startMinutes;
  }

  //date

  DateTime? startDate;
  DateTime? endDate;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  //Reminder
  List<Map<String, dynamic>> reminders = [];

  List<String> dropdownItems1 = ["Pop-up", "Email"];
  List<String> dropdownItems2 = ["Mintues", "Hours", "Days", "Weeks"];

  void addReminder() {
    setState(() {
      reminders.add({
        "dropdown1": null,
        "textController": TextEditingController(),
        "dropdown2": null,
      });
    });
  }

  void removeReminder(int index) {
    reminders[index]["textController"].dispose();
    setState(() {
      reminders.removeAt(index);
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
          "Create Task",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
             Get.to(() => Taskhomescreen());
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
              "Task Details",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Name',
              control: nameController,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Description',
              control: descriptionController,
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
              width: double.infinity,
              labelText: 'Due Date',
              control: dueDateController,
              readOnly: true, // Prevent manual typing
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Close keyboard if open

                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: dueDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (picked != null) {
                  setState(() {
                    dueDate = picked;
                    dueDateController.text =
                        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 6),

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

            Text(
              "Additional Information",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

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
                //end date
                Expanded(
                  child: CustomRoundedTextField(
                    suffixIcon: Icon(
                      Icons.calendar_month,
                      color: AppColor.primary,
                    ),
                    width: double.infinity,
                    labelText: 'End Date',
                    control: endDateController,
                    readOnly: true, // Prevent manual typing
                    onTap: () async {
                      FocusScope.of(
                        context,
                      ).requestFocus(FocusNode()); // Close keyboard

                      // ✅ Check if estimate date is selected
                      if (startDate == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please select Start Date first"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: endDate ?? startDate!,
                        firstDate:
                            startDate!, // 👈 Only allow dates from estimateDate onwards
                        lastDate: DateTime(2100),
                      );

                      if (picked != null) {
                        setState(() {
                          endDate = picked;
                          endDateController.text =
                              "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                        });
                      }
                    },
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Start Time Picker
            Row(
              children: [
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

                          if (endTime != null &&
                              !_isEndTimeAfterStartTime(picked, endTime!)) {
                            endTime = null;
                            endTimeController.clear();
                          }
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 30),
                // End Time Picker
                Expanded(
                  child: CustomRoundedTextField(
                    suffixIcon: Icon(
                      Icons.access_time,
                      color: AppColor.primary,
                    ),
                    width: double.infinity,
                    labelText: 'End Time',
                    control: endTimeController,
                    readOnly: true,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: endTime ?? TimeOfDay.now(),
                      );
                      if (picked != null) {
                        if (startTime == null ||
                            _isEndTimeAfterStartTime(startTime!, picked)) {
                          setState(() {
                            endTime = picked;
                            endTimeController.text = picked.format(context);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "End time must be after the start time.",
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Estimate Duration',
              control: estimatedurationController,
            ),
            const SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: statuslist,
              labelText: "Status",
              onChanged: (value) {
                setState(() {
                  status = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: prioritylist,
              labelText: "Priority",
              onChanged: (value) {
                setState(() {
                  priority = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: categorylist,
              labelText: "Category",
              onChanged: (value) {
                setState(() {
                  category = value;
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remind me",
                      style: TextStyle(
                        color: AppColor.mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    IconButton(icon: Icon(Icons.add), onPressed: addReminder),
                  ],
                ),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: reminders.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dropdown 1
                            CustomDropdownWidget(
                              valArr: dropdownItems1,
                              labelText: "Select Type",
                              onChanged: (value) {
                                setState(() {
                                  reminders[index]["dropdown1"] = value;
                                });
                              },
                              labelField: (item) => item.toString(),
                            ),
                            SizedBox(height: 10),

                            CustomRoundedTextField(
                              width: double.infinity,
                              type: TextInputType.number,
                              labelText: 'Duration',
                              control: reminders[index]["textController"],
                            ),
                            SizedBox(height: 16),
                            // Dropdown 2
                            CustomDropdownWidget(
                              valArr: dropdownItems2,
                              labelText: "Select Type",
                              onChanged: (value) {
                                setState(() {
                                  reminders[index]["dropdown2"] = value;
                                });
                              },
                              labelField: (item) => item.toString(),
                            ),
                            SizedBox(height: 10),
                            // Delete Button
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: () => removeReminder(index),
                                icon: Icon(Icons.delete, color: Colors.red),
                                label: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                              children: selectedSubassociate.entries.map((
                                entry,
                              ) {
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
          ],
        ),
      ),
    );
  }
}
