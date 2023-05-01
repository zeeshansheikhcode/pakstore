import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
class PaypalMethod extends StatefulWidget {
  const PaypalMethod({Key? key}) : super(key: key);

  @override
  _PaypalMethodState createState() => _PaypalMethodState();
}

class _PaypalMethodState extends State<PaypalMethod> {
  Map<String, dynamic>? paymentIntentData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Tutorial'),
        centerTitle: true, 
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => UsePaypal(
                            sandboxMode: true,
                            clientId:
                                "AcHP13CKgnYHU-Vktlzg-tnD1tXTDojSoHwJCfCrLP6Ye_CqxHPN4byAXge1brndFvA1vOXVnu37amZK",
                            secretKey:
                                "EEKYc1SaN6CoosngYy6fRiEW0CYzQuHaQs7qRaS-iTTOQ3cuyFRWsj_q74-T8EDDoB1-xgME2zOscmaa",
                            returnURL: "https://samplesite.com/return",
                            cancelURL: "https://samplesite.com/cancel",
                            transactions: const [
                              {
                                "amount": {
                                  "total": '10.12',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '10.12',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                "item_list": {
                                  "items": [
                                    {
                                      "name": "A demo product",
                                      "quantity": 1,
                                      "price": '10.12',
                                      "currency": "USD"
                                    }
                                  ],
                                
                                }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              print("onSuccess: $params");
                            },
                            onError: (error) {
                              print("onError: $error");
                            },
                            onCancel: (params) {
                              print('cancelled: $params');
                            }),
                      ),
                    ) ;
                   },
  
          
          child: Container(
            height: 50,
            width: 200,
            color: Colors.green,
            child: const Center(
              child: Text(
                'Paypal  Pay',
                style: TextStyle(color: Colors.white, fontSize: 20),
               ),
             ),
           ),
         ),
       ),
      );
    }
  }