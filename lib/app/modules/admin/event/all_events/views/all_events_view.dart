import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_family/app/common/values/style_text.dart';
import 'package:happy_family/app/model/event_model.dart';

import '../../../../../common/values/my_colors.dart';
import '../controllers/all_events_controller.dart';

class AllEventsView extends GetView<AllEventsController> {
  const AllEventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: controller.onCreateEventPressed,
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('All Events'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:  FirebaseFirestore.instance.collection('events').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading"));
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              EventModel eventModel = EventModel.fromJson(data);
              eventModel.documentId = document.id;
              return _eventView(eventModel,);
                // _userListViewBody(eventModel);
            }).toList()
          );
        },
      ),
    );
  }

  Widget _eventView(EventModel eventModel,){
    return InkWell(
      onTap: () =>controller.onEventClicked(eventModel.documentId!),
      child: Container(
        padding:const EdgeInsets.all(10),
        margin:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.greyColor)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _richText("Event Name ",eventModel.eventName ?? "",),
            const SizedBox(height: 5,),
            _richText("Location ",eventModel.location ?? "",),
            const SizedBox(height: 5,),
            _richText("Event Date ",eventModel.date.toString(),),
            const SizedBox(height: 5,),
            _richText("Last booking date ",eventModel.lastBookingDate.toString(),),
            const SizedBox(height: 5,),
            _richText("Payment no (Only Bkash) ",eventModel.nagadOrBkashNumber ?? "",),
            const SizedBox(height: 5,),
            _richText("Bank acc no ",eventModel.bankAccNo ?? "",),
            const SizedBox(height: 5,),
            _richText("Adult entry fee ","${eventModel.adultPrice ?? 0} TK",),
            const SizedBox(height: 5,),
            _richText("Children entry fee ","${(eventModel.childrenPrice ?? 0)} TK",),
            const SizedBox(height: 5,),
            _richText("Below Children entry fee ",(eventModel.belowChildren ?? 0).toString(),),

          ],
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
