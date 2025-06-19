import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

class CreatecustomerScreen extends StatefulWidget {
  const CreatecustomerScreen({super.key});

  @override
  State<CreatecustomerScreen> createState() => _CreatecustomerScreenState();
}

class _CreatecustomerScreenState extends State<CreatecustomerScreen> {
  final TextEditingController customername = TextEditingController();
  final TextEditingController generatednumber = TextEditingController();
  final TextEditingController customersalesrep = TextEditingController();
  final TextEditingController customerdescriotion = TextEditingController();

  String? customercategory;
  String? customerstatus;

  List<String> customercategorylist = [];
  List<String> customerstatuslist = [];

  //contact info
  List<TextEditingController> customerphoneControllers = [];
  List<TextEditingController> customeremailControllers = [];
  final TextEditingController customerskype = TextEditingController();
  final TextEditingController customerbouncedreason = TextEditingController();
  bool isUnsubscribed = false;
  bool isBounced = false;
  bool isexistingcustomer = false;
  bool isaffiliate = false;
  String? customermobiletype;
  String? customeremailtype;
  List<String> customermobiletypelist = [
    'Business',
    'FAX',
    'Home',
    'Mobile',
    'Other',
  ];
  List<String> customeremailtypelist = ['Home', 'Mobile'];
  void addPhoneField() {
    setState(() {
      customerphoneControllers.add(TextEditingController());
    });
  }

  void addEmailField() {
    setState(() {
      customeremailControllers.add(TextEditingController());
    });
  }

  void removePhoneField(int index) {
    setState(() {
      customerphoneControllers[index].dispose();
      customerphoneControllers.removeAt(index);
    });
  }

  void removeEmailField(int index) {
    setState(() {
      customeremailControllers[index].dispose();
      customeremailControllers.removeAt(index);
    });
  }

