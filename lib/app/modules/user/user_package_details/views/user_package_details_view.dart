import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:happy_family/app/common/values/all_strings.dart';
import 'package:happy_family/app/common/values/my_colors.dart';

import '../../../../common/custom_text_field/custom_text_from_field.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/style_text.dart';
import '../../../../common/widgets/custom_buttons.dart';
import '../controllers/user_package_details_controller.dart';

class UserPackageDetailsView extends GetView<UserPackageDetailsController> {
  const UserPackageDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height:20),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColors.redColor.withOpacity(0.3)
                ),
                child: Text(AllStrings.warningMsgForUserPackageDetails,textAlign: TextAlign.justify,style: StyleText.nunitoSans_400_14),
              ),
              const SizedBox(height:15),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.name,
                readOnly: true,
                titleText: "Leader Name",
                hintTile: "Enter leader Name",
                controller: controller.tecNameMem.value,
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.number,
                titleText: "Total Adult (per person ${controller.event.adultPrice} TK)",
                hintTile: "Total adult no",
                controller: controller.tecTotalAdult.value,
                onChanged: controller.onTotalMemberAndAmountChanged,
                validator:(value)=> Utils.emptyValidator(value, "Total adult member is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.number,
                titleText: "5-12 years children no (per children ${controller.event.childrenPrice} TK)",
                hintTile: "Enter members no",
                controller: controller.tecTotalUnderAge.value,
                onChanged: controller.onTotalMemberAndAmountChanged,
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                readOnly: true,
                keyboardType: TextInputType.number,
                titleText: "Total Member",
                hintTile: "Enter total member no",
                controller: controller.tecTotalMem.value,
                onChanged: (String value){
                  controller.tecTotalMem.value.text = (int.parse(controller.tecTotalAdult.value.text) + int.parse(controller.tecTotalUnderAge.value.text.isEmpty? "0" :controller.tecTotalUnderAge.value.text)).toString();
                  },
                validator:(value)=> Utils.emptyValidator(value,"Total member no is required"),
              ),),
              const SizedBox(height:30),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.redColor.withOpacity(0.3)
                ),
                child: Text(AllStrings.warningBkashCashOutFee,textAlign: TextAlign.justify,style: StyleText.nunitoSans_400_14),
              ),
              Obx(() => CustomTextFromField(
                readOnly: true,
                keyboardType: TextInputType.phone,
                titleText: "Amount",
                hintTile: "Enter amount",
                controller: controller.tecAmount.value,
                validator:(value)=> Utils.emptyValidator(value, "Amount is required"),
                onChanged: (value){
                  int sum = (int.parse(controller.tecTotalAdult.value.text) * 600) + (int.parse(controller.tecTotalUnderAge.value.text.isEmpty? "0" : controller.tecTotalUnderAge.value.text)*300);
                  controller.tecAmount.value.text = sum.toString();
                  },
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bank Account",
                hintTile: "Enter acc no",
                controller: controller.tecBankAccNo.value,
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bkash no (send money to ${controller.event.nagadOrBkashNumber})",
                hintTile: "Enter Bkash no",
                controller: controller.tecBkashNo.value,
                validator:(value)=> controller.tecBankAccNo.value.text.isNotEmpty? null : Utils.emptyValidator(value, "Bkash no is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bkash Reference Id",
                hintTile: "Enter Reference no",
                controller: controller.tecReferenceIdNo.value,
                validator:(value)=> controller.tecBkashNo.value.text.isEmpty && controller.tecBankAccNo.value.text.isNotEmpty? null : Utils.emptyValidator(value, "Bkash reference id is required"),
              ),),
              const SizedBox(height:40),
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 30),
                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColors.redColor.withOpacity(0.3)
                ),
                child: Text(AllStrings.warningForPressedBtn,textAlign: TextAlign.justify,style: StyleText.nunitoSans_400_14),
              ),
              const SizedBox(height:25),
              CustomButtons.regular(
                horizontalMargin: 38,
                verticalMargin: 10,
                text: "Send Request for Received",
                background: MyColors.blueColor,
                txtColor: MyColors.whiteColor,
                onPressed: controller.onSubmitPackageDetailsPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
