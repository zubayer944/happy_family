import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Admin Dashboard'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              onSelected: controller.onPopupAppBarIconClicked,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                 PopupMenuItem<String>(
                  value: 'details',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline,color: MyColors.blackColor,),
                      const SizedBox(width: 5,),
                      const Text("Details"),
                    ],
                  ),
                ),
                 PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined,color: MyColors.blackColor,),
                      const SizedBox(width: 3,),
                      const Text('Logout'),
                    ],
                  ),
                ),
              ])
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 InkWell(
                   onTap: controller.onEventPressed,
                   child: const Card(
                     child: Padding(
                         padding: EdgeInsets.all(50),
                         child: Text("Events")),
                   ),
                 ),
                 InkWell(
                   onTap: controller.onUsersPressed,
                   child: const Card(
                     child: Padding(
                         padding: EdgeInsets.all(50),
                         child: Text("Total Cost")),
                   ),
                 ),

               ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}
