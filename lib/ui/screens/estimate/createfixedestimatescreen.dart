import 'package:flutter/material.dart';

import '../../constant/constant.dart';

import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../customers/createcustomerscreen.dart';

class Createfixedestimatescreen extends StatefulWidget {
  const Createfixedestimatescreen({super.key});

  @override
  State<Createfixedestimatescreen> createState() =>
      _CreatefixedestimatescreenState();
}

class _CreatefixedestimatescreenState extends State<Createfixedestimatescreen> {
  final TextEditingController estimatenumberController =
      TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  final TextEditingController estimateDateController = TextEditingController();
  final TextEditingController expirationController = TextEditingController();

  TextEditingController summarysubtotalController = TextEditingController();
  TextEditingController summarydiscountController = TextEditingController();
  TextEditingController summarytaxController = TextEditingController();
  TextEditingController summaryshippingController = TextEditingController();
  TextEditingController summarytotalController = TextEditingController();

  DateTime? estimateDate;
  DateTime? expirationDate;
  String? customer;

  String? contact;
  String? Pdf;
  String? paymentterm;
  String? currency;
  String? discount;
  String? billing;
  String? shipping;
  String? email;
  String? phone;
  String? Coverpage;
  String? terms;
  String? tax;
  String? itemname;

  String? customercategory;
  List<String> customerlist = [];
  List<String> contactlist = [];
  List<String> Pdflist = [];
  List<String> currencylist = ['INR'];
  List<String> paymenttermlist = ['Immediate', 'Net 30', 'Net 45', 'Net 60'];
  List<String> discountlist = ['%', 'Fixed'];
  List<String> billinglist = [];
  List<String> shippinglist = [];
  List<String> emaillist = [];
  List<String> phonelist = [];
  List<String> Coverpagelist = [];
  List<String> termslist = [];
  List<String> taxlist = [];
  List<String> itemnamelist = [];

  List<String> customercategorylist = [];

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
          "Create Fixed Estimate",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
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
              "Estimate Details",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Estimate (Auto generated number)',
              control: estimatenumberController,
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
              width: double.infinity,
              labelText: 'Estimate Date',
              control: estimateDateController,
              readOnly: true, // Prevent manual typing
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Close keyboard if open

                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: estimateDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (picked != null) {
                  setState(() {
                    estimateDate = picked;
                    estimateDateController.text =
                        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                  });
                }
              },
            ),

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
                      MaterialPageRoute(
                        builder: (context) => CreatecustomerScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),

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
            const SizedBox(height: 16),

            CustomRoundedTextField(
              suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
              width: double.infinity,
              labelText: 'Expiration Date',
              control: expirationController,
              readOnly: true, // Prevent manual typing
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Close keyboard

                // ✅ Check if estimate date is selected
                if (estimateDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please select Estimate Date first"),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: expirationDate ?? estimateDate!,
                  firstDate:
                      estimateDate!, // 👈 Only allow dates from estimateDate onwards
                  lastDate: DateTime(2100),
                );

                if (picked != null) {
                  setState(() {
                    expirationDate = picked;
                    expirationController.text =
                        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                  });
                }
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Contact",
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
              valArr: contactlist,
              labelText: "Contact",
              onChanged: (value) {
                setState(() {
                  contact = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: Pdflist,
              labelText: "Pdf Template",
              onChanged: (value) {
                setState(() {
                  Pdf = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomDropdownWidget(
              valArr: paymenttermlist,
              labelText: "Payment Term",
              onChanged: (value) {
                setState(() {
                  paymentterm = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
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
                        percentageController
                            .clear(); // Clear text field if not %
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

            CustomDropdownWidget(
              valArr: billinglist,
              labelText: "Billing Address",
              onChanged: (value) {
                setState(() {
                  billing = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),

            CustomDropdownWidget(
              valArr: billinglist,
              labelText: "Shipping Address",
              onChanged: (value) {
                setState(() {
                  billing = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),

            CustomDropdownWidget(
              valArr: billinglist,
              labelText: "Email ID",
              onChanged: (value) {
                setState(() {
                  billing = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),

            CustomDropdownWidget(
              valArr: billinglist,
              labelText: "Phone Number",
              onChanged: (value) {
                setState(() {
                  billing = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            const SizedBox(height: 16),
            CustomRoundedTextField(
              verticalMargin: 16,
              lines: 6,
              width: double.infinity,
              labelText: 'Notes to customer',
              control: notesController,
            ),

            const SizedBox(height: 20),

            CustomDropdownWidget(
              valArr: Coverpagelist,
              labelText: "Cover Page",
              onChanged: (value) {
                setState(() {
                  Coverpage = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),

            CustomDropdownWidget(
              valArr: termslist,
              labelText: "Terms & Conditions",
              onChanged: (value) {
                setState(() {
                  terms = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            SizedBox(height: 16),
            Text(
              "Summary Section",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Sub Total',
              control: summarysubtotalController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Discount',
              control: summarydiscountController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Tax',
              control: summarytaxController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Shipping & Handling',
              control: summaryshippingController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Total',
              control: summarytotalController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
