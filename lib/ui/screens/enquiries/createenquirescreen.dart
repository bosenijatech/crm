import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../customers/createcustomerscreen.dart';

class Createenquirescreen extends StatefulWidget {
  const Createenquirescreen({super.key});

  @override
  State<Createenquirescreen> createState() => _CreateenquirescreenState();
}

class _CreateenquirescreenState extends State<Createenquirescreen> {
  final TextEditingController enquiryname = TextEditingController();
  final TextEditingController enquiryprobability = TextEditingController();
  final TextEditingController nextstep = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController assign = TextEditingController();
  final TextEditingController descriotion = TextEditingController();
  final TextEditingController closeDateController = TextEditingController();
  String? salesstage;
  String? contact;
  String? type;
  String? leadsource;
  String? selecttype;

  String? customer;

  DateTime? selectedDate;

  List<String> customerlist = [];

  List<String> salesstagelist = [
    'Prospecting',
    'Qualification',
    'Needs Analysis',
    'Value Proposition',
    'Identified Decision Makers',
    'Perception Analysis',
    'Proposal/ Price Quote',
    'Closed Won',
    'Closed Lost',
  ];
  List<String> contactlist = [];
  List<String> typelist = [];
  List<String> leadsourcelist = [];

  List<String> selecttypelist = ['Existing Business', 'New Business'];

  //type
  void _showAddTypePopup() {
    TextEditingController typenameController = TextEditingController();

    final TextEditingController typedescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Type"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedTextField(
                  control: typenameController,
                  width: double.infinity,
                  labelText: 'Type Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: typedescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  typenameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newType = typenameController.text.trim();
                  bool exists = typelist.any(
                    (item) => item.toLowerCase() == newType.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newType.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Type";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Type name already exists";
                    });
                  } else {
                    setState(() {
                      typelist.add(newType);
                      type = newType;
                    });

                    typenameController.clear();

                    typedescriotion.clear();
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

  //Leadsource
  void _showAddLeadsourcePopup() {
    TextEditingController leadnameController = TextEditingController();

    final TextEditingController leaddescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Lead Source"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedTextField(
                  control: leadnameController,
                  width: double.infinity,
                  labelText: 'Lead Source Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: leaddescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  leadnameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newLead = leadnameController.text.trim();
                  bool exists = leadsourcelist.any(
                    (item) => item.toLowerCase() == newLead.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newLead.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Lead Source";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Lead Source name already exists";
                    });
                  } else {
                    setState(() {
                      leadsourcelist.add(newLead);
                      leadsource = newLead;
                    });

                    leadnameController.clear();

                    leaddescriotion.clear();
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
        toolbarHeight: 120,
        elevation: 1,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColor.apbarclr, AppColor.bgLight],
            ),
          ),
        ),
        title: Text(
          "Create Enquiry",
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
              "Enquiry Information",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Name',
              control: enquiryname,
            ),
            const SizedBox(height: 20),
            CustomDropdownWidget(
              valArr: salesstagelist,
              labelText: "Sales Stage",
              onChanged: (value) {
                setState(() {
                  salesstage = value;
                });
              },
              labelField: (item) => item.toString(),
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
              labelText: 'Probability (%)',
              control: enquiryprobability,
            ),
            const SizedBox(height: 10),

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
            const SizedBox(height: 10),

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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Type",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddTypePopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomDropdownWidget(
              valArr: typelist,
              labelText: "Type",
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 14),
          
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Lead Source",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddLeadsourcePopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 10),

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
              labelText: "Pdf Template",
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
            const SizedBox(height: 16),
              CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Next Step',
              control: nextstep,
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Assigned To',
              control: assign,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              
              width: double.infinity,
              labelText: 'Amount(INR)',
              control: amount,
            ),
            const SizedBox(height: 16),
              CustomDropdownWidget(
              valArr: selecttypelist,
              labelText: "Pdf Template",
              onChanged: (value) {
                setState(() {
                  selecttype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
             const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Description',
              control: descriotion,
              lines: 5,
              verticalMargin: 16,
            ),
            const SizedBox(height: 20),

             Text(
              "Enquiry Information",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),
               CustomDropdownWidget(
              valArr: selecttypelist,
              labelText: "Market",
              onChanged: (value) {
                setState(() {
                  selecttype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
             const SizedBox(height: 16),
               CustomDropdownWidget(
              valArr: selecttypelist,
              labelText: "Segment",
              onChanged: (value) {
                setState(() {
                  selecttype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
             const SizedBox(height: 16),
               CustomDropdownWidget(
              valArr: selecttypelist,
              labelText: "Territory",
              onChanged: (value) {
                setState(() {
                  selecttype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
             const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
