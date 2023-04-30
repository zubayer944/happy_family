import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/modules/admin/event/event_create/interface/event_create_interface.dart';
import '../../../../../common/values/my_colors.dart';
import '../../../../../common/widgets/custom_loader.dart';
import '../../../../../model/event_model.dart';

class EventCreateController extends GetxController
    implements EventCreateInterface {
  final formKey = GlobalKey<FormState>();

  CollectionReference events = FirebaseFirestore.instance.collection('events');

  Rx<EventModel> eventModel = EventModel().obs;

  Rx<TextEditingController> tecAdultPrice = TextEditingController().obs;
  Rx<TextEditingController> tecChildrenPrice = TextEditingController().obs;
  Rx<TextEditingController> eventId = TextEditingController().obs;
  Rx<TextEditingController> tecBkashOrNagadNo = TextEditingController().obs;
  Rx<TextEditingController> tecBankAccNo = TextEditingController().obs;
  Rx<TextEditingController> tecPackageName = TextEditingController().obs;

  Rx<DateTime> validEventDate = DateTime.now().obs;
  Rx<DateTime> expiredEventDate = DateTime.now().obs;

  @override
  void onInit() {
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

  Future<void> _createEvent() async {
    eventModel.value = EventModel(
      adultPrice: tecAdultPrice.value.text.trim().isEmpty ? 0 : int.parse(tecAdultPrice.value.text.trim()),
      childrenPrice: tecChildrenPrice.value.text.trim().isEmpty ? 0 : int.parse(tecChildrenPrice.value.text.trim()),
      eventName: tecPackageName.value.text.trim(),
      date: validEventDate.value,
      bankAccNo: tecBankAccNo.value.text.trim(),
      lastBookingDate: expiredEventDate.value,
      belowChildren: "Free (Not for All)",
      location: "Chandpur,Natore,Rajshahi",
      nagadOrBkashNumber: tecBkashOrNagadNo.value.text.trim(),
    );
    CustomLoader.show;
    await events
        .add(eventModel.value.create()
          ..addAll({
            "createdAt": FieldValue.serverTimestamp(),
          }))
        .then((DocumentReference<Object?> value) {
      CustomLoader.hide;
      Get.back();
      Get.snackbar("Success", "Successfully",backgroundColor: MyColors.greenColor);

    }).catchError((
      error,
    ) {
      CustomLoader.hide;
      print('EventCreateController._createEvent ----<><><> $error');
      Get.snackbar("Sorry", "$error", backgroundColor: MyColors.redColor);
    });
  }

  @override
  void onSubmitPackageCreatePressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _createEvent();
    }
  }

  @override
  void onExpiredEventDateSelect(DateTime date) {
    expiredEventDate.value = date;
    print(
        'AdminDashboardController.onExpiredEventDateSelect---<>>>$expiredEventDate');
  }

  @override
  void onValidEventDateSelect(DateTime date) {
    validEventDate.value = date;
    print(
        'AdminDashboardController.onValidEventDateSelect---<<<>>>>>>$validEventDate');
  }
}
