import 'package:flutter/material.dart';
import 'package:myapp/Widget/styles.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

import 'GooglePay.dart';


class myPayment extends StatefulWidget {
  const myPayment({super.key});

  @override
  State<myPayment> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<myPayment> {
  late Razorpay _razorpay;
  TextEditingController _controller=TextEditingController();

  @override
  void initState(){
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // handle payment success
    print("Payment Success: " + response.paymentId.toString());
  }
  void _handlePaymentError(PaymentFailureResponse response) {
    // handle payment error
    print("Payment Error: " + response.code.toString() + " - " + response.message.toString());
  }
  void _handleExternalWallet(ExternalWalletResponse response) {
    // handle external wallet payment
    print("External Wallet: " + response.walletName.toString());
  }
  void _openCheckout() {
    var options = {
      'key': 'YOUR_KEY_HERE',
      'amount': int.parse(_controller.text) * 100,
      'name': 'Test Payment',
      'description': 'Test payment for Flutter App',
      'prefill': {'contact': '1234567890', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm','Googlepay']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            size: 40,
            color: Color.fromRGBO(26, 116, 226, 1),
          ),
        ),
        title: Text(
          "My Payment method",
          style: headerText,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Payment Options",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Amount',
                prefixIcon: Icon(Icons.money),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Pay Now'),
              onPressed: () {
                _openCheckout();
              },
            ),
          ElevatedButton(
            child: Text('Pay with GPay'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => GooglePay()),
                ),
              );
            },
          ),
          ],
      ),
    );
  }
}