  @override
  void dispose() {
    for (var controller in customerphoneControllers) {
      controller.dispose();
    }
    for (var controller in customeremailControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  //Add Catagory

  void _showAddcreateCategoryPopup() {
    TextEditingController categorynameController = TextEditingController();

    final TextEditingController categorydescriotion = TextEditingController();
    String? categoryprice;
    List<String> categorypricelist = ['Standard'];

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Category"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
             
                CustomRoundedTextField(
                  control: categorynameController,
                  width: double.infinity,
                  labelText: 'Category Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),
                CustomDropdownWidget(
                  valArr: categorypricelist,
                  labelText: "Price List",
                  onChanged: (value) {
                    setState(() {
                      categoryprice = value;
                    });
                  },
                  labelField: (item) => item.toString(),
                ),

                const SizedBox(height: 14),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: categorydescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  categorynameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newCategory = categorynameController.text.trim();
                  bool exists = customercategorylist.any(
                    (item) => item.toLowerCase() == newCategory.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newCategory.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a category name";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Category name already exists";
                    });
                  } else {
                    setState(() {
                      customercategorylist.add(newCategory);
                      customercategory = newCategory;
                    });

                    categorynameController.clear();

                    categorydescriotion.clear();
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

  //Add Status

  void _showAddStatusPopup() {
    TextEditingController statusnameController = TextEditingController();

    final TextEditingController statusdescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Category"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              
                CustomRoundedTextField(
                  control: statusnameController,
                  width: double.infinity,
                  labelText: 'Category Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: statusdescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  statusnameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newStatus = statusnameController.text.trim();
                  bool exists = customerstatuslist.any(
                    (item) => item.toLowerCase() == newStatus.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newStatus.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a status";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Category name already exists";
                    });
                  } else {
                    setState(() {
                      customerstatuslist.add(newStatus);
                      customerstatus = newStatus;
                    });

                    statusnameController.clear();

                    statusdescriotion.clear();
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

  //address
  final TextEditingController customeraddressline1 = TextEditingController();
  final TextEditingController customeraddressline2 = TextEditingController();
  final TextEditingController customercity = TextEditingController();
  final TextEditingController customerstate = TextEditingController();
  final TextEditingController customerzipcode = TextEditingController();

  String? customeraddresstype;

  String? customerselectedCountryName;

  List<String> customeraddresstypelist = [
    'Billing Address',
    'Shipping Address',
    'Communication',
  ];

  //Additional info
  final TextEditingController customerwebsite = TextEditingController();
  final TextEditingController customerticketsymbol = TextEditingController();
  final TextEditingController customerannualrevenue = TextEditingController();
  final TextEditingController customercreditrating = TextEditingController();
  final TextEditingController customerownership = TextEditingController();

  String? parentcustomer;
  String? customeremployees;
  String? customerprice;
  String? customercampaign;
  String? customermarket;
  String? customersegment;
  String? customerterritory;
  String? customerindustry;
  String? customerpaymentterm;

  List<String> parentcustomerlist = [];
  List<String> customeremployeeslist = [];
  List<String> customerpricelist = [];
  List<String> customercampaignlist = [];
  List<String> customermarketlist = [];
  List<String> customersegmentlist = [];
  List<String> customerterritorylist = [];
  List<String> customerindustrylist = [];
  List<String> customerpaymenttermlist = [];

  //Social Information
  final TextEditingController customerfacebook = TextEditingController();
  final TextEditingController customertwitter = TextEditingController();
  final TextEditingController customerlinkedin = TextEditingController();

  //Add market

  void _showAddMarketPopup() {
    TextEditingController marketnameController = TextEditingController();

    final TextEditingController marketdescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Market"),
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
                  bool exists = customermarketlist.any(
                    (item) => item.toLowerCase() == newMarket.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newMarket.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a market";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Market name already exists";
                    });
                  } else {
                    setState(() {
                      customermarketlist.add(newMarket);
                      customermarket = newMarket;
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
  //Add Industry

  void _showAddIndustryPopup() {
    TextEditingController industrynameController = TextEditingController();

    final TextEditingController industrydescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Industry"),
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
                  bool exists = customerindustrylist.any(
                    (item) => item.toLowerCase() == newIndustry.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newIndustry.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Industry";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Industry name already exists";
                    });
                  } else {
                    setState(() {
                      customerindustrylist.add(newIndustry);
                      customerindustry = newIndustry;
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
  //Add Payment terms

  void _showAddPaymenttermPopup() {
    TextEditingController paymentnameController = TextEditingController();

    final TextEditingController  paymentdescriotion = TextEditingController();

    String? nameErrorText;

    showDialog(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setStateDialog) => AlertDialog(
            title: const Text("Create Payment Term"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              
                CustomRoundedTextField(
                  control: paymentnameController,
                  width: double.infinity,
                  labelText: 'Payment Term Name',
                  errMsg: nameErrorText,
                ),
                const SizedBox(height: 16),

                CustomRoundedTextField(
                  width: double.infinity,
                  labelText: 'Description',
                  control: paymentdescriotion,
                  lines: 3,
                  verticalMargin: 16,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  paymentnameController.clear();

                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  String newPayment = paymentnameController.text.trim();
                  bool exists = customerpaymenttermlist.any(
                    (item) => item.toLowerCase() == newPayment.toLowerCase(),
                  );

                  setStateDialog(() {
                    nameErrorText = null;
                  });

                  if (newPayment.isEmpty) {
                    setStateDialog(() {
                      nameErrorText = "Please enter a Payment Term";
                    });
                  } else if (exists) {
                    setStateDialog(() {
                      nameErrorText = "Payment Term name already exists";
                    });
                  } else {
                    setState(() {
                      customerpaymenttermlist.add(newPayment);
                      customerpaymentterm = newPayment;
                    });

                    paymentnameController.clear();

                    paymentdescriotion.clear();
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
          "Create Customer",
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
              "Customer Information",
              style: TextStyle(
                color: AppColor.mainColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Customer Name',
              control: customername,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Auto generated number',
              control: generatednumber,
            ),

            const SizedBox(height: 14),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Category",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddcreateCategoryPopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customercategorylist,
              labelText: "Category",
              onChanged: (value) {
                setState(() {
                  customercategory = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 14),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Sales Rep',
              control: customersalesrep,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Description',
              control: customerdescriotion,
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Status",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddStatusPopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customerstatuslist,
              labelText: "Status",
              onChanged: (value) {
                setState(() {
                  customerstatus = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
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
              itemCount: customerphoneControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomRoundedTextField(
                          control: customerphoneControllers[index],
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
              valArr: customermobiletypelist,
              labelText: "Select Type",
              onChanged: (value) {
                setState(() {
                  customermobiletype = value;
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
              itemCount: customeremailControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomRoundedTextField(
                          control: customeremailControllers[index],
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
              valArr: customeremailtypelist,
              labelText: "Select Type",
              onChanged: (value) {
                setState(() {
                  customeremailtype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            SizedBox(height: 10),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Skype',
              control: customerskype,
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
              control: customerbouncedreason,
            ),

            const SizedBox(height: 16),

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
              valArr: customeraddresstypelist,
              labelText: "Address Type",
              onChanged: (value) {
                setState(() {
                  customeraddresstype = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 14),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Address Line1',
              control: customeraddressline1,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Address Line2',
              control: customeraddressline2,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'City',
              control: customercity,
            ),

            const SizedBox(height: 14),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'State',
              control: customerstate,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Zip Code',
              control: customerzipcode,
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: false,
                  onSelect: (Country country) {
                    setState(() {
                      customerselectedCountryName = country.name;
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
                      text: customerselectedCountryName,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Parent Customer",
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
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: parentcustomerlist,
              labelText: "Parent Customer",
              onChanged: (value) {
                setState(() {
                  parentcustomer = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
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
                  onPressed: () {},
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customeremployeeslist,
              labelText: "# of Employees",
              onChanged: (value) {
                setState(() {
                  customerstatus = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Price List",
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
            const SizedBox(height: 14),

            CustomDropdownWidget(
              valArr: customerpricelist,
              labelText: "Price List",
              onChanged: (value) {
                setState(() {
                  customerprice = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),

            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Website',
              control: customerwebsite,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Ticket Symbol',
              control: customerticketsymbol,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Annual Revenue(INR)',
              control: customerannualrevenue,
            ),
            const SizedBox(height: 14),

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
                  onPressed: () {},
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),

            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customercampaignlist,
              labelText: "Campaign",
              onChanged: (value) {
                setState(() {
                  customercategory = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Credit Rating',
              control: customercreditrating,
            ),
            const SizedBox(height: 16),
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
                  onPressed: _showAddMarketPopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customermarketlist,
              labelText: "Market",
              onChanged: (value) {
                setState(() {
                  customermarket = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Segment",
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
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customersegmentlist,
              labelText: "Segment",
              onChanged: (value) {
                setState(() {
                  customersegment = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customerterritorylist,
              labelText: "Territory",
              onChanged: (value) {
                setState(() {
                  customerstatus = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
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
                  onPressed: _showAddIndustryPopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customerindustrylist,
              labelText: "Industry",
              onChanged: (value) {
                setState(() {
                  customerindustry = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Payment Term",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: _showAddPaymenttermPopup,
                  icon: Icon(Icons.add, color: AppColor.mainColor),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customerpaymenttermlist,
              labelText: "Payment Term",
              onChanged: (value) {
                setState(() {
                  customerpaymentterm = value;
                });
              },
              labelField: (item) => item.toString(),
            ),
            const SizedBox(height: 16),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Ownership',
              control: customerownership,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add SLA",
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
            const SizedBox(height: 14),
            CustomDropdownWidget(
              valArr: customerindustrylist,
              labelText: "SLA",
              onChanged: (value) {
                setState(() {
                  customerindustry = value;
                });
              },
              labelField: (item) => item.toString(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Existing Customer",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: isexistingcustomer,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      setState(() {
                        isexistingcustomer = value;
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
                  "Affiliate",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: isaffiliate,
                    activeColor: AppColor.primary,
                    onChanged: (value) {
                      setState(() {
                        isaffiliate = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
              control: customerfacebook,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'X',
              control: customertwitter,
            ),
            const SizedBox(height: 20),
            CustomRoundedTextField(
              width: double.infinity,
              labelText: 'Linkedin',
              control: customerlinkedin,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
