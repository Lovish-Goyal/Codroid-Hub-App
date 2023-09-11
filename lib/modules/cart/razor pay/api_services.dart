import 'dart:convert';
import 'package:codroid_hub/data/env.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final razorPayApiServicesProvider = Provider<RazorApiServices>((ref) {
  return RazorApiServices();
});

class RazorApiServices {
  final razorPayKey = Env.razorPayApiKey;
  final razorPaySecret = Env.razorPayKeySecret;

  razorPayApi(num amount, String receiptId) async {
    var auth =
        'Basic ${base64Encode(utf8.encode('$razorPayKey:$razorPaySecret'))}';
    var headers = {'content-type': 'application/json', 'Authorization': auth};
    var request =
        http.Request('POST', Uri.parse('https://api.razorpay.com/v1/orders'));
    request.body = json.encode({
      // Amount in smallest unit
      // like in paise for INR
      "amount": amount * 100,
      // Currency
      "currency": "INR",
      // Receipt Id
      "receipt": receiptId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      return await response.stream.bytesToString();
    } else {
      return {
        "status": "fail",
        "message": (await response.stream.bytesToString())
      };
    }
  }
}
