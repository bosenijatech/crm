
// ------------------------ Page 2 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class LeadFormPage2 extends StatefulWidget {
  const LeadFormPage2({super.key});

  @override
  State<LeadFormPage2> createState() => _LeadFormPage2State();
}

class _LeadFormPage2State extends State<LeadFormPage2> {
  List<TextEditingController> phoneControllers = [];
  List<TextEditingController> emailControllers = [];
  final TextEditingController skype = TextEditingController();
  final TextEditingController bouncedreason = TextEditingController();
  bool isUnsubscribed = false;
  bool isBounced = false;
  String? mobiletype;
  String? emailtype;
  List<String> mobiletypelist = ['Business', 'FAX', 'Home', 'Mobile', 'Other'];
  List<String> emailtypelist = ['Home', 'Mobile'];
  void addPhoneField() {
    setState(() {
      phoneControllers.add(TextEditingController());
    });
  }

  void addEmailField() {
    setState(() {
      emailControllers.add(TextEditingController());
    });
  }

  void removePhoneField(int index) {
    setState(() {
      phoneControllers[index].dispose();
      phoneControllers.removeAt(index);
    });
  }

  void removeEmailField(int index) {
    setState(() {
      emailControllers[index].dispose();
      emailControllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var controller in phoneControllers) {
      controller.dispose();
    }
    for (var controller in emailControllers) {
      controller.dispose();
    }
    super.dispose();
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
            "Contact Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Phone",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: addPhoneField,
                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          SizedBox(height: 6),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: phoneControllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRoundedTextField(
                        control: phoneControllers[index],
                        labelText: 'Phone Number',
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removePhoneField(index),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 10),

          CustomDropdownWidget(
            valArr: mobiletypelist,
            labelText: "Select Type",
            onChanged: (value) {
              setState(() {
                mobiletype = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Email",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: addEmailField,
                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          SizedBox(height: 6),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: emailControllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomRoundedTextField(
                        control: emailControllers[index],
                        labelText: 'Email',
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeEmailField(index),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 10),
          CustomDropdownWidget(
            valArr: emailtypelist,
            labelText: "Select Type",
            onChanged: (value) {
              setState(() {
                emailtype = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          SizedBox(height: 10),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Skype',
            control: skype,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Unsubscribed",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isUnsubscribed,
                  activeColor: AppColor.primary,
                  onChanged: (value) {
                    setState(() {
                      isUnsubscribed = value;
                    });
                  },
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Bounced",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Transform.scale(
                scale: 0.8,
                child: Switch(
                  value: isBounced,
                  activeColor: AppColor.primary,
                  onChanged: (value) {
                    setState(() {
                      isBounced = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Bounced Reason',
            control: bouncedreason,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}