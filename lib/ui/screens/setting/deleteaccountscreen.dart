import 'package:flutter/material.dart';

import '../../constant/app_color.dart';
import '../../widgets/custom_textfield.dart';

class Deleteaccountscreen extends StatefulWidget {
  const Deleteaccountscreen({super.key});

  @override
  State<Deleteaccountscreen> createState() => _DeleteaccountscreenState();
}

class _DeleteaccountscreenState extends State<Deleteaccountscreen> {
  final TextEditingController feedbackController = TextEditingController();
  bool checkBox1 = false;
  bool checkBox2 = false;
  bool checkBox3 = false;
  bool checkBox4 = false;
  bool checkBox5 = false;
  bool checkBox6 = false;
  bool checkBox7 = false;

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
          "Business Settings",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Deleting account will delete all your data and your information, other users information in your account.",
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Thanks for trying CRM App. We would really apprreciate your  feedback on why you are deleting your account now. Please select one or more options from Below :",
              style: TextStyle(
                color: AppColor.grey,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason*",
                  style: TextStyle(
                    color: AppColor.mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox1,
                            onChanged: (value) {
                              setState(() {
                                checkBox1 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "I could not implement my business process using CRM.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox2,
                            onChanged: (value) {
                              setState(() {
                                checkBox2 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Customer support could not clarify my questions or resolve my issues.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox3,
                            onChanged: (value) {
                              setState(() {
                                checkBox3 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "I have pending enhancements that have not been delivered on time.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox4,
                            onChanged: (value) {
                              setState(() {
                                checkBox4 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "I could not get my data loaded into CRM App..",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox5,
                            onChanged: (value) {
                              setState(() {
                                checkBox5 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "I like CRM App,  but need some more time to try.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CustomRoundedTextField(
                          width: double.infinity,
                          labelText: 'Feedback',
                          control: feedbackController,
                          lines: 5,
                          verticalMargin: 16.0,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Center the checkbox with text
                        children: [
                          Checkbox(
                            value: checkBox6,
                            onChanged: (value) {
                              setState(() {
                                checkBox6 = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "You can contact me if you’d like to learn more about why I deleted my account.",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Center the checkbox with text
              children: [
                Checkbox(
                  value: checkBox7,
                  onChanged: (value) {
                    setState(() {
                      checkBox7 = value!;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "I understand that deleting the account can’t be undone and the data I delete can’t be restored.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                   
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.actionColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Delete Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
