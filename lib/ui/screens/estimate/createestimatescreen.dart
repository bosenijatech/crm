import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../constant/constant.dart';
import '../../constant/controller.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../customers/createcustomerscreen.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

import '../dashboard.dart';

class Createestimatescreen extends StatefulWidget {
  const Createestimatescreen({super.key});

  @override
  State<Createestimatescreen> createState() => _CreateestimatescreenState();
}

class _CreateestimatescreenState extends State<Createestimatescreen> {
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

  List<List<TextEditingController>> serviceControllers = [];
  List<List<TextEditingController>> productsoldControllers = [];
  List<bool> showNoteFields = [];
  List<bool> showNoteFields1 = [];
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

  //serviceprovided

  void addServiceProviderField() {
    serviceControllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
    showNoteFields.add(false);
    setState(() {});
  }

  void removeServiceProviderField(int index) {
    serviceControllers.removeAt(index);
    showNoteFields.removeAt(index);
    setState(() {});
  }

  //productsold
  void addProductsoldField() {
    productsoldControllers.add([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    
    
     
    ]);
    showNoteFields1.add(false);
    setState(() {});
  }

  void removeProductsoldField(int index) {
    productsoldControllers.removeAt(index);
    showNoteFields1.removeAt(index);
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
//   final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

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

  //add Tax

  void _showAddtaxPopup() {
    TextEditingController taxcodeController = TextEditingController();
    TextEditingController taxauthorityController = TextEditingController();

    final TaxController taxController = Get.put(TaxController());
    final TextEditingController taxRateController = TextEditingController();

    final TextEditingController labelController = TextEditingController();
    final EstimateController controller = Get.put(EstimateController());
    String? taxtype;
    List<String> taxtypelist = ['Percentage', 'Fixed'];

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Tax Code"),
            content: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRoundedTextField(
                      control: taxcodeController,
                      width: double.infinity,
                      labelText: 'Tax Code',
                      errMsg: nameErrorText,
                    ),
                    const SizedBox(height: 16),
                    CustomRoundedTextField(
                      control: taxauthorityController,
                      width: double.infinity,
                      labelText: 'Tax Authority',
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownWidget(
                      valArr: taxtypelist,
                      labelText: "Tax Rate Type",
                      selectedItem: taxController.taxtype.value,
                      onChanged: (value) {
                        taxController.taxtype.value = value;
                      },
                      labelField: (item) => item.toString(),
                    ),
                    const SizedBox(height: 14),
                    Obx(
                      () => CustomRoundedTextField(
                        control: taxRateController,
                        width: double.infinity,
                        labelText: 'Tax Rate',
                        type: TextInputType.number,
                        prefixIcon: taxController.taxtype.value == 'Fixed'
                            ? const Icon(
                                Icons.currency_rupee,
                                color: AppColor.primary,
                                size: 20,
                                weight: 600,
                              )
                            : taxController.taxtype.value == 'Percentage'
                            ? const Icon(
                                Icons.percent,
                                color: AppColor.primary,
                                size: 20,
                                weight: 600,
                              )
                            : null,
                      ),
                    ),

                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Available for Estimate",
                            style: TextStyle(
                              color: AppColor.mainColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: Switch(
                              value: controller.isAvailableEstimate.value,
                              activeColor: AppColor.primary,
                              onChanged: controller.toggleEstimate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomRoundedTextField(
                      width: double.infinity,
                      labelText: 'Print label',
                      control: labelController,

                      verticalMargin: 16,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  taxcodeController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newtax = taxcodeController.text.trim();
                  bool exists = taxlist.any(
                    (item) => item.toLowerCase() == newtax.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newtax.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Tax Code";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Tax Code already exists";
                    });
                  } else {
                    setState(() {
                      taxlist.add(newtax);
                      tax = newtax;
                    });

                    taxcodeController.clear();
                    labelController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Create"),
              ),
            ],
          ),
        );
      },
    );
  }

  //add item

  void _showAdditemPopup() {
    TextEditingController itemnameController = TextEditingController();
    TextEditingController itemautoController = TextEditingController();
    TextEditingController itemdescriptionController = TextEditingController();

    final TextEditingController priceController = TextEditingController();
    final TextEditingController salesrepController = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Item Name"),
            content: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomRoundedTextField(
                      control: itemnameController,
                      width: double.infinity,
                      labelText: 'Item Name',
                      errMsg: nameErrorText,
                    ),
                    const SizedBox(height: 16),
                    CustomRoundedTextField(
                      control: itemautoController,
                      width: double.infinity,
                      labelText: 'Item #',
                    ),
                    const SizedBox(height: 16),
                    CustomRoundedTextField(
                      control: itemdescriptionController,
                      width: double.infinity,
                      labelText: 'Description',
                      lines: 5,
                    ),
                    const SizedBox(height: 16),
                    CustomDropdownWidget(
                      valArr: taxlist,
                      labelText: "Item Tax Code",
                      onChanged: (value) {
                        setState(() {
                          tax = value;
                        });
                      },
                      labelField: (item) => item.toString(),
                    ),

                    const SizedBox(height: 14),

                    CustomRoundedTextField(
                      width: double.infinity,
                      labelText: 'Price(INR)',
                      control: priceController,
                      type: TextInputType.number,
                      verticalMargin: 16,
                    ),

                    const SizedBox(height: 16),

                    CustomRoundedTextField(
                      width: double.infinity,
                      labelText: 'Sales Rep. Commission(INR)',
                      control: salesrepController,
                      type: TextInputType.number,

                      verticalMargin: 16,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  itemnameController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newitem = itemnameController.text.trim();
                  bool exists = itemnamelist.any(
                    (item) => item.toLowerCase() == newitem.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newitem.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Item Name";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Item Name already exists";
                    });
                  } else {
                    setState(() {
                      itemnamelist.add(newitem);
                      itemname = newitem;
                    });

                    itemnameController.clear();

                    Navigator.pop(context);
                  }
                },
                child: const Text("Create"),
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
          "Create Estimate",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
            },
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
    FocusScope.of(context).requestFocus(FocusNode()); // Close keyboard

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
      firstDate: estimateDate!, // 👈 Only allow dates from estimateDate onwards
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Services Provided",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: addServiceProviderField,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: serviceControllers.length,
              itemBuilder: (context, index) {
                final controllers = serviceControllers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
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

                        /// --- Task Name Field ---
                        CustomRoundedTextField(
                          control: controllers[0],
                          labelText: 'Task Name',
                          width: double.infinity,
                        ),

                        SizedBox(height: 12),

                        /// --- Hours & Rate Row ---
                        Row(
                          children: [
                            Expanded(
                              child: CustomRoundedTextField(
                                control: controllers[1],
                                labelText: 'Hours',
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: CustomRoundedTextField(
                                control: controllers[2],
                                labelText: 'Rate',
                              ),
                            ),
                          ],
                        ),

                        /// --- Amount Field ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Tax Code",
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _showAddtaxPopup();
                              },
                              icon: Icon(Icons.add, color: AppColor.mainColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownWidget(
                          valArr: taxlist,
                          labelText: "Tax Code",
                          onChanged: (value) {
                            setState(() {
                              tax = value;
                            });
                          },
                          labelField: (item) => item.toString(),
                        ),

                        SizedBox(height: 12),

                        /// --- Amount Field ---
                        CustomRoundedTextField(
                          control: controllers[3],
                          labelText: 'Amount',
                          width: double.infinity,
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 16),

                        /// Optional Note Field
                        if (showNoteFields[index]) ...[
                          CustomRoundedTextField(
                            control: controllers[4],
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
                            SizedBox(width: 30),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () =>
                                    removeServiceProviderField(index),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Products/Items Sold",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: addProductsoldField,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: productsoldControllers.length,
              itemBuilder: (context, index) {
                final controllers = productsoldControllers[index];
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
                        Column(
  children: [
    SizedBox(
      height: 50,
  width: double.infinity,
  child: OutlinedButton.icon(
    onPressed: () => showImagePickerOptions(),
    icon: Icon(Icons.upload_file, color: AppColor.primary),
    label: Text("Upload Image", style: TextStyle(color: AppColor.primary)),
    style: OutlinedButton.styleFrom(
      side: BorderSide(color: AppColor.primary, width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16),
    ),
  ),
)
,
  
    if (imageSrc != null)
   Padding(
     padding: const EdgeInsets.only(top: 14,),
     child: ClipRRect(
       borderRadius: BorderRadius.circular(12), // Customize the roundness
       child: Image.file(
      imageSrc!,
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
       ),
     ),
   )

  ],
),
        

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " Add Item Name",
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _showAdditemPopup();
                              },

                              icon: Icon(Icons.add, color: AppColor.mainColor),
                            ),
                          ],
                        ),
                        CustomDropdownWidget(
                          valArr: itemnamelist,
                          labelText: "Item Name",
                          onChanged: (value) {
                            setState(() {
                              itemname = value;
                            });
                          },
                          labelField: (item) => item.toString(),
                        ),

                        SizedBox(height: 12),

                        /// --- Hours & Rate ---
                      
                        CustomRoundedTextField(
                                control: controllers[0],
                                labelText: 'Item Code',
                                width: double.infinity,
                              ),
   SizedBox(height: 20),
                               CustomRoundedTextField(
                                 width: double.infinity,
                                control: controllers[1],
                                labelText: 'Item Qty',
                                type: TextInputType.number,
                              ),
   SizedBox(height: 20),
                               CustomRoundedTextField(
                                 width: double.infinity,
                                control: controllers[2],
                                labelText: 'UOM Category',
                                type: TextInputType.number,
                              ),
   SizedBox(height: 20),
                               CustomRoundedTextField(
                                 width: double.infinity,
                                control: controllers[3],
                                labelText: 'Item Rate',
                                type: TextInputType.number,
                              ),
   
                     

                        /// --- Amount Field ---
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add Tax Code",
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _showAddtaxPopup();
                              },
                              icon: Icon(Icons.add, color: AppColor.mainColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        CustomDropdownWidget(
                          valArr: taxlist,
                          labelText: "Tax Code",
                          onChanged: (value) {
                            setState(() {
                              tax = value;
                            });
                          },
                          labelField: (item) => item.toString(),
                        ),

                        SizedBox(height: 12),

                        /// --- Amount Field ---
                        CustomRoundedTextField(
                          control: controllers[4],
                          labelText: 'Amount',
                          width: double.infinity,
                          type: TextInputType.number,
                        ),
                        SizedBox(height: 16),

                        /// Optional Note Field
                        if (showNoteFields1[index]) ...[
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
                                    showNoteFields1[index] =
                                        !showNoteFields1[index];
                                  });
                                },
                                icon: Icon(Icons.note_add),
                                label: Text(
                                  showNoteFields1[index]
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
                                onPressed: () => removeProductsoldField(index),
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
                            SizedBox(width:10),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                              
                                label: Text('BOM'),
                                style: ElevatedButton.styleFrom(
                                 
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(color: AppColor.darker,width: 1.5)
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
