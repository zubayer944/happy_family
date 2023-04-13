import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomLoader {
  static Future get show {
    hide;
    return Future.delayed(Duration.zero, () {
      return Get.dialog(
        WillPopScope(
          //TODO : have some issue : to set this boolean value
          onWillPop: () async => true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                  height: Get.width * 0.25,
                  width: Get.width * 0.25,
                  child: Lottie.asset("assets/lotties/9969-halloween-pumpkin-black-cat.json"))
              // Container(
              //   height: Get.width * 0.40,
              //   width: Get.width * 0.40,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(8),
              //     color: AppColors.whiteColor,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Image.asset(
              //         AppAssets.gif.loading,
              //         height: Get.width * 0.25,
              //         width: Get.width * 0.25,
              //       ),
              //       SpinKitFadingCircle(
              //         color: AppColors.primaryColor191F3A,
              //         size: 40,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
        //TODO : have some issue to set this boolean value :
        barrierDismissible: false,
      );
    });
  }

  static get hide {
    if (Get.isDialogOpen!) Get.back();
  }

  static Widget get cupertino => const Center(
    child: CupertinoActivityIndicator(),
  );

  static Widget get material => const Center(
    child: CircularProgressIndicator(),
  );

  // static Future showPercent () {
  //   return showDialog(
  //     context: Get.context!,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Row(
  //           children: [
  //             const CircularProgressIndicator(),
  //
  //             const SizedBox(width: 20),
  //
  //             Column(
  //               mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 const Text(
  //                   "Uploading...",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //
  //                 const SizedBox(height: 5),
  //
  //                 Obx(() => Text("${Get.find<AppController>().uploadPercent.value.toStringAsFixed(0)}%")),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}