import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constant/constant.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';


class Createexpensescreen extends StatefulWidget {
  const Createexpensescreen({super.key});

  @override
  State<Createexpensescreen> createState() => _CreateexpensescreenState();
}

class _CreateexpensescreenState extends State<Createexpensescreen> {
  final TextEditingController memoController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  final TextEditingController expenseDateController = TextEditingController();

  TextEditingController amountController = TextEditingController();
  TextEditingController conversionController = TextEditingController();
  TextEditingController actualamountController = TextEditingController();
  TextEditingController summaryshippingController = TextEditingController();
  TextEditingController summarytotalController = TextEditingController();
  bool isBillable = false;
  DateTime? expenseDate;

  String? category;

  List<String> categorylist = [
    'Advertising',
    'Car & Truck Expenses',
    'Contractors',
    'Education & Training',
    'Employee Benefits',
    'Meals & Entertainment',
    'Office Expenses & Postage',
    'Other Expenses',
    'Professional Services',
    'Rent or Lease',
    'Suppliers',
    'Travels',
    'Utilities',
  ];

  List<String> customercategorylist = [];

  //image
  XFile? imageFile;
  File? imageSrc;
  String? liveimgSrc;

  Future<void> getImage(ImageSource source) async {
    try {
      // Close the bottom sheet or dialog if it's open
      Navigator.pop(context);

      final pickedImage = await ImagePicker().pickImage(source: source);

      if (pickedImage != null) {
        imageFile = pickedImage;
        imageSrc = File(pickedImage.path);

        // Optional: assign to liveimgSrc if you use it
        liveimgSrc = pickedImage.path;

        // Pass the image to your recognition logic
        // await getRecognizedText(pickedImage);

        setState(() {});
      } else {
        // Handle case when user cancels the picker
        debugPrint("No image selected.");
      }
    } catch (e) {
      debugPrint("Image picking failed: $e");
      setState(() {});
    }
  }

  // Future<void> getRecognizedText(XFile image) async {
  //   final inputImage = InputImage.fromFilePath(image.path);
  //   final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  //   final RecognizedText recognizedText = await textRecognizer.processImage(
  //     inputImage,
  //   );

  //   String scannedText = recognizedText.text;
  //   debugPrint("Extracted Text: $scannedText");

  //   // Store or use the result as needed
  //   setState(() {
  //     liveimgSrc = scannedText;
  //   });

  //   textRecognizer.close();
  // }

  int type = 0;

  void showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Take a photo"),
                onTap: () => getImage(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("Choose from gallery"),
                onTap: () => getImage(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );
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
          "Create Expense",
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
              "Expense Details",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Memo',
              control: memoController,
            ),
            const SizedBox(height: 20),

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
            const SizedBox(height: 16),

            CustomRoundedTextField(
              suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
              width: double.infinity,
              labelText: 'Expense Date',
              control: expenseDateController,
              readOnly: true, // Prevent manual typing
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Close keyboard if open

                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: expenseDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (picked != null) {
                  setState(() {
                    expenseDate = picked;
                    expenseDateController.text =
                        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 6),
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
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => showImagePickerOptions(),
                    icon: Icon(Icons.upload_file, color: AppColor.primary),
                    label: Text(
                      "Upload Image",
                      style: TextStyle(color: AppColor.primary),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColor.primary, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),

                if (imageSrc != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Customize the roundness
                      child: Image.file(
                        imageSrc!,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                  ),
              ],
            ),

            SizedBox(height: 16),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Amount',
              control: amountController,
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Conversion Rate',
              control: conversionController,
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Actual Amount',
              control: actualamountController,
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
