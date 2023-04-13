import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_family/app/common/custom_text_field/custom_text_from_field.dart';
import 'package:happy_family/app/common/custom_text_field/text_field_title.dart';
import 'package:happy_family/app/common/utils/utils.dart';
import 'package:happy_family/app/modules/admin/total_cost/all_users/models/debit_credit_model.dart';

import '../../../../../common/values/my_colors.dart';
import '../../../../../common/values/style_text.dart';
import '../../../../../common/widgets/custom_buttons.dart';
import '../controllers/total_cost_controller.dart';

class TotalCostView extends GetView<AllUsersController> {
  const TotalCostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Total cost'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          ),
          child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            _debitCreditSetupField(),
                Obx(
                  () => _richText("মোট জমা",
                      "${controller.totalCreditPrice.value} টাকা"),
                ),

                Obx(
                  () => _richText("মোট খরচ",
                      "${controller.totalDebitPrice.value} টাকা"),
                ),
                Divider(height: 5,color: MyColors.greyColor),
                Obx(
                  () => _richText("অবশিষ্ট মোট টাকা",
                      "${controller.totalCreditPrice.value - controller.totalDebitPrice.value}"),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MyColors.greyColor)
                  ),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.eventList.length,
                      itemBuilder: (context, index) {
                        return _debitCreditTotalView(controller.eventList[index]);
                      },
                    ),
                  ),
                )
          ],
        ),
          ),
        ),
      ),
    );
  }

  Widget _debitCreditTotalView(DebitCreditModel debitCreditModel ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Text(debitCreditModel.costingName ?? "",textAlign: TextAlign.center,)),
            Expanded(child: Text(debitCreditModel.debitCreditType ?? "",textAlign: TextAlign.center)),
            Expanded(child: Text(debitCreditModel.amount.toString(),textAlign: TextAlign.center)),
            Expanded(child: InkWell(onTap:() => controller.onDeleteTap(debitCreditModel),child: Icon(Icons.cancel_outlined,color: MyColors.redColor,)))
          ],
        ),
      ),
    );
  }

  Widget _debitCreditSetupField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: MyColors.greyColor),
        ),
        child: Column(
          children: [
            CustomTextFromField(
              keyboardType: TextInputType.name,
              paddingSymmetric: 10,
              titleText: "Costing name",
              hintTile: "Enter costing name",
              controller: controller.tecCostingName.value,
              validator: (value) =>
                  Utils.emptyValidator(value, "Costing name is required"),
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                CustomTextFromField(
                  keyboardType: TextInputType.number,
                  paddingSymmetric: 10,
                  textBoxWidth: 160,
                  titleText: "Amount",
                  hintTile: "Enter amount",
                  controller: controller.tecAmount.value,
                  validator: (value) =>
                      Utils.emptyValidator(value, "Amount is required"),
                ),
                _dropDownBtn(),
              ],
            ),
            const SizedBox(height: 10,),
            CustomButtons.regular(
              horizontalMargin: 10,
              verticalMargin: 5,
              text: "Save",
              background: MyColors.blueColor,
              txtColor: MyColors.whiteColor,
              onPressed: controller.onSubmitPressed,
            ),
          ],
        ),
      ),
    );
  }
  Widget _dropDownBtn() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextFieldTitle("Debit credit Type"),
          const SizedBox(height: 6,),
          SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                  contentPadding:const EdgeInsets.only(left: 10,right: 5),
                  border:const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Name",
                  fillColor: Colors.grey[200]),
              style: const TextStyle(color: Colors.black,fontSize: 16),
              onChanged: controller.onCreditAndDebitChanged,
              value:controller.amountType.value,
              items: ["জমা","খরচ"]
                  .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
  Widget _richText(String name, String value) {
    return RichText(
      text: TextSpan(
        text: "$name : ",
        style: StyleText.nunitoSans_400_16.copyWith(color: MyColors.blackColor),
        children: [
          TextSpan(text: value, style: StyleText.nunitoSans_700_14),
        ],
      ),
    );
  }
}
