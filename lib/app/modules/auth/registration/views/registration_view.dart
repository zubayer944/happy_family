import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/custom_text_field/custom_text_from_field.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/values/my_colors.dart';
import '../../../../common/widgets/custom_buttons.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              const SizedBox(height: 25,),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.name,
                titleText: "Name",
                hintTile: "Name",
                controller: controller.tecNameReg.value,
                validator:(value)=> Utils.emptyValidator(value,"Name is required"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.phone,
                titleText: "Phone",
                hintTile: "Phone",
                controller: controller.tecPhoneReg.value,
                validator:(value)=> Utils.emptyValidator(value, "Phone number must be provide"),
              ),),
              const SizedBox(height:20),
              Obx(() => CustomTextFromField(
                keyboardType: TextInputType.visiblePassword,
                titleText: "Password",
                hintTile: "Password",
                controller: controller.tecPasswordReg.value,
                validator:(value)=> Utils.passwordValidator(value),
              ),),
              const SizedBox(height:25),
              CustomButtons.regular(
                horizontalMargin: 38,
                verticalMargin: 10,
                text: "Submit",
                background: MyColors.blueColor,
                txtColor: MyColors.whiteColor,
                onPressed: controller.onSubmitBtnPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
