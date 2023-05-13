import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePay extends StatefulWidget {
  const GooglePay({Key? key}) : super(key: key);

  @override
  State<GooglePay> createState() => _GooglePayState();
}

class _GooglePayState extends State<GooglePay> {
  final _paymentItems=<PaymentItem>[];
  final String defaultGooglePay = '''{
  "provider": "google_pay",
  "data": {
    "environment": "TEST",
    "apiVersion": 2,
    "apiVersionMinor": 0,
    "allowedPaymentMethods": [
      {
        "type": "CARD",
        "tokenizationSpecification": {
          "type": "PAYMENT_GATEWAY",
          "parameters": {
            "gateway": "example",
            "gatewayMerchantId": "gatewayMerchantId"
          }
        },
        "parameters": {
          "allowedCardNetworks": ["VISA", "MASTERCARD"],
          "allowedAuthMethods": ["PAN_ONLY", "CRYPTOGRAM_3DS"],
          "billingAddressRequired": true,
          "billingAddressParameters": {
            "format": "FULL",
            "phoneNumberRequired": true
          }
        }
      }
    ],
    "merchantInfo": {
      "merchantId": "01234567890123456789",
      "merchantName": "Example Merchant Name"
    },
    "transactionInfo": {
      "countryCode": "US",
      "currencyCode": "USD"
    }
  }
}''';

  @override
  void initState() {
    // TODO: implement initState
    _paymentItems.add(PaymentItem(amount:'20',label:"Station1",status:PaymentItemStatus.final_price));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    void onGooglePayResult(paymentResult) {
      // Send the resulting Google Pay token to your server / PSP
    }
    return Scaffold(
      body:Center(
        child:GooglePayButton(
          paymentConfiguration: PaymentConfiguration.fromJsonString(
              defaultGooglePay),
          paymentItems: _paymentItems,
          type: GooglePayButtonType.pay,
          margin: const EdgeInsets.only(top: 15.0),
          onPaymentResult: onGooglePayResult,
          loadingIndicator: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
    )
      );
  }
}
