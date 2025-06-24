

// ------------------------ Page 3 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class WorkorderFormPage3 extends StatefulWidget {
  const WorkorderFormPage3({super.key});

  @override
  State<WorkorderFormPage3> createState() => _WorkorderFormPage3State();
}

class _WorkorderFormPage3State extends State<WorkorderFormPage3> {
  final TextEditingController Problemdescription = TextEditingController();

  String? severity;
  String? problemcode;
  String? urgency;
  List<String> urgencyist = ['Low', 'Medium', 'High'];
  List<String> severitylist = ['Critical', 'Major', 'Minor'];
  List<String> problemcodelist = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "Problem Summary",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          CustomDropdownWidget(
            valArr: severitylist,
            labelText: "Severity",
            onChanged: (value) {
              setState(() {
                severity = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),

          CustomDropdownWidget(
            valArr: problemcodelist,
            labelText: "Problem Code",
            onChanged: (value) {
              setState(() {
                problemcode = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: urgencyist,
            labelText: "Urgency",
            onChanged: (value) {
              setState(() {
                urgency = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Problem Description',
            control: Problemdescription,
            lines: 5,
          ),

          SizedBox(height: 10),
        ],
      ),
    );
  }
}
