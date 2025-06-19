import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';


import 'package:image_picker/image_picker.dart';

import '../../constant/app_color.dart';
import '../../constant/controller.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import 'package:country_picker/country_picker.dart';



class CreateWorkorderScreen extends StatefulWidget {
  const CreateWorkorderScreen({super.key});

  @override
  State<CreateWorkorderScreen> createState() => _CreateWorkorderScreenState();
}

class _CreateWorkorderScreenState extends State<CreateWorkorderScreen> {
  int currentStep = 0;

  void goToNextStep() {
    if (currentStep < 3) {
      setState(() {
        currentStep += 1;
      });
    }
  }

  Future<bool> onBackPressed() async {
    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
      return false; // Don't pop, just step back
    }
    return true; // Pop the screen
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
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
            "Create Work Order",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            if (currentStep < 3)
              ElevatedButton(
                onPressed: goToNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF243D87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Next", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            else
              ElevatedButton(
                onPressed: goToNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF243D87),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Row(
                  children: [
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: index <= currentStep
                            ? const Color(0xFF243D87)
                            : Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (index != 3)
                      Container(
                        width: 30,
                        height: 2,
                        color: index <= currentStep
                            ? const Color(0xFF243D87)
                            : Colors.grey.shade400,
                      ),
                  ],
                );
              }),
            ),
            Expanded(
              child: IndexedStack(
                index: currentStep,
                children: const [
                  WorkorderFormPage1(),
                  WorkorderFormPage2(),
                  WorkorderFormPage3(),
                  WorkorderFormPage4(),
                
      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------ Page 1 ------------------------

class WorkorderFormPage1 extends StatefulWidget {
  const WorkorderFormPage1({super.key});

  @override
  State<WorkorderFormPage1> createState() => _WorkorderFormPage1State();
}

class _WorkorderFormPage1State extends State<WorkorderFormPage1> {
  final TextEditingController workordernameController = TextEditingController();
  final TextEditingController reportedDateController = TextEditingController();

  final TextEditingController approverController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  DateTime? reportedDate;

  String? workstatus;
  String? worktemplate;

  String? currency;
  String? itembeingserviced;
  String? assAssignedto;
  String? selectedSubValue;
  String? discount;
  String? salesorder;
  String? workcase;
  List<String> discountlist = ['%', 'Fixed'];
  List<String> currencylist = ['INR'];

  List<String> itembeingservicedlist = [];
  List<String> assAssignedtolist = ['Employee', 'Team'];

  List<String> employeeList = ['Emp 1', 'Emp 2', 'Emp 3'];
  List<String> teamList = ['Team A', 'Team B'];
  List<String> salesorderlist = [];
  List<String> workcaselist = [];

  List<String> workstatuslist = [
    'Approved',
    'Change Requested',
    'Completed',
    'Created',
    'In Progress',
    'Not Started',
    'On Hold',
    'Rejected',
    'Submitted',
  ];
  List<String> worktemplatelist = ['Default'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Work Order Details",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Work Order #',
            control: workordernameController,
          ),
          const SizedBox(height: 20),
          CustomRoundedTextField(
            suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
            width: double.infinity,
            labelText: 'Reported Date',
            control: reportedDateController,
            readOnly: true, // Prevent manual typing
            onTap: () async {
              FocusScope.of(
                context,
              ).requestFocus(FocusNode()); // Close keyboard if open

              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: reportedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (picked != null) {
                setState(() {
                  reportedDate = picked;
                  reportedDateController.text =
                      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                });
              }
            },
          ),
          SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workstatuslist,
            labelText: "Status",
            onChanged: (value) {
              setState(() {
                workstatus = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),
          CustomDropdownWidget(
            valArr: worktemplatelist,
            labelText: "Template",
            onChanged: (value) {
              setState(() {
                worktemplate = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Approver',
            control: approverController,
          ),
          const SizedBox(height: 20),
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
          CustomDropdownWidget(
            valArr: itembeingservicedlist,
            labelText: "Item being serviced",
            onChanged: (value) {
              setState(() {
                itembeingserviced = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 14),

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
                      percentageController.clear(); // Clear text field if not %
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
          Column(
            children: [
              // 🔽 Main Dropdown: Assigned To
              CustomDropdownWidget(
                valArr: assAssignedtolist,
                labelText: "Assigned To",
                selectedItem: assAssignedto,
                onChanged: (value) {
                  setState(() {
                    assAssignedto = value;
                    selectedSubValue = null;
                  });
                },
                labelField: (item) => item.toString(),
              ),

              const SizedBox(height: 16),

              // 🔽 Dependent Dropdown
              if (assAssignedto == 'Employee')
                CustomDropdownWidget(
                  valArr: employeeList,
                  labelText: "Select Employee",
                  selectedItem: selectedSubValue,
                  onChanged: (value) {
                    setState(() {
                      selectedSubValue = value;
                    });
                  },
                  labelField: (item) => item.toString(),
                ),

              if (assAssignedto == 'Team')
                CustomDropdownWidget(
                  valArr: teamList,
                  labelText: "Select Team",
                  selectedItem: selectedSubValue,
                  onChanged: (value) {
                    setState(() {
                      selectedSubValue = value;
                    });
                  },
                  labelField: (item) => item.toString(),
                ),
            ],
          ),

          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: salesorderlist,
            labelText: "Sales Order",
            onChanged: (value) {
              setState(() {
                salesorder = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
          const SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workcaselist,
            labelText: "Case",
            onChanged: (value) {
              setState(() {
                workcase = value;
              });
            },
            labelField: (item) => item.toString(),
          ),
        ],
      ),
    );
  }
}

// ------------------------ Page 2 ------------------------

class WorkorderFormPage2 extends StatefulWidget {
  const WorkorderFormPage2({super.key});

  @override
  State<WorkorderFormPage2> createState() => _WorkorderFormPage2State();
}

class _WorkorderFormPage2State extends State<WorkorderFormPage2> {
  final TextEditingController bouncedreason = TextEditingController();
  bool isUnsubscribed = false;
  bool isBounced = false;
  String? work1status;
  String? work1template;
  String? workservicelocation;

  List<String> work1templatelist = ['Default'];

  List<String> work1statuslist = [
    'Approved',
    'Change Requested',
    'Completed',
    'Created',
    'In Progress',
    'Not Started',
    'On Hold',
    'Rejected',
    'Submitted',
  ];

  List<String> workservicelocationlist = [];

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
          const SizedBox(height: 20),

          CustomDropdownWidget(
            valArr: work1statuslist,
            labelText: "Status",
            onChanged: (value) {
              setState(() {
                work1status = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 16),

          CustomDropdownWidget(
            valArr: work1templatelist,
            labelText: "Template",
            onChanged: (value) {
              setState(() {
                work1template = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: workservicelocationlist,
            labelText: "Service Location",
            onChanged: (value) {
              setState(() {
                workservicelocation = value;
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

// ------------------------ Page 3 ------------------------

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

// ------------------------ Page 4 ------------------------

class WorkorderFormPage4 extends StatefulWidget {
  const WorkorderFormPage4({super.key});

  @override
  State<WorkorderFormPage4> createState() => _WorkorderFormPage4State();
}

class _WorkorderFormPage4State extends State<WorkorderFormPage4> {
  final TextEditingController serviceDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  TextEditingController summarysubtotalController = TextEditingController();
  TextEditingController summarydiscountController = TextEditingController();
  TextEditingController summarytaxController = TextEditingController();
  TextEditingController summaryshippingController = TextEditingController();
  TextEditingController summarytotalController = TextEditingController();
  List<List<TextEditingController>> serviceControllers = [];
  List<List<TextEditingController>> productsoldControllers = [];
  List<bool> showNoteFields = [];
  List<bool> showNoteFields1 = [];

  DateTime? serviceDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  DateTime? estimateDate;
  DateTime? expirationDate;

  String? tax;
  String? itemname;

  String? customercategory;

  List<String> taxlist = [];
  List<String> itemnamelist = [];

  List<String> customercategorylist = [];

  // time Validation Function
  bool _isEndTimeAfterStartTime(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return endMinutes > startMinutes;
  }

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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            "Service Delivery Window",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          CustomRoundedTextField(
            suffixIcon: Icon(Icons.calendar_month, color: AppColor.primary),
            width: double.infinity,
            labelText: 'Estimate Date',
            control: serviceDateController,
            readOnly: true, // Prevent manual typing
            onTap: () async {
              FocusScope.of(
                context,
              ).requestFocus(FocusNode()); // Close keyboard if open

              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: serviceDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (picked != null) {
                setState(() {
                  serviceDate = picked;
                  serviceDateController.text =
                      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                });
              }
            },
          ),
          const SizedBox(height: 16),
          // Start Time Picker
          CustomRoundedTextField(
            suffixIcon: Icon(Icons.access_time, color: AppColor.primary),
            width: double.infinity,
            labelText: 'Start Time',
            control: startTimeController,
            readOnly: true,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: startTime ?? TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  startTime = picked;
                  startTimeController.text = picked.format(context);

                  if (endTime != null &&
                      !_isEndTimeAfterStartTime(picked, endTime!)) {
                    endTime = null;
                    endTimeController.clear();
                  }
                });
              }
            },
          ),

          const SizedBox(height: 16),

          // End Time Picker
          CustomRoundedTextField(
            suffixIcon: Icon(Icons.access_time, color: AppColor.primary),
            width: double.infinity,
            labelText: 'End Time',
            control: endTimeController,
            readOnly: true,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: endTime ?? TimeOfDay.now(),
              );
              if (picked != null) {
                if (startTime == null ||
                    _isEndTimeAfterStartTime(startTime!, picked)) {
                  setState(() {
                    endTime = picked;
                    endTimeController.text = picked.format(context);
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("End time must be after the start time."),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
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
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
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
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
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
                        control: controllers[1],
                        labelText: 'Item Code',
                        width: double.infinity,
                      ),
                      SizedBox(height: 20),
                      CustomRoundedTextField(
                        width: double.infinity,
                        control: controllers[2],
                        labelText: 'Item Qty',
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      CustomRoundedTextField(
                        width: double.infinity,
                        control: controllers[3],
                        labelText: 'UOM Category',
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      CustomRoundedTextField(
                        width: double.infinity,
                        control: controllers[4],
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
                        control: controllers[5],
                        labelText: 'Amount',
                        width: double.infinity,
                        type: TextInputType.number,
                      ),
                      SizedBox(height: 16),

                      /// Optional Note Field
                      if (showNoteFields1[index]) ...[
                        CustomRoundedTextField(
                          control: controllers[6],
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
                          SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},

                              label: Text('BOM'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: AppColor.darker,
                                    width: 1.5,
                                  ),
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

          SizedBox(height: 10),
        ],
      ),
    );
  }
}

// ------------------------ Page 5 ------------------------

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

