import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_appbar.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_textfield.dart';
import 'package:canton/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DebitCardScreen extends StatefulWidget {
  const DebitCardScreen({Key? key}) : super(key: key);

  @override
  State<DebitCardScreen> createState() => _DebitCardScreenState();
}

class _DebitCardScreenState extends State<DebitCardScreen> {
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiry = TextEditingController();
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: whiteCustomAppBar(title: 'Payment'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Center(
                  child: Image(image: AssetImage('assets/images/payment.png'))),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Container(
              color: Colors.grey[300],
              width: Get.width,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.number,
                    controller: cardNumber,
                    hint: 'Card Number',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: expiry,
                        hint: 'Card Expiration(MM/YY)',
                      )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: CustomTextFormField(
                        controller: code,
                        hint: 'Card Security Code',
                        keyboardType: TextInputType.number,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    onTap: () {
                      Get.to(const HomeScreen(),
                          transition: Transition.downToUp);
                    },
                    text: 'Pay Now',
                    color: AppAssets.primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
