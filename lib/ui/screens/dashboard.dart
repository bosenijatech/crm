import 'package:crm/ui/screens/customers/customerhomescreen.dart';
import 'package:crm/ui/screens/enquiries/enquiriehomescreen.dart';

import 'package:crm/ui/screens/estimate/estimatehomescreen.dart';
import 'package:crm/ui/screens/leads/leadshomescreen.dart';
import 'package:crm/ui/screens/workorder/workorderhomescree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_color.dart';
import '../constant/constant.dart';
import 'Expense/expensehomescreen.dart';
import 'calender/callenderhomescreen.dart';
import 'calllog/callloghomescreen.dart';
import 'contact/contacthomescreen.dart';
import 'followups/followupshomescreen.dart';
import 'setting/settingscreen.dart';
import 'task/taskhomescreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(_controller);
    _slideAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(_controller);
  }

  void toggleDrawer() {
    if (isDrawerOpen) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //logout
  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    GoRouter.of(context).go('/login');
  }

  //menu items

  final List<Map<String, dynamic>> menuItems = [
    {"title": "Leads", "icon": AppAssets.leads, "screen": Leadshomescreen()},
    {
      "title": "Enquiry",
      "icon": AppAssets.enquiry,
      "screen": Enquiriehomescreen(),
    },
    {"title": "Calendar", "icon": AppAssets.calendar, "screen": Callenderhomescreen()},
    {
      "title": "Work Order",
      "icon": AppAssets.workorder,
      "screen": Workorderhomescreen(),
    },
    {"title": "Tasks", "icon": AppAssets.tasks, "screen": Taskhomescreen()},
    {"title": "Call Logs", "icon": AppAssets.calllogs, "screen": Callloghomescreen()},
    {"title": "My Follow Ups", "icon": AppAssets.follow, "screen": Followupshomescreen()},
    {"title": "Emails", "icon": AppAssets.emails, "screen": null},
    {
      "title": "Estimate",
      "icon": AppAssets.estimate,
      "screen": Estimatehomescreen(),
    },
    {"title": "Sales Order", "icon": AppAssets.order, "screen": null},
    {
      "title": "Expense Booking",
      "icon": AppAssets.expense,
      "screen": Expensehomescreen(),
    },
    {
      "title": "Customer",
      "icon": AppAssets.customer,
      "screen": Customerhomescreen(),
    },
    {
      "title": "Contacts",
      "icon": AppAssets.contacts,
      "screen": Contacthomescreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Stack(
        children: [
          // Drawer
          SlideTransition(
            position: _slideAnimation,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 50,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: AppColor.primary,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'UX Designer',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
                        return Padding(
                          padding: const EdgeInsets.only(left:16,bottom: 8),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.all(12),
                                  child: SvgPicture.asset(
                                    item['icon'],
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                title: Text(
                                  item['title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {
                                  if (item['screen'] != null) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => item['screen'],
                                      ),
                                    );
                                  } else if (item['action'] != null) {
                                    item['action']();
                                  }
                                },
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 40,
                    ),

                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            logout(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                100,
                              ), // fully circular
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                color: AppColor.actionColor,
                                AppAssets.logout,
                                width: 20, // you can adjust size if needed
                                height: 20,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 18),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Settingscreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                100,
                              ), // fully circular
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.setting,
                                width: 20, // you can adjust size if needed
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double slide = 250 * _controller.value;
              double scale = _scaleAnimation.value;

              return GestureDetector(
                onTap: isDrawerOpen ? toggleDrawer : null,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: isDrawerOpen
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(0),
                      boxShadow: isDrawerOpen
                          ? [
                              BoxShadow(
                                color: AppColor.mainColor,
                                blurRadius: 50,
                                offset: Offset(0, 10),
                              ),
                            ]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: isDrawerOpen
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(0),
                      child: AbsorbPointer(
                        absorbing: isDrawerOpen,
                        child: Scaffold(
                          backgroundColor: AppColor.bgLight,
                          appBar: AppBar(
                            leadingWidth: 80,
                            toolbarHeight: 200,
                            centerTitle: true,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: Text(
                              'CRM Dashboard',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColor.darker,
                              ),
                            ),
                            leading: IconButton(
                              icon: SvgPicture.asset(
                                AppAssets.menu,
                                width: 20,
                                height: 20,
                              ),
                              onPressed: toggleDrawer,
                            ),
                          ),
                          body: SingleChildScrollView(
                            child: Center(
                              child: Text('Dashboard Content Here'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
