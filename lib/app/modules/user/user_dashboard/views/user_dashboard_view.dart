import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import 'package:happy_family/app/common/values/style_text.dart';

import '../controllers/user_dashboard_controller.dart';

class UserDashboardView extends GetView<UserDashboardController> {
  const UserDashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),

            _paymentPackage(),
            const SizedBox(height: 10,),
            _paymentPackage(),
            const SizedBox(height: 10,),

            _paymentPackage(),
            const SizedBox(height: 10,),

            _paymentPackage(),
            const SizedBox(height: 10,),

            _paymentPackage(),
            const SizedBox(height: 10,),

            _paymentPackage(),

            const SizedBox(height: 10,),

          ],
        )
      ),
    );
  }

  Widget _paymentPackage() {
    return InkWell(
      onTap: controller.onPackageClicked,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin:const EdgeInsets.symmetric(horizontal: 15,),
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),border: Border.all()
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Platinum",style: StyleText.nunitoSans_600_18,),
            const SizedBox(height: 5,),
            _richText("Amount","1000 tk"),
            const SizedBox(height: 5,),
            _richText("Event date","22-04-23 "),
            const SizedBox(height: 5,),
            _richText("Last booking date","10-03-23"),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _richText("Member allow","10"),

                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColors.greyColor),borderRadius: BorderRadius.circular(8),
                    color: MyColors.blueColor.withOpacity(0.3)
                  ),
                  child:  Text("Booked",style: StyleText.nunitoSans_400_12),
                )
              ],
            ),
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
