import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/custom_text_field/custom_text_from_field.dart';
import 'package:happy_family/app/common/values/my_colors.dart';
import 'package:lottie/lottie.dart';
import '../../../../common/utils/utils.dart';
import '../../../../common/widgets/custom_buttons.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor.withOpacity(0.9),
      body: Form(
        key: controller.formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:180,child: Image.asset("assets/logo/ic_launcher.png")),
                  const SizedBox(height: 25,),
                  Obx(() => CustomTextFromField(
                    keyboardType: TextInputType.phone,
                    titleText: "Phone",
                    hintTile: "Phone",
                    controller: controller.tecPhone.value,
                    onChanged: (va) => controller.tecPhone.refresh(),
                    validator:(value)=> Utils.emptyValidator(value, "Phone number must be provide"),
                  ),),
                  const SizedBox(height:10),
                  Obx(() => CustomTextFromField(
                 keyboardType: TextInputType.visiblePassword,
                 titleText: "Password",
                 hintTile: "Password",
                 controller: controller.tecPassword.value,
                 validator:(value)=> Utils.passwordValidator(value),
                    onChanged: (va) => controller.tecPassword.refresh(),
               ),),
                  const SizedBox(height:25),
                  Obx(
                    () => CustomButtons.regular(
                      horizontalMargin: 38,
                      verticalMargin: 10,
                      text: "Login",
                      background: MyColors.blueColor,
                      txtColor: MyColors.whiteColor,
                      onPressed: controller.tecPassword.value.text.isEmpty ||
                              controller.tecPhone.value.text.isEmpty
                          ? null
                          : controller.onLoginButtonPressed,
                    ),
                  ),
                  CustomButtons.regular(
                    horizontalMargin: 38,
                    verticalMargin: 10,
                    text: "Registration",
                    background: MyColors.blueColor,
                    txtColor: MyColors.whiteColor,
                    onPressed: controller.onRegistrationButtonPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
