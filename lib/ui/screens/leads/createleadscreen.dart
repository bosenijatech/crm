import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import 'package:country_picker/country_picker.dart';

import '../customers/createcustomerscreen.dart';

class CreateLeadScreen extends StatefulWidget {
  const CreateLeadScreen({super.key});

  @override
  State<CreateLeadScreen> createState() => _CreateLeadScreenState();
}

class _CreateLeadScreenState extends State<CreateLeadScreen> {
  int currentStep = 0;

  void goToNextStep() {
    if (currentStep < 5) {
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
            "Create Lead",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
           if (currentStep < 5)
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
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
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
              children: List.generate(6, (index) {
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
                    if (index != 5)
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
                  LeadFormPage1(),
                  LeadFormPage2(),
                  LeadFormPage3(),
                  LeadFormPage4(),
                  LeadFormPage5(),
                  LeadFormPage6(),
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

// ------------------------ Page 2 ------------------------

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

// ------------------------ Page 3 ------------------------

class LeadFormPage3 extends StatefulWidget {
  const LeadFormPage3({super.key});

  @override
  State<LeadFormPage3> createState() => _LeadFormPage3State();
}

class _LeadFormPage3State extends State<LeadFormPage3> {
  final TextEditingController potentialamount = TextEditingController();
  final TextEditingController bouncedreason = TextEditingController();

  final TextEditingController closeDateController = TextEditingController();

  DateTime? selectedDate;
  String? campaign;
  String? territory;
  String? rank;
  List<String> ranklist = ['Low', 'Medium', 'High'];
  List<String> campaignlist = [];
  List<String> territorylist = [];

  //create Campaign

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _showAddCampaignPopup() {
    TextEditingController campaignnameController = TextEditingController();
    TextEditingController startDateController = TextEditingController();
    TextEditingController endDateController = TextEditingController();
    final TextEditingController campaigndescriotion = TextEditingController();

    DateTime? startDate;
    DateTime? endDate;

    String? nameErrorText;
    String? startDateErrorText;
    String? endDateErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Add New Campaign"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔸 Campaign Name
                CustomRoundedTextField(
                  control: campaignnameController,
                  width: double.infinity,
                  labelText: 'Campaign Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                // 🔸 Start Date
                GestureDetector(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: startDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setStateDialog(() {
                        startDate = picked;
                        startDateController.text = _formatDate(picked);
                        startDateErrorText = null;
                        if (endDate != null && endDate!.isBefore(startDate!)) {
                          endDate = null;
                          endDateController.clear();
                        }
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomRoundedTextField(
                      control: startDateController,
                      width: double.infinity,
                      labelText: 'Start Date',
                      errMsg: startDateErrorText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 🔸 End Date
                GestureDetector(
                  onTap: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: endDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setStateDialog(() {
                        endDate = picked;
                        endDate = picked;
                        endDateController.text = _formatDate(picked);
                        endDateErrorText = null;
                        if (startDate != null &&
                            endDate!.isBefore(startDate!)) {
                          startDate = null;
                          startDateController.clear();
                        }
                      });
                    }
                  },
                  child: AbsorbPointer(
                    child: CustomRoundedTextField(
                      control: endDateController,
                      width: double.infinity,
                      labelText: 'End Date',
                      errMsg: endDateErrorText,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: campaigndescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  campaignnameController.clear();
                  startDateController.clear();
                  endDateController.clear();
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newCampaign = campaignnameController.text.trim();
                  bool exists = campaignlist.any(
                    (item) => item.toLowerCase() == newCampaign.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                    startDateErrorText = null;
                    endDateErrorText = null;
                  });

                  if (newCampaign.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a campaign name";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Campaign already exists";
                    });
                  } else if (startDate == null) {
                    setStateDialog(() {
                      startDateErrorText = "Please select a start date";
                    });
                  } else if (endDate == null) {
                    setStateDialog(() {
                      endDateErrorText = "Please select an end date";
                    });
                  } else {
                    setState(() {
                      campaignlist.add(newCampaign);
                      campaign = newCampaign;
                      startDate = startDate;
                      endDate = endDate;
                    });

                    campaignnameController.clear();
                    startDateController.clear();
                    endDateController.clear();
                    campaigndescriotion.clear();
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
            "Additional Information",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),

          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Potential Amount(INR)',
            control: potentialamount,
          ),
          const SizedBox(height: 16),
          CustomRoundedTextField(
            width: double.infinity,
            labelText: 'Estimate Close Date',
            control: closeDateController,
            readOnly: true, // Prevent manual typing
            onTap: () async {
              FocusScope.of(
                context,
              ).requestFocus(FocusNode()); // Close keyboard if open

              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (picked != null) {
                setState(() {
                  selectedDate = picked;
                  closeDateController.text =
                      "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                });
              }
            },
          ),

          SizedBox(height: 16),
          CustomDropdownWidget(
            valArr: ranklist,
            labelText: "Rank",
            onChanged: (value) {
              setState(() {
                rank = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Campaign",
                style: TextStyle(
                  color: AppColor.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                onPressed: () {
                  _showAddCampaignPopup();
                },

                icon: Icon(Icons.add, color: AppColor.mainColor),
              ),
            ],
          ),
          CustomDropdownWidget(
            valArr: campaignlist,
            labelText: "Campaign",
            onChanged: (value) {
              setState(() {
                campaign = value;
              });
            },
            labelField: (item) => item.toString(),
          ),

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
            valArr: territorylist,
            labelText: "Territory",
            onChanged: (value) {
              setState(() {
                territory = value;
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

// ------------------------ Page 4 ------------------------

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

// ------------------------ Page 6 ------------------------

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
