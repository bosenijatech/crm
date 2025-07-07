import 'package:crm/ui/screens/dashboard.dart';
import 'package:crm/ui/screens/leads/leadshomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/app_color.dart';
import 'leadformpagefive.dart';
import 'leadformpagefour.dart';
import 'leadformpageone.dart';
import 'leadformpagesix.dart';
import 'leadformpagethree.dart';
import 'leadformpagetwo.dart';

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
              onPressed: (){
     Get.off(() => Leadshomescreen());

              },
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


