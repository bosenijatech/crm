
// ------------------------ Page 5 ------------------------

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class LeadFormPage5 extends StatefulWidget {
  const LeadFormPage5({super.key});

  @override
  State<LeadFormPage5> createState() => _LeadFormPage5State();
}

class _LeadFormPage5State extends State<LeadFormPage5> {
  final TextEditingController addressline1 = TextEditingController();
  final TextEditingController addressline2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController zipcode = TextEditingController();

  String? addresstype;

  String? selectedCountryName;

  List<String> addresstypelist = [
    'Billing Address',
    'Shipping Address',
    'Communication',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            "Address Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          CustomDropdownWidget(
            valArr: addresstypelist,
            labelText: "Address Type",
            onChanged: (value) {
              setState(() {
                addresstype = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Address Line1',
            control: addressline1,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Address Line2',
            control: addressline2,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'City',
            control: city,
          ),

          const SizedBox(height: 14),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'State',
            control: state,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Zip Code',
            control: zipcode,
          ),
          const SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: false,
                onSelect: (Country country) {
                  setState(() {
                    selectedCountryName = country.name;
                  });
                },
              );
            },
            child: AbsorbPointer(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: AppColor.primary),
                    labelText: 'Select Country',
                    labelStyle: TextStyle(color: AppColor.grey),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.darker,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  controller: TextEditingController(text: selectedCountryName),
                  readOnly: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}