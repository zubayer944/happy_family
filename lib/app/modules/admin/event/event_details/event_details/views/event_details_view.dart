import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/values/my_colors.dart';
import '../../../../../../common/values/style_text.dart';
import '../../../../../../model/event_model.dart';
import '../controllers/event_details_controller.dart';

class EventDetailsView extends GetView<EventDetailsController> {
  const EventDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              onSelected: controller.onPopupAppBarIconClicked,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'add_payment',
                  child: Row(
                    children: [
                      Icon(Icons.add_alarm_outlined,color: MyColors.blackColor,),
                      const SizedBox(width: 3,),
                      const Text("Debit or Credit Details"),
                    ],
                  ),
                ),

              ])
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('events')
            .doc(controller.id)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Something went wrong')));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          EventModel eventModel = EventModel.fromJson(data);
          eventModel.documentId = controller.id;
          controller.eventModel = eventModel;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: (eventModel.bookedUserInfo ?? []).length,
              itemBuilder: (context, index) {
                return _paymentPackage(eventModel.bookedUserInfo![index]);
              });
        },
      ),
    );
  }

  Widget _paymentPackage(BookedUserInfo bookedUserInfo) {
    return Container(
      // height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 5,),
          // _richText("Package name",(eventModel.eventName ?? "")),
          const SizedBox(
            height: 5,
          ),
          _richText("User Name", (bookedUserInfo.userName ?? 0).toString()),
          const SizedBox(
            height: 5,
          ),
          _richText("Amount", "${(bookedUserInfo.totalAmount ?? 0)} TK"),
          const SizedBox(
            height: 5,
          ),
          _richText("Bkash Acc", (bookedUserInfo.bkashNumber ?? 0).toString()),
          const SizedBox(
            height: 5,
          ),
          _richText("Bkash Reference Id",
              (bookedUserInfo.bkashReferenceId ?? 0).toString()),
          const SizedBox(
            height: 5,
          ),
          _richText("date", (bookedUserInfo.createdAt ?? 0).toString()),
          const SizedBox(
            height: 5,
          ),
          _richText("Total Adult", "${bookedUserInfo.totalAdult ?? 0} persons"),
          const SizedBox(
            height: 5,
          ),
          _richText(
              "Total Children", "${bookedUserInfo.totalChildren ?? 0} persons"),
          const SizedBox(
            height: 5,
          ),
          _richText("Payment Verification Status",
              bookedUserInfo.verifiedPayment ? "Success" : "Pending"),


          const SizedBox(
            height: 5,
          ),

      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              const Text('Payment Verification', style: TextStyle(fontSize: 16),),
              Transform.scale(
                scale: 2,
                child: Switch(
                  onChanged:(bool value)=> controller.onIsVerifiedBtn(value,bookedUserInfo),
                  value: bookedUserInfo.verifiedPayment,
                  activeColor: Colors.blue,
                  activeTrackColor: Colors.yellow,
                  inactiveThumbColor: Colors.redAccent,
                  inactiveTrackColor: Colors.orange,
                )
            ),
            ]),
      ),
      ],
      ),
    );
  }

  Widget _richText(String name, String value) {
    return RichText(
      text: TextSpan(
          text: "$name : ",
          style:
              StyleText.nunitoSans_400_14.copyWith(color: MyColors.blackColor),
          children: [
            TextSpan(text: value, style: StyleText.nunitoSans_700_14)
          ]),
    );
  }
}
