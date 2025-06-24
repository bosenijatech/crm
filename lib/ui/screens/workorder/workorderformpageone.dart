
// ------------------------ Page 1 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class WorkorderFormPage1 extends StatefulWidget {
  const WorkorderFormPage1({super.key});

  @override
  State<WorkorderFormPage1> createState() => _WorkorderFormPage1State();
}

class _WorkorderFormPage1State extends State<WorkorderFormPage1> {
  final TextEditingController workordernameController = TextEditingController();
  final TextEditingController reportedDateController = TextEditingController();

  final TextEditingController approverController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  DateTime? reportedDate;

  String? workstatus;
  String? worktemplate;

  String? currency;
  String? itembeingserviced;
  String? assAssignedto;
  String? selectedSubValue;
  String? discount;
  String? salesorder;
  String? workcase;
  List<String> discountlist = ['%', 'Fixed'];
  List<String> currencylist = ['INR'];

  List<String> itembeingservicedlist = [];
  List<String> assAssignedtolist = ['Employee', 'Team'];

  List<String> employeeList = ['Emp 1', 'Emp 2', 'Emp 3'];
  List<String> teamList = ['Team A', 'Team B'];
  List<String> salesorderlist = [];
  List<String> workcaselist = [];

  List<String> workstatuslist = [
    'Approved',
    'Change Requested',
    'Completed',
    'Created',
    'In Progress',
    'Not Started',
    'On Hold',
    'Rejected',
    'Submitted',
  ];
  List<String> worktemplatelist = ['Default'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Order Details",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Work Order #',
            control: workordernameController,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
            width: double.infinity,
            labelText: 'Reported Date',
            control: reportedDateController,
            readOnly: true, // Prevent manual typing
            onTap: () async {
              FocusScope.of(
                context,
              ).requestFocus(FocusNode()); // Close keyboard if open

              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: reportedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (picked != null) {
                setState(() {
                  reportedDate = picked;
                  reportedDateController.text =
                      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                });
              }
            },
          ),
          SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workstatuslist,
            labelText: "Status",
            onChanged: (value) {
              setState(() {
                workstatus = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomDropdownWidget(
            valArr: worktemplatelist,
            labelText: "Template",
            onChanged: (value) {
              setState(() {
                worktemplate = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Approver',
            control: approverController,
          ),
          const SizedBox(height: 20),
          CustomDropdownWidget(
            valArr: currencylist,
            labelText: "Currency",
            onChanged: (value) {
              setState(() {
                currency = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: itembeingservicedlist,
            labelText: "Item being serviced",
            onChanged: (value) {
              setState(() {
                itembeingserviced = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdownWidget(
                valArr: discountlist,
                labelText: "Discount",
                onChanged: (value) {
                  setState(() {
                    discount = value;
                    if (discount != '%') {
                      percentageController.clear(); // Clear text field if not %
                    }
                  });
                },
                labelField: (item) => item.toString(),
              ),

              // Show TextField only when '%' is selected
              if (discount == '%')
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 4),
                  child: CustomRoundedTextField(
                    width: double.infinity,
                    labelText: 'Enter %',
                    control: percentageController,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              // 🔽 Main Dropdown: Assigned To
              CustomDropdownWidget(
                valArr: assAssignedtolist,
                labelText: "Assigned To",
                selectedItem: assAssignedto,
                onChanged: (value) {
                  setState(() {
                    assAssignedto = value;
                    selectedSubValue = null;
                  });
                },
                labelField: (item) => item.toString(),
              ),

              const SizedBox(height: 16),

              // 🔽 Dependent Dropdown
              if (assAssignedto == 'Employee')
                CustomDropdownWidget(
                  valArr: employeeList,
                  labelText: "Select Employee",
                  selectedItem: selectedSubValue,
                  onChanged: (value) {
                    setState(() {
                      selectedSubValue = value;
                    });
                  },
                  labelField: (item) => item.toString(),
                ),

              if (assAssignedto == 'Team')
                CustomDropdownWidget(
                  valArr: teamList,
                  labelText: "Select Team",
                  selectedItem: selectedSubValue,
                  onChanged: (value) {
                    setState(() {
                      selectedSubValue = value;
                    });
                  },
                  labelField: (item) => item.toString(),
                ),
            ],
          ),

          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: salesorderlist,
            labelText: "Sales Order",
            onChanged: (value) {
              setState(() {
                salesorder = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workcaselist,
            labelText: "Case",
            onChanged: (value) {
              setState(() {
                workcase = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
        ],
      ),
    );
  }
}
