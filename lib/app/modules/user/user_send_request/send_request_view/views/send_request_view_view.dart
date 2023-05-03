import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/values/my_colors.dart';
import '../../../../../common/values/style_text.dart';
import '../../../../../model/event_model.dart';
import '../../../../admin/total_cost/all_users/models/debit_credit_model.dart';
import '../controllers/send_request_view_controller.dart';

class SendRequestViewView extends GetView<SendRequestViewController> {
  const SendRequestViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      floatingActionButton: Obx(
        () => Visibility(
          visible: (controller.eventMode.value.bookedUserInfo ?? [])
              .where((element) =>
                  element.userId ==
                  controller.appController.userModel.value.userId)
              .isEmpty,
          child: FloatingActionButton(
            onPressed: controller.onSendRequestForMoneyPressed,
            child: const Center(child: Icon(Icons.add)),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Send Request'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: controller.onPopupAppBarIconClicked,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(
                      Icons.delete_forever,
                      color: MyColors.redColor,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text("Delete request"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => (controller.eventMode.value.bookedUserInfo ?? [])
                    .where((element) =>
                        element.userId ==
                        controller.appController.userModel.value.userId)
                    .isEmpty
                ? Center(
                    child: Text(
                      "You are not booked any package",
                      textAlign: TextAlign.center,
                      style: StyleText.nunitoSans_400_16
                          .copyWith(fontSize: 24, color: MyColors.greyColor),
                    ),
                  )
                : _paymentPackage(
                    controller.eventMode.value,
                    (controller.eventMode.value.bookedUserInfo ?? [])
                        .where((element) =>
                            element.userId ==
                            controller.appController.userModel.value.userId)
                        .first,
                  )),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Visibility(
                visible: (controller.eventMode.value.bookedUserInfo ?? [])
                    .where((element) {
                  return element.userId ==
                          controller.appController.userModel.value.userId &&
                      element.verifiedPayment;
                }).isNotEmpty,
                child: Column(
                  children: [
                    _richText(
                        "মোট জমা", "${controller.totalCreditPrice.value} টাকা"),
                    _richText(
                        "মোট খরচ", "${controller.totalDebitPrice.value} টাকা"),
                    Divider(height: 5, color: MyColors.greyColor),
                    _richText("অবশিষ্ট মোট টাকা",
                        "${controller.totalCreditPrice.value - controller.totalDebitPrice.value}"),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.greyColor)),
                      child: Wrap(
                        children: controller.eventList
                              .asMap()
                              .entries
                              .map((e) {
                          Color color1 = MyColors.whiteColor;
                          Color color2 = MyColors.greyColor.withOpacity(0.4);
                          final color = e.key % 2 == 0 ? color1 : color2;
                        return e.value.debitCreditType == "জমা"
                            ? _debitCreditTotalView(e.value, e.key, color)
                            : const SizedBox();
                      }).toList()),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: MyColors.greyColor)),
                      child: Wrap(
                        children: controller.eventList.asMap().entries
                            .map((e) {
                          Color color1 = MyColors.whiteColor;
                          Color color2 = MyColors.greyColor.withOpacity(0.4);
                          final color = e.key % 2 == 0 ? color1 : color2;
                          return e.value.debitCreditType == "খরচ"
                              ? _debitCreditTotalView(e.value,e.key,color)
                              : const SizedBox();
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _debitCreditTotalView(DebitCreditModel debitCreditModel, int index, Color color, ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:color,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Text(
              debitCreditModel.costingName ?? "",
              textAlign: TextAlign.center,
            )),
            Expanded(
                child: Text(debitCreditModel.debitCreditType ?? "",
                    textAlign: TextAlign.center)),
            Expanded(
                child: Text("${debitCreditModel.amount} TK",
                    textAlign: TextAlign.center)),
          ],
        ),
      ),
    );
  }

  Widget _paymentPackage(EventModel eventModel, BookedUserInfo bookedUserInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            _richText("Package name", (eventModel.eventName ?? "")),
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
            _richText(
                "Bkash Acc", (bookedUserInfo.bkashNumber ?? 0).toString()),
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
            _richText(
                "Total Adult", "${bookedUserInfo.totalAdult ?? 0} persons"),
            const SizedBox(
              height: 5,
            ),
            _richText("Total Children",
                "${bookedUserInfo.totalChildren ?? 0} persons"),
            const SizedBox(
              height: 5,
            ),
            _richText("Payment Verification Status",
                bookedUserInfo.verifiedPayment ? "Success" : "Pending"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
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
