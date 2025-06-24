import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import 'createfollowupsscreen.dart';
import 'followupsoverviewscreen.dart';


class Followupshomescreen extends StatefulWidget {
  const Followupshomescreen({super.key});

  @override
  State<Followupshomescreen> createState() => _FollowupshomescreenState();
}

class _FollowupshomescreenState extends State<Followupshomescreen> {
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
      body:
         ListView.builder(

       shrinkWrap: true,
           itemCount: items.length,
           itemBuilder: (context, index) {
             return
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8 ),
               child:
                   GestureDetector(
                    onTap: () {
                         Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Followupsoverviewscreen(),
                  ),
                );
                    },
                     child: Container(
                      
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
                                         "Event",
                                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:AppColor.primary ),
                                       ),
                                       Text(
                                         "Kovilpatti, 628502",
                                         style: TextStyle(fontSize: 14, color: AppColor.grey),
                                       ),
                                       Text(
                                         "Johan",
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
                                     "Not Started",
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
                                          SizedBox(width: 30,),
                                          Text('June 11, 2025 10:40:38 Am',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                   SizedBox(height: 8,),
                                      Row(
                                        children: [
                                          Text('Modified On',style: TextStyle(fontSize: 14),),
                                          SizedBox(width: 22,),
                                          Text('June 11, 2025 10:40:38 Am',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                        ],
                                      )
                                    ],
                                  )
                         ],
                       ),
                                       
                                    ),
                   ),
               
             );
           },
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