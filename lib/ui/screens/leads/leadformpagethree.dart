
// ------------------------ Page 3 ------------------------

import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_textfield.dart';

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
