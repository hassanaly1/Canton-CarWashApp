import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/checkout__screen.dart';
import 'package:canton/classes/custom_appbar.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/classes/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: whiteCustomAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomColumnWidget(text: 'State', controller: _stateController),
            const SizedBox(height: 15),
            CustomColumnWidget(
                text: 'Location', controller: _locationController),
            const SizedBox(height: 15),
            CustomColumnWidget(
                text: 'License Plate', controller: _licensePlateController),
            const SizedBox(height: 15),
            const CustomTextWidget(
              text:
                  'We use License Plate Recognition to process Recurring Plans to conveniently allow you to redeem plan washes. Please enter a valid License Plate (without dashes) for this Recurring Plan purchase.',
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                Get.to(const CheckoutScreen(),
                    transition: Transition.rightToLeft);
              },
              text: 'Add to Cart',
              color: AppAssets.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}

class CustomColumnWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  const CustomColumnWidget({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(text: text, fontSize: 20, fontWeight: FontWeight.w700),
        CustomTextFormField(
          keyboardType: TextInputType.text,
          controller: controller,
          hint: 'Enter $text',
        )
      ],
    );
  }
}
