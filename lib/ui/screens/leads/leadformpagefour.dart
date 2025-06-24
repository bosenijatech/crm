
// ------------------------ Page 4 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../customers/createcustomerscreen.dart';

class LeadFormPage4 extends StatefulWidget {
  const LeadFormPage4({super.key});

  @override
  State<LeadFormPage4> createState() => _LeadFormPage4State();
}

class _LeadFormPage4State extends State<LeadFormPage4> {
  final TextEditingController companyamount = TextEditingController();
  final TextEditingController revenuereason = TextEditingController();

  String? customer;
  String? employees;
  String? industry;
  List<String> customerlist = [];
  List<String> employeeslist = [];
  List<String> industrylist = [];

  //employee range

 

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  void _showAddRangePopup() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Employee Range"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: fromController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "From"),
              ),
              TextField(
                controller: toController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "To"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                fromController.clear();
                toController.clear();
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
           ElevatedButton(
  onPressed: () {
    String from = fromController.text.trim();
    String to = toController.text.trim();

    if (from.isNotEmpty && to.isNotEmpty) {
      int fromVal = int.tryParse(from) ?? 0;
      int toVal = int.tryParse(to) ?? 0;

      if (fromVal < toVal) {
        String range = "$from - $to";
        setState(() {
          employeeslist.add(range);
          employees = range;
        });
        fromController.clear();
        toController.clear();
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("From value should be less than To value")),
        );
      }
    }
  },
  child: Text("Create"),
)

          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "Business Details",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Customer",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {
             Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreatecustomerScreen()),
    );
                },
                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomDropdownWidget(
            valArr: customerlist,
            labelText: "Customer",
            onChanged: (value) {
              setState(() {
                customer = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          SizedBox(height: 16),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Company(INR)',
            control: companyamount,
          ),

          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add # of Employees",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: _showAddRangePopup,
                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          CustomDropdownWidget(
            valArr: employeeslist,
            labelText: "# of Employees",
            onChanged: (value) {
              setState(() {
                employees = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 16),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Annual Revenue(INR)',
            control: revenuereason,
          ),

          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Territory",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          CustomDropdownWidget(
            valArr: industrylist,
            labelText: "Territory",
            onChanged: (value) {
              setState(() {
                industry = value;
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