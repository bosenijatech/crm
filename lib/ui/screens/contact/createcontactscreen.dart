import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';
import '../dashboard.dart';

class Createcontactscreen extends StatefulWidget {
  const Createcontactscreen({super.key});

  @override
  State<Createcontactscreen> createState() => _CreatecontactscreenState();
}

class _CreatecontactscreenState extends State<Createcontactscreen> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController jobtitle = TextEditingController();
  final TextEditingController assignedto = TextEditingController();
  final TextEditingController description = TextEditingController();

  String? title;
  String? contacttype;
  String? customertype;
  String? suppliertype;
  String? categorytype;

  List<String> titlelist = ['Miss.', 'Mr.', 'Mrs.', 'Ms.'];
  List<String> contacttypelist = [
    'Administrator',
    'Billing',
    'Decision Maker',
    'E-Commerce User',
    'Influencer',
    'Shipping',
  ];
  List<String> customertypelist = [];
  List<String> suppliertypelist = [];
  List<String> categorytypelist = [];

  //Add Contact Type

  void _showAddcontacttypePopup() {
    TextEditingController nameController = TextEditingController();

    final TextEditingController descriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Contact Type"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedTextField(
                  control: nameController,
                  width: double.infinity,
                  labelText: 'Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: descriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  nameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newContacttype = nameController.text.trim();
                  bool exists = contacttypelist.any(
                    (item) =>
                        item.toLowerCase() == newContacttype.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newContacttype.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Contact Type";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Contact Type already exists";
                    });
                  } else {
                    setState(() {
                      contacttypelist.add(newContacttype);
                      contacttype = newContacttype;
                    });

                    nameController.clear();

                    descriotion.clear();
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

  //Contact Information

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

  //add Address
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

  //additional info

  final TextEditingController phoneticname = TextEditingController();
  final TextEditingController nickname = TextEditingController();

  final TextEditingController dateofbirthController = TextEditingController();
  final TextEditingController hobbies = TextEditingController();
  final TextEditingController food = TextEditingController();

  DateTime? selectedDate;
  String? market;
  String? segment;
  String? territory;
  String? industry;
  List<String> industrylist = [
    'Aerospace & Defense',
    'Biotechnology',
    'Broadcasting/Cable/Radio',
    'Business Services',
    'Communication Equipment',
    'Computer Hardware',
    'Computer Software',
    'Diversified',
    'Education',
    'Electronic Equip/Components',
    'Energy/Natural Resources',
    'Environment protection',
    'Films & Entertainment',
    'Financial Services',
    'Food Services/Products',
  ];
  List<String> marketlistlist = [];
  List<String> segmentlistlist = [];
  List<String> territorylist = [];

  //create Market
  void _showAddMarketPopup() {
    TextEditingController marketnameController = TextEditingController();

    final TextEditingController marketdescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Add New Market"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedTextField(
                  control: marketnameController,
                  width: double.infinity,
                  labelText: 'Market Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: marketdescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  marketnameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newMarket = marketnameController.text.trim();
                  bool exists = marketlistlist.any(
                    (item) => item.toLowerCase() == newMarket.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newMarket.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Market name";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Market name already exists";
                    });
                  } else {
                    setState(() {
                      marketlistlist.add(newMarket);
                      market = newMarket;
                    });

                    marketnameController.clear();

                    marketdescriotion.clear();
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

  //create Industry
  void _showAddindustryPopup() {
    TextEditingController industrynameController = TextEditingController();

    final TextEditingController industrydescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Add New Industry"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomRoundedTextField(
                  control: industrynameController,
                  width: double.infinity,
                  labelText: 'Industry Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: industrydescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  industrynameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newIndustry = industrynameController.text.trim();
                  bool exists = industrylist.any(
                    (item) => item.toLowerCase() == newIndustry.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newIndustry.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Industry name";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Industry name already exists";
                    });
                  } else {
                    setState(() {
                      industrylist.add(newIndustry);
                      industry = newIndustry;
                    });

                    industrynameController.clear();

                    industrydescriotion.clear();
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

  //Social Information
  final TextEditingController facebook = TextEditingController();
  final TextEditingController x = TextEditingController();
  final TextEditingController linkedin = TextEditingController();
  final TextEditingController website = TextEditingController();

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
          "Create Contacts",
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
              "Contact Details",
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

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Contact Type",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddcontacttypePopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            CustomDropdownWidget(
              valArr: contacttypelist,
              labelText: "Contact Type",
              onChanged: (value) {
                setState(() {
                  contacttype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            const SizedBox(height: 14),

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
                  onPressed: () {},
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            CustomDropdownWidget(
              valArr: customertypelist,
              labelText: "Customer",
              onChanged: (value) {
                setState(() {
                  customertype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomDropdownWidget(
              valArr: suppliertypelist,
              labelText: "Supplier",
              onChanged: (value) {
                setState(() {
                  suppliertype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Assigned To',
              control: assignedto,
            ),
            const SizedBox(height: 20),

            CustomDropdownWidget(
              valArr: categorytypelist,
              labelText: "Categories",
              onChanged: (value) {
                setState(() {
                  categorytype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Description',
              control: description,
              lines: 5,
            ),

            const SizedBox(height: 20),
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
            const SizedBox(height: 20),

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
                    controller: TextEditingController(
                      text: selectedCountryName,
                    ),
                    readOnly: true,
                  ),
                ),
              ),
            ),

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
              labelText: 'Phonetic Name',
              control: phoneticname,
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Nick Name',
              control: nickname,
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Date of Birth',
              control: dateofbirthController,
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
                    dateofbirthController.text =
                        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
                  });
                }
              },
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Market",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showAddMarketPopup();
                  },

                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomDropdownWidget(
              valArr: marketlistlist,
              labelText: "Market",
              onChanged: (value) {
                setState(() {
                  market = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            SizedBox(height: 16),
            CustomDropdownWidget(
              valArr: segmentlistlist,
              labelText: "Segment",
              onChanged: (value) {
                setState(() {
                  segmentlistlist = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            SizedBox(height: 16),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Industry",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showAddindustryPopup();
                  },

                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomDropdownWidget(
              valArr: industrylist,
              labelText: "Industry",
              onChanged: (value) {
                setState(() {
                  industry = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Hobbies& Interests',
              control: hobbies,
              lines: 5,
              verticalMargin: 16.0,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Food',
              control: food,
              lines: 5,
              verticalMargin: 16.0,
            ),
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
      ),
    );
  }
}
