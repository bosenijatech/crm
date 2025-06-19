import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';

import 'createworkorderscreen.dart';



class Workorderhomescreen extends StatefulWidget {
  const Workorderhomescreen({super.key});

  @override
  State<Workorderhomescreen> createState() => _WorkorderhomescreenState();
}

class _WorkorderhomescreenState extends State<Workorderhomescreen> {
   
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
              colors: [
                AppColor.apbarclr,
                AppColor.bgLight,
              ],
            ),
          ),
        ),
        title: Text(
          "Work Order Details",
          style: TextStyle(
            color: AppColor.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppAssets.search, // your SVG asset path
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle search tap
            },
          ),
          IconButton(
            icon: SvgPicture.asset(
              AppAssets.dot, // your SVG asset path
              width: 24,
              height: 24,
            ),
            onPressed: () {
              // Handle dot menu tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              // Add more widgets below if needed
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.white,
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateWorkorderScreen()),
            );
        },
         shape: const CircleBorder(),
        child: SvgPicture.asset(
          AppAssets.create,
          width: 24,
          height: 24,
          color:  AppColor.primary,
        ),
      ),
    );
  }
}