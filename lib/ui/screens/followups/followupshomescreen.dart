import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import 'createfollowupsscreen.dart';

class Followupshomescreen extends StatefulWidget {
  const Followupshomescreen({super.key});

  @override
  State<Followupshomescreen> createState() => _FollowupshomescreenState();
}

class _FollowupshomescreenState extends State<Followupshomescreen> {
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
          "Follow Ups",
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
        
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.white,
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Createfollowupsscreen()),
            );
        },
         shape: const CircleBorder(),
        child: SvgPicture.asset(
          AppAssets.create,
          width: 24,
          height: 24,
          color: AppColor.primary,
        ),
      ),
    );
  }
}