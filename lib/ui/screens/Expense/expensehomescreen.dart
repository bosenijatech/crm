import 'package:crm/ui/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'createexpensereportscreen.dart';
import 'createexpensescreen.dart';

class Expensehomescreen extends StatefulWidget {
  const Expensehomescreen({super.key});

  @override
  State<Expensehomescreen> createState() => _ExpensehomescreenState();
}

class _ExpensehomescreenState extends State<Expensehomescreen> {
 
 final List<String> items = [
    "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"
  ];
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
          "Expense Booking",
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
      body: 
          ListView.builder(

       shrinkWrap: true,
           itemCount: items.length,
           itemBuilder: (context, index) {
             return
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8 ),
               child:
                   Container(
                    
                     padding: EdgeInsets.all(16),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(12),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black12,
                           blurRadius: 4,
                           offset: Offset(0, 2),
                         )
                       ],
                     ),
                     child: Column(
                       children: [
                         Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       
                           children: [
                             Row(
                               children: [
                                 CircleAvatar(
                                   radius: 30,
                                 backgroundColor: AppColor.primary,
                                 ),
                                 SizedBox(width: 12),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text(
                                       "John Doe",
                                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:AppColor.primary ),
                                     ),
                                     Text(
                                       "Demo",
                                       style: TextStyle(fontSize: 14, color: AppColor.grey),
                                     ),
                                   ],
                                 ),
                               
                               ],
                             ),
                              Row(
                                  children: [
                                         Container(
                             padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                             decoration: BoxDecoration(
                               color: AppColor.darkgreen,
                               borderRadius: BorderRadius.circular(20),
                              
                             ),
                             child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text(
                                   "Advertising",
                                   style: TextStyle(color: Colors.white, fontSize: 14),
                                 ),
                               
                               ],
                             ),
                           ),
                        
                                  ],
                                 )
                           ],
                         ),
                         SizedBox(height: 20,),
                          Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Created On',style: TextStyle(fontSize: 14),),
                                        SizedBox(width: 20,),
                                        Text('June 11, 2025 10:40:38 Am',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      ],
                                    ),

                                  
                                  ],
                                )
                       ],
                     ),
                  
               ),
               
             );
           },
         ),
    floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: AppColor.white,
        overlayOpacity: 0.5,
        spacing: 12,
        spaceBetweenChildren: 8,
        children: [
          SpeedDialChild(
            child: SvgPicture.asset(
              AppAssets.create,
              width: 20,
              height: 20,
              color: AppColor.white,
            ),
            label: 'Create Expense',
            backgroundColor: AppColor.primary,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Createexpensescreen()),
              );
            },
          ),
          SpeedDialChild(
            child: SvgPicture.asset(
              AppAssets.fixedestimate,
              width: 20,
              height: 20,
              color: AppColor.white,
            ),
            label: 'Create Expense Report',
            backgroundColor: AppColor.primary,
            onTap: () =>     Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Createexpensereportscreen()),
              ),
          ),
    
        ],
      ),
    );
  }
}
