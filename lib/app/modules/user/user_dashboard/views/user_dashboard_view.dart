import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_family/app/common/utils/utils.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import 'package:happy_family/app/common/values/style_text.dart';

import '../../../../common/widgets/copy_to_clip_board.dart';
import '../../../../model/event_model.dart';
import '../controllers/user_dashboard_controller.dart';

class UserDashboardView extends GetView<UserDashboardController> {
  const UserDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('User Dashboard'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              onSelected: controller.onPopupAppBarIconClicked,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

                     PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout_outlined,color: MyColors.blackColor),
                          const SizedBox(width: 3,),
                          const Text('Logout'),
                        ],
                      ),
                    ),
                  ])
        ],
      ),
      body:Column(
        children: [
          const SizedBox(height: 10,),
          Expanded(child: _packageInfo()),
        ],
      ),
    );
  }

  Widget _packageInfo() {
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('events').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
              child: const Text("Loading")));
        }
        if ((snapshot.data?.docs ?? []).isEmpty) {
          return const Center(child: Text("No Event Available"));
        }
        return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              EventModel eventModel = EventModel.fromJson(data);
              print('UserDashboardView._packageInfo ${eventModel.toJson()}');
          eventModel.documentId = document.id;
              return _paymentPackage(eventModel);
            }).toList()
        );
      },
    );
  }

  Widget _paymentPackage(EventModel eventModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap:() => controller.onPackageClicked(eventModel),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin:const EdgeInsets.symmetric(horizontal: 15,),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),border: Border.all()
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Obx(() => Text(Get.find<AppController>().userModel.value.name ?? "",style: StyleText.nunitoSans_600_18,),),
              const SizedBox(height: 5,),
              _richText("Package name",(eventModel.eventName ?? "")),
              _richText("Adult Per Person Amount","${eventModel.adultPrice ?? 0} TK"),
              const SizedBox(height: 5,),
              _richText("5-12years Per Children Amount","${eventModel.childrenPrice ?? 0} TK"),
              const SizedBox(height: 5,),
              _richText("Below 5 years Children Amount","Free (Not for all)"),
              const SizedBox(height: 5,),
              _richText("Event date",eventModel.date.toString()),
              const SizedBox(height: 5,),
              _richText("Last booking date",eventModel.lastBookingDate.toString()),
              const SizedBox(height: 5,),
              Row(
                children: [
                  _richText("Bkash account no to send money",eventModel.nagadOrBkashNumber.toString()),
                  CopyToClipBoardIcon(value: eventModel.nagadOrBkashNumber.toString(), )
                ],
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _richText("Already booked member",("${((eventModel.totalBookedAdultCount ?? 0 ) + (eventModel.totalBookedChildrenCount ?? 0 ))} Persons")),
                  // Visibility(
                  //   visible: controller.paymentStatus(eventModel) != null,
                  //   child: Container(
                  //     padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  //     decoration: BoxDecoration(
                  //       border: Border.all(color: MyColors.greyColor),borderRadius: BorderRadius.circular(8),
                  //       color: MyColors.blueColor.withOpacity(0.3)
                  //     ),
                  //     child:  Text((controller.paymentStatus(eventModel)?.verifiedPayment ?? false) ? "Success":"waiting",style: StyleText.nunitoSans_400_12),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _richText (String name,String value) {
    return RichText(
      text: TextSpan(
          text: "$name : ",
          style: StyleText.nunitoSans_400_14.copyWith(color: MyColors.blackColor),
          children: [
            TextSpan(text: value,style: StyleText.nunitoSans_700_14)
          ]),
    );
  }
}
