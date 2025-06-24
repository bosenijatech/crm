// ------------------------ Page 2 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';

class WorkorderFormPage2 extends StatefulWidget {
  const WorkorderFormPage2({super.key});

  @override
  State<WorkorderFormPage2> createState() => _WorkorderFormPage2State();
}

class _WorkorderFormPage2State extends State<WorkorderFormPage2> {
  final TextEditingController bouncedreason = TextEditingController();
  bool isUnsubscribed = false;
  bool isBounced = false;
  String? work1status;
  String? work1template;
  String? workservicelocation;

  List<String> work1templatelist = ['Default'];

  List<String> work1statuslist = [
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

  List<String> workservicelocationlist = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "Contact Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),

          CustomDropdownWidget(
            valArr: work1statuslist,
            labelText: "Status",
            onChanged: (value) {
              setState(() {
                work1status = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 16),

          CustomDropdownWidget(
            valArr: work1templatelist,
            labelText: "Template",
            onChanged: (value) {
              setState(() {
                work1template = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workservicelocationlist,
            labelText: "Service Location",
            onChanged: (value) {
              setState(() {
                workservicelocation = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}