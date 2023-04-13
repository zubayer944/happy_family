import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/utils/utils.dart';
import 'package:happy_family/app/common/values/my_colors.dart';

import '../../../../common/controller/app_controller.dart';
import '../../../../common/widgets/custom_loader.dart';
import '../../../../model/event_model.dart';
import '../../user_dashboard/model/payment_model.dart';
import '../interface/user_package_details_interface.dart';

class UserPackageDetailsController extends GetxController
    implements UserPackageDetailsInterface {
  final formKey = GlobalKey<FormState>();

  Rx<PaymentModel> paymentModel = PaymentModel().obs;

  // CollectionReference payments = FirebaseFirestore.instance.collection('payments');
  final AppController appController = Get.find();

  Rx<TextEditingController> tecNameMem = TextEditingController().obs;
  Rx<TextEditingController> tecTotalMem = TextEditingController().obs;
  Rx<TextEditingController> tecTotalAdult = TextEditingController().obs;
  Rx<TextEditingController> tecTotalUnderAge = TextEditingController().obs;
  Rx<TextEditingController> tecAmount = TextEditingController().obs;
  Rx<TextEditingController> tecBkashNo = TextEditingController().obs;
  Rx<TextEditingController> tecReferenceIdNo = TextEditingController().obs;
  Rx<TextEditingController> tecBankAccNo = TextEditingController().obs;

  RxString totalAmount = "".obs;
  RxInt cashOutFeeForBkash = 0.obs;

  late EventModel event;

  @override
  void onInit() {
    event = Get.arguments["event"];
    tecNameMem.value.text = appController.userModel.value.name ?? "";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> _sendData() async {
    Utils.unFocus;
    CollectionReference eventCollection =
        FirebaseFirestore.instance.collection('events');

    BookedUserInfo bookedUserInfo = BookedUserInfo(
        userName: tecNameMem.value.text.trim(),
        userId: appController.userModel.value.userId,
        bankAccNo: tecBankAccNo.value.text.trim(),
        bkashNumber: tecBkashNo.value.text.trim(),
        bkashReferenceId: tecReferenceIdNo.value.text.trim(),
        totalAdult: int.parse(tecTotalAdult.value.text.trim().isEmpty
            ? "0"
            : tecTotalAdult.value.text.trim()),
        totalChildren: int.parse(tecTotalUnderAge.value.text.trim().isEmpty
            ? "0"
            : tecTotalUnderAge.value.text.trim()),
        totalAmount: int.parse(tecAmount.value.text.trim()),
        createdAt: DateTime.now().toString(),
        verifiedPayment: false);
    CustomLoader.show;
    eventCollection.doc(event.documentId).set({
      "bookedUserInfo": FieldValue.arrayUnion([
        bookedUserInfo.toCreate()
          ..addAll({"createdAt": DateTime.now().toString()})
      ]),
    }, SetOptions(merge: true)).then((value) {
      eventCollection.doc(event.documentId).update({
        "totalBookedAdultCount":
            FieldValue.increment(bookedUserInfo.totalAdult ?? 0),
        "totalBookedChildrenCount":
            FieldValue.increment(bookedUserInfo.totalChildren ?? 0),
        "totalBookedUniqueCount": FieldValue.increment(1),
      });

      CustomLoader.hide;
      // Get.toNamed(Routes.USER_DASHBOARD);
      Get.back();
      Get.snackbar("Success", "Please wait for admin confirmation",
          backgroundColor: MyColors.greenColor, colorText: MyColors.blackColor);
    }).catchError((
      error,
    ) {
      CustomLoader.hide;
      print('UserPackageDetailsController._sendData $error');
      Get.snackbar("Failed!!!", error.toString(),
          backgroundColor: MyColors.redColor.withOpacity(0.4),
          colorText: MyColors.blackColor);
    });
    CustomLoader.hide;
  }

  @override
  void onSubmitPackageDetailsPressed() {
    Utils.unFocus;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _sendData();
      // Get.back();
    }
    // TODO: implement onSubmitPackageDetailsPressed
  }

  @override
  void onTotalMemberAndAmountChanged(String value) {
    int adultMember = int.parse(
        tecTotalAdult.value.text.isEmpty ? "0" : tecTotalAdult.value.text);
    int childrenMember = int.parse(tecTotalUnderAge.value.text.isEmpty
        ? "0"
        : tecTotalUnderAge.value.text);

    int total = ((adultMember * (event.adultPrice ?? 0)) +
        (childrenMember * (event.childrenPrice ?? 0)));
    tecTotalMem.value.text = (adultMember + childrenMember).toString();
    tecAmount.value.text = (total + _cashOutFee(total)).toString();
  }

  int _cashOutFee(int totalAmount) {
    return ((19 * totalAmount) / 1000).ceil();
  }
}
