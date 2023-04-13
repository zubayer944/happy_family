import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/custom_text_field/custom_text_from_field.dart';
import '../../../../../common/utils/utils.dart';
import '../../../../../common/values/my_colors.dart';
import '../../../../../common/widgets/custom_buttons.dart';
import '../../../../../common/widgets/custom_date_picker.dart';
import '../controllers/event_create_controller.dart';

class EventCreateView extends GetView<EventCreateController> {
  const EventCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Events Create'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Package name",
                hintTile: "Enter Package Name",
                controller: controller.tecPackageName.value,
                validator:(value)=> Utils.emptyValidator(value, "Package name is required"),
              ),),
              const SizedBox(height:20),
              Obx(
                    () => RadiusBorderDatePicker(
                    onDateSelected: controller.onValidEventDateSelect,
                    selectedDate: controller.validEventDate.value,
                    title: "Select valid event date"),
              ),
              const SizedBox(height:20),
              Obx(
                    () => RadiusBorderDatePicker(
                    onDateSelected: controller.onExpiredEventDateSelect,
                    selectedDate: controller.expiredEventDate.value,
                    title: "Select Last registration date"),
              ),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Adult price",
                hintTile: "Enter adult price",
                controller: controller.tecAdultPrice.value,
                validator:(value)=> Utils.emptyValidator(value, "Adult price is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(

                keyboardType: TextInputType.phone,
                titleText: "Children price",
                hintTile: "Enter children price",
                controller: controller.tecChildrenPrice.value,
                validator:(value)=> Utils.emptyValidator(value, "Children price is required"),
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
                titleText: "Bkash or Nagad Number",
                hintTile: "Enter Bkash or nagad",
                controller: controller.tecBkashOrNagadNo.value,
                validator:(value)=>  Utils.emptyValidator(value, "Bkash or Nagad no is required"),
              ),),
              const SizedBox(height:20),
              CustomButtons.regular(
                horizontalMargin: 38,
                verticalMargin: 10,
                text: "Submit",
                background: MyColors.blueColor,
                txtColor: MyColors.whiteColor,
                onPressed: controller.onSubmitPackageCreatePressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
