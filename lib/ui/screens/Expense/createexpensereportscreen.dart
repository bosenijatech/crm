import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../constant/constant.dart';
import '../../constant/controller.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../customers/createcustomerscreen.dart';
import 'package:image_picker/image_picker.dart';

class Createexpensereportscreen extends StatefulWidget {
  const Createexpensereportscreen({super.key});

  @override
  State<Createexpensereportscreen> createState() =>
      _CreateexpensereportscreenState();
}

class _CreateexpensereportscreenState extends State<Createexpensereportscreen> {
  final TextEditingController expensenumberController = TextEditingController();
  final TextEditingController expenseemployeeController =
      TextEditingController();
  final TextEditingController expensedepartmentController =
      TextEditingController();
  final TextEditingController expensepurposeController =
      TextEditingController();
  final TextEditingController expenseadvancesappliedController =
      TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final TextEditingController expenseDateController = TextEditingController();

  TextEditingController totalexpensesController = TextEditingController();
  TextEditingController advanceappliedController = TextEditingController();
  TextEditingController reimbursableamountController = TextEditingController();
  TextEditingController supplementaryamountController = TextEditingController();

  List<List<TextEditingController>> expensedetailsControllers = [];
  List<bool> showNoteFields = [];
  bool isBillable = false;

  DateTime? expenseDate;



  String? customer;
  String? project;
  String? supplier;
  String? contact;
  String? category;

  List<String> customerlist = [];
  List<String> projectlist = [];
  List<String> supplierlist = [];
  List<String> contactlist = [];

 
  List<String> categorylist = [];

  //Expensedetails
  void addExpensedetailsField() {
    expensedetailsControllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    showNoteFields.add(false);
    setState(() {});
  }

  void removeExpensedetailsField(int index) {
    expensedetailsControllers.removeAt(index);
    showNoteFields.removeAt(index);
    setState(() {});
  }

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
          "Create Expense Report",
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
              "Expense Report Information",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Expense (Auto generated number)',
              control: expensenumberController,
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Employee',
              control: expenseemployeeController,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Department',
              control: expensedepartmentController,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Purpose',
              control: expensepurposeController,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Advances Applied',
              control: expenseadvancesappliedController,
            ),
            const SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: projectlist,
              labelText: "Project",
              onChanged: (value) {
                setState(() {
                  project = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomDropdownWidget(
              valArr: supplierlist,
              labelText: "Supplier",
              onChanged: (value) {
                setState(() {
                  supplier = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            CustomRoundedTextField(
              verticalMargin: 16,
              lines: 6,
              width: double.infinity,
              labelText: 'Description',
              control: descriptionController,
            ),
            const SizedBox(height: 16),

      

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expense Details",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: addExpensedetailsField,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: expensedetailsControllers.length,
              itemBuilder: (context, index) {
                final controllers = expensedetailsControllers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 0,
                  ),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(height: 12),

                        CustomRoundedTextField(
                          control: controllers[1],
                          labelText: 'Memo',
                          width: double.infinity,
                        ),
                        SizedBox(height: 20),
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
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: AppColor.primary,
                          ),
                          width: double.infinity,
                          labelText: 'Expense Date',
                          control: expenseDateController,
                          readOnly: true, // Prevent manual typing
                          onTap: () async {
                            FocusScope.of(context).requestFocus(
                              FocusNode(),
                            ); // Close keyboard if open

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
                        SizedBox(height: 6),
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
                        SizedBox(height: 6),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () => showImagePickerOptions(),
                                icon: Icon(
                                  Icons.upload_file,
                                  color: AppColor.primary,
                                ),
                                label: Text(
                                  "Upload Image",
                                  style: TextStyle(color: AppColor.primary),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(
                                    color: AppColor.primary,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
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

                        SizedBox(height: 20),

                        CustomRoundedTextField(
                          width: double.infinity,
                          control: controllers[2],
                          labelText: 'Amount',
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        CustomRoundedTextField(
                          width: double.infinity,
                          control: controllers[3],
                          labelText: 'Conversion Rate',
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 20),
                        CustomRoundedTextField(
                          width: double.infinity,
                          control: controllers[4],
                          labelText: 'Actual Amount',
                          type: TextInputType.number,
                        ),

                        SizedBox(height: 16),

                        /// Optional Note Field
                        if (showNoteFields[index]) ...[
                          CustomRoundedTextField(
                            control: controllers[5],
                            labelText: 'Note',
                            width: double.infinity,
                          ),
                          SizedBox(height: 16),
                        ],

                        /// --- Delete Button ---
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    showNoteFields[index] =
                                        !showNoteFields[index];
                                  });
                                },
                                icon: Icon(Icons.note_add),
                                label: Text(
                                  showNoteFields[index]
                                      ? 'Hide Note'
                                      : 'Add Note',
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.primary,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () =>
                                    removeExpensedetailsField(index),
                                icon: Icon(Icons.delete, color: Colors.white),
                                label: Text('Delete'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.actionColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 14),
                                  textStyle: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
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
              labelText: 'Total Expenses',
              control: totalexpensesController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Advance Applied',
              control: advanceappliedController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Reimbursable Amount',
              control: reimbursableamountController,
              type: TextInputType.number,
              verticalMargin: 16,
            ),

            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Supplementary Amount',
              control: supplementaryamountController,
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
