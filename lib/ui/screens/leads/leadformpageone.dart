
// ------------------------ Page 1 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class LeadFormPage1 extends StatefulWidget {
  const LeadFormPage1({super.key});

  @override
  State<LeadFormPage1> createState() => _LeadFormPage1State();
}

class _LeadFormPage1State extends State<LeadFormPage1> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController jobtitle = TextEditingController();
  final TextEditingController refer = TextEditingController();
  final TextEditingController assign = TextEditingController();
  final TextEditingController descriotion = TextEditingController();
  String? title;
  String? contact;
  String? leadstatus;
  String? leadsource;
  String? selecttype;

  List<String> titlelist = ['Miss.', 'Mr.', 'Mrs.', 'Ms.'];
  List<String> contactlist = ['Email', 'SMS', 'Telephone'];
  List<String> leadstatuslist = [
    'New',
    'Assigned',
    'Inprogress',
    'Converted',
    'Recycled',
    'Dead',
  ];
  List<String> leadsourcelist = [
    'Advertisement',
    'Campaign',
    'Cold Call',
    'Conference',
    'Direct Mall',
    'Email',
  ];
  List<String> selecttypelist = ['Existing Business', 'New Business'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
          Text(
            "Lead Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          CustomDropdownWidget(
            valArr: titlelist,
            labelText: "Title",
            onChanged: (value) {
              setState(() {
                title = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'First Name',
            control: firstname,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Last Name',
            control: lastname,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Job Title',
            control: jobtitle,
          ),

          const SizedBox(height: 20),
          CustomDropdownWidget(
            valArr: contactlist,
            labelText: "Best way to Contact",
            onChanged: (value) {
              setState(() {
                contact = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomDropdownWidget(
            valArr: leadstatuslist,
            labelText: "Lead Status",
            onChanged: (value) {
              setState(() {
                leadstatus = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomDropdownWidget(
            valArr: leadsourcelist,
            labelText: "Lead Source",
            onChanged: (value) {
              setState(() {
                leadsource = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomDropdownWidget(
            valArr: selecttypelist,
            labelText: "Select Type",
            onChanged: (value) {
              setState(() {
                selecttype = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Referred By',
            control: refer,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Assigned To',
            control: assign,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Description',
            control: descriotion,
            lines: 5,
            verticalMargin: 16,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
