import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constant/app_assets.dart';
import '../../constant/app_color.dart';
import 'composeemailscreen.dart';

class Emailscreen extends StatefulWidget {
  const Emailscreen({super.key});

  @override
  State<Emailscreen> createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {
  List<Map<String, dynamic>> inboxList = [
    {'subject': 'Welcome to app', 'isRead': false},
    {'subject': 'Invoice ready', 'isRead': true},
  ];

  List<Map<String, dynamic>> sentList = [
    {'subject': 'Report sent', 'isRead': false},
    {'subject': 'Follow-up email', 'isRead': true},
  ];

  List<Map<String, dynamic>> draftList = [
    {'subject': 'Draft 1', 'isRead': true},
    {'subject': 'Draft 2', 'isRead': true},
  ];
  List<Map<String, dynamic>> archiveList = [
    {'subject': 'Archive 1', 'isRead': true},
    {'subject': 'Archive 2', 'isRead': true},
  ];

  int getUnreadCount(List<Map<String, dynamic>> list) {
    return list.where((email) => email['isRead'] == false).length;
  }

  @override
  Widget build(BuildContext context) {
    int inboxUnread = getUnreadCount(inboxList);
    int sentUnread = getUnreadCount(sentList);
    int draftUnread = getUnreadCount(draftList);
    int archiveUnread = getUnreadCount(archiveList);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
            "Emails",
            style: TextStyle(
              color: AppColor.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset(AppAssets.search, width: 24, height: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(AppAssets.dot, width: 24, height: 24),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabAlignment:TabAlignment.start   ,
            indicatorColor: AppColor.primary,
            labelColor: AppColor.primary,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Inbox ($inboxUnread)'),
               Tab(text: 'Drafts ($draftUnread)'),
              Tab(text: 'Sent ($sentUnread)'),
              Tab(text: 'Archived ($archiveUnread)'),
             
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: inboxList.length,
              itemBuilder: (context, index) {
                final email = inboxList[index];
                return ListTile(
                  leading: Icon(
                    email['isRead']
                        ? Icons.email_outlined
                        : Icons.mark_email_unread,
                    color: email['isRead'] ? Colors.grey : Colors.red,
                  ),
                  title: Text(email['subject']),
                  onTap: () {
                    setState(() {
                      inboxList[index]['isRead'] = true;
                    });
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: sentList.length,
              itemBuilder: (context, index) {
                final email = sentList[index];
                return ListTile(
                  leading: Icon(
                    email['isRead']
                        ? Icons.send_outlined
                        : Icons.mark_email_unread,
                    color: email['isRead'] ? Colors.grey : Colors.orange,
                  ),
                  title: Text(email['subject']),
                  onTap: () {
                    setState(() {
                      sentList[index]['isRead'] = true;
                    });
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: draftList.length,
              itemBuilder: (context, index) {
                final email = draftList[index];
                return ListTile(
                  leading: Icon(
                    email['isRead']
                        ? Icons.drafts_outlined
                        : Icons.mark_email_unread,
                    color: email['isRead'] ? Colors.grey : Colors.blue,
                  ),
                  title: Text(email['subject']),
                  onTap: () {
                    setState(() {
                      draftList[index]['isRead'] = true;
                    });
                  },
                );
              },
            ),
            ListView.builder(
              itemCount: archiveList.length,
              itemBuilder: (context, index) {
                final email = draftList[index];
                return ListTile(
                  leading: Icon(
                    email['isRead']
                        ? Icons.drafts_outlined
                        : Icons.mark_email_unread,
                    color: email['isRead'] ? Colors.grey : Colors.blue,
                  ),
                  title: Text(email['subject']),
                  onTap: () {
                    setState(() {
                      archiveList[index]['isRead'] = true;
                    });
                  },
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primary,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Composeemailscreen()),
            );
          },
          shape: const CircleBorder(),
          child: Icon(Icons.add, color: AppColor.white, size: 24),
        ),
      ),
    );
  }
}
