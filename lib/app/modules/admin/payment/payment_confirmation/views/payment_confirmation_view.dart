import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_confirmation_controller.dart';

class PaymentConfirmationView extends GetView<PaymentConfirmationController> {
  const PaymentConfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentConfirmationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentConfirmationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
