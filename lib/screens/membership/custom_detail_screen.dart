import 'package:canton/classes/addtocart_screen.dart';
import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_membership_card.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDetailScreen extends StatelessWidget {
  const CustomDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.primaryColor,
      appBar: AppBar(
        backgroundColor: AppAssets.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Get.height * 0.1,
          ),
          Center(
            child: SizedBox(
                height: Get.height * 0.1,
                width: 200,
                child: const CustomTextWidget(
                  text: 'Monthly Plans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  textColor: Colors.white,
                )),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: AppAssets.backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPricingWidget(
                            onTap: () => Get.to(const AddToCartScreen(),
                                transition: Transition.downToUp),
                            planType: 'Exterior',
                            planPrice: '\$19.99/Month',
                            imagePath: 'basic-plan.png'),
                        CustomPricingWidget(
                            onTap: () => Get.to(const AddToCartScreen(),
                                transition: Transition.downToUp),
                            planType: 'Super',
                            planPrice: '\$24.99/Month',
                            imagePath: 'basic-plan.png'),
                        CustomPricingWidget(
                            onTap: () => Get.to(const AddToCartScreen(),
                                transition: Transition.downToUp),
                            planType: 'Supreme',
                            planPrice: '\$29.99/Month',
                            imagePath: 'basic-plan.png'),
                        CustomPricingWidget(
                            onTap: () => Get.to(const AddToCartScreen(),
                                transition: Transition.downToUp),
                            planType: 'Works Wash',
                            planPrice: '\$39.99/Month',
                            imagePath: 'basic-plan.png'),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                //height: 300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
