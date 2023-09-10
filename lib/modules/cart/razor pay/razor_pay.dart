import 'dart:convert';
import 'package:codroid_hub/modules/cart/razor%20pay/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPay extends ConsumerStatefulWidget {
  const RazorPay({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RazorPayState();
}

class _RazorPayState extends ConsumerState<RazorPay> {
  final _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Logger().i("Payment Success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Logger().e(response.message);
    Logger().e("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    final razorApiServices = ref.watch(razorPayApiServicesProvider);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final apiRes = await razorApiServices.razorPayApi(1, "sdaf");
              Logger().i(apiRes);

              final orderId = json.decode(apiRes)["id"];
              Logger().i(orderId);
              final options = {
                "key": "rzp_test_qRqtDl6Kpsdjx3",
                "order_id": orderId,
                "name": "codroid hub",
                "amount": json.decode(apiRes)["amount"],
                "description": "testing payment",
                "currency": "INR",
                // "timeout": 300,
                "prefill": {
                  "contact": "+917494979209",
                  "email": "test@gmail.com",
                },
                "external": {
                  "wallets": ["paytm"]
                }
              };
              try {
                _razorpay.open(options);
              } catch (e) {
                debugPrint(e.toString());
              }
            },
            child: const Text("Pay Now")),
      ),
    );
  }
}
