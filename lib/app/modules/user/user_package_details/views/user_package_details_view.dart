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
                child: Text(AllStrings.warningMsgForUserPackageDetails,style: StyleText.nunitoSans_400_14),
              ),
              const SizedBox(height:15),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.name,
                titleText: "Name",
                hintTile: "Name here",
                controller: controller.tecNameMem.value,
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.number,
                titleText: "Total Member",
                hintTile: "Total member no",
                controller: controller.tecTotalMem.value,
                validator:(value)=> Utils.emptyValidator(value,"Total member no is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.number,
                titleText: "Total Adult",
                hintTile: "Total adult no",
                controller: controller.tecTotalAdult.value,
                validator:(value)=> Utils.emptyValidator(value, "Total adult member is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.number,
                titleText: "Total Under Aged",
                hintTile: "Total under age member",
                controller: controller.tecTotalUnderAge.value,
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bkash no",
                hintTile: "Enter Bkash no",
                controller: controller.tecBkashNo.value,
                validator:(value)=> Utils.emptyValidator(value, "Bkash no is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bkash Reference Id",
                hintTile: "Enter Reference no",
                controller: controller.tecTransactionIdNo.value,
                validator:(value)=> Utils.emptyValidator(value, "Bkash reference id is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Bank Account",
                hintTile: "Enter acc no",
                controller: controller.tecBankAccNo.value,
              ),),
              const SizedBox(height:25),
              CustomButtons.regular(
                horizontalMargin: 38,
                verticalMargin: 10,
                text: "Submit",
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
