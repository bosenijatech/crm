

// ------------------------ Page 6 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_textfield.dart';

class LeadFormPage6 extends StatefulWidget {
  const LeadFormPage6({super.key});

  @override
  State<LeadFormPage6> createState() => _LeadFormPage6State();
}

class _LeadFormPage6State extends State<LeadFormPage6> {
  final TextEditingController facebook = TextEditingController();
  final TextEditingController x = TextEditingController();
  final TextEditingController linkedin = TextEditingController();
  final TextEditingController website = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Social Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Facebook',
            control: facebook,
          ),
          const SizedBox(height: 20),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'X',
            control: x,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Linkedin',
            control: linkedin,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Website',
            control: website,
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
