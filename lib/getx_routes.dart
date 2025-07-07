import 'package:get/get.dart';
import 'ui/authscreen/landingscreen.dart';
import 'ui/authscreen/loginscreen.dart';
import 'ui/screens/Expense/createexpensereportscreen.dart';
import 'ui/screens/Expense/createexpensescreen.dart';
import 'ui/screens/Expense/expensehomescreen.dart';
import 'ui/screens/Expense/expenseoverviewscreen.dart';
import 'ui/screens/calender/calenderhomescreen.dart';

import 'ui/screens/calender/calenderoverviewscreen.dart';
import 'ui/screens/calender/createcalenderscreen.dart';
import 'ui/screens/contact/contacthomescreen.dart';
import 'ui/screens/contact/contactoverviewscreen.dart';
import 'ui/screens/contact/createcontactscreen.dart';
import 'ui/screens/customers/createcustomerscreen.dart';
import 'ui/screens/customers/customerhomescreen.dart';
import 'ui/screens/customers/customeroverviewscreen.dart';
import 'ui/screens/dashboard.dart';
import 'ui/screens/enquiries/createenquirescreen.dart';
import 'ui/screens/enquiries/enquiriehomescreen.dart';
import 'ui/screens/enquiries/enquiriesoverview.dart';
import 'ui/screens/estimate/createestimatescreen.dart';
import 'ui/screens/estimate/createfixedestimatescreen.dart';
import 'ui/screens/estimate/estimatehomescreen.dart';
import 'ui/screens/estimate/estimateoverviewscreen.dart';
import 'ui/screens/followups/createfollowupsscreen.dart';
import 'ui/screens/followups/followupshomescreen.dart';
import 'ui/screens/followups/followupsoverviewscreen.dart';
import 'ui/screens/leads/createleadscreen.dart';
import 'ui/screens/leads/leadoverviewscreen.dart';
import 'ui/screens/leads/leadshomescreen.dart';
import 'ui/screens/task/createtaskscreen.dart';
import 'ui/screens/task/taskhomescreen.dart';
import 'ui/screens/task/taskoverviewscreen.dart';
import 'ui/screens/workorder/createworkorderscreen.dart';
import 'ui/screens/workorder/workoderoverviewscreen.dart';
import 'ui/screens/workorder/workorderhomescree.dart';

final List<GetPage> getPages = [
  GetPage(name: '/', page: () => const LandingScreen()),
  GetPage(name: '/login', page: () => const Loginscreen()),
  GetPage(name: '/dashboard', page: () => Dashboard()),
  GetPage(name: '/createlead', page: () => CreateLeadScreen()),
  GetPage(name: '/leadoverview', page: () => Leadoverviewscreen()),
  GetPage(name: '/leadshome', page: () => Leadshomescreen()),
  GetPage(name: '/createenquire', page: () => Createenquirescreen()),
  GetPage(name: '/enquirehome', page: () => Enquiriehomescreen()),
  GetPage(name: '/enquireoverview', page: () => Enquiriesoverview()),
  GetPage(name: '/calenderoverview', page: () => Calenderoverviewscreen()),
  GetPage(name: '/calenderhome', page: () => Calenderhomescreen()),
  GetPage(name: '/createworkorder', page: () => CreateWorkorderScreen()),
  GetPage(name: '/workorderoverview', page: () => Workoderoverviewscreen()),
  GetPage(name: '/createtask', page: () => Createtaskscreen()),
  GetPage(name: '/taskhome', page: () => Taskhomescreen()),
  GetPage(name: '/taskoverview', page: () => Taskoverviewscreen()),
  GetPage(name: '/createfollowups', page: () => Createfollowupsscreen()),
  GetPage(name: '/followupshome', page: () => Followupshomescreen()),
  GetPage(name: '/followupsoverview', page: () => Followupsoverviewscreen()),
  GetPage(name: '/createestimate', page: () => Createestimatescreen()),
  GetPage(name: '/createfixedestimate', page: () => Createfixedestimatescreen()),
  GetPage(name: '/estimatehome', page: () => Estimatehomescreen()),
  GetPage(name: '/createexpensereport', page: () => Createexpensereportscreen()),
  GetPage(name: '/createexpense', page: () => Createexpensescreen()),
  GetPage(name: '/expensehome', page: () => Expensehomescreen()),
  GetPage(name: '/createcustomer', page: () => CreatecustomerScreen()),
  GetPage(name: '/customerhome', page: () => Customerhomescreen()),
  GetPage(name: '/customeroverview', page: () => Contacthomescreen()),
  GetPage(name: '/customeroverview', page: () => Contactoverviewscreen()),
  GetPage(name: '/customeroverview', page: () => Createcontactscreen()),
];
