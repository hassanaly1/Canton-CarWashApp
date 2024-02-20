import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_appbar.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/debitcard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../classes/custom_textfield.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController cName = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: whiteCustomAppBar(title: 'Checkout'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextWidget(
                text: 'Billing Details',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                controller: fName,
                hint: 'First name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                controller: lName,
                hint: 'Last name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                controller: lName,
                hint: 'Town/City',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.text,
                controller: email,
                hint: 'Address',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                controller: username,
                hint: 'Zip Code',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                obscureText: true,
                controller: password,
                hint: 'Phone',
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[300],
                width: Get.width,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTextWidget(
                        text: "Your Order",
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Name", fontSize: 15),
                        SizedBox(
                          width: 20,
                        ),
                        CustomTextWidget(
                            text: "The Shining Knight Ceramic Wash Club",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Subtotal", fontSize: 15),
                        SizedBox(
                          width: 20,
                        ),
                        CustomTextWidget(
                            text: "\$24.00, London",
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ],
                    ),

                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Department", fontSize: 15),
                        SizedBox(
                          width: 20,
                        ),
                        CustomTextWidget(
                            text: "Recurring Plan",
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "License Plate", fontSize: 13),
                        SizedBox(
                          width: 10,
                        ),
                        CustomTextWidget(
                            text: "SDXASX",
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Taxes", fontSize: 13),
                        SizedBox(
                          width: 10,
                        ),
                        CustomTextWidget(
                            text: "\$296.00",
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Subtotal", fontSize: 15),
                        SizedBox(
                          width: 20,
                        ),
                        CustomTextWidget(
                            text: "\$320.00",
                            fontWeight: FontWeight.w600,
                            fontSize: 15)
                      ],
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(text: "Total", fontSize: 15),
                        SizedBox(
                          width: 45,
                        ),
                        CustomTextWidget(
                            text: "\$320.00",
                            fontWeight: FontWeight.w600,
                            fontSize: 13),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButton(
                      onTap: () {
                        Get.to(const DebitCardScreen(),
                            transition: Transition.rightToLeft);
                      },
                      text: 'Purchase Now',
                      color: AppAssets.primaryColor,
                    )
                    // InkWell(
                    //   onTap: () {
                    //     Get.to(() => const DebitCardScreen());
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.all(15),
                    //     width: Get.width,
                    //     color: AppAssets.primaryColor,
                    //     child: const Center(
                    //       child: CustomTextWidget(
                    //           text: "PLACE ORDER",
                    //           fontWeight: FontWeight.w600,
                    //           textColor: Colors.white,
                    //           fontSize: 15),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
