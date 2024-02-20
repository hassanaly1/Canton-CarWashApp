import 'package:canton/classes/addtocart_screen.dart';
import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/screens/membership/custom_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MembershipPurchaseScreen extends StatelessWidget {
  const MembershipPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
        actions: const [
          Icon(Icons.cancel_rounded),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Purchase',
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            const CustomTextWidget(
              text: 'Our Membership',
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: Get.height * 0.05),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FreeItemList(text: 'Unlimited Access', icon: Icons.done),
                FreeItemList(
                    text: 'Join our monthly club for 19.99', icon: Icons.done),
                FreeItemList(text: 'No Adds', icon: Icons.done),
                FreeItemList(text: 'Unlimited Access', icon: Icons.done),
              ],
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                Get.to(const AddToCartScreen(),
                    transition: Transition.downToUp);
              },
              color: AppAssets.primaryColor,
              text: 'Monthly Plan for \$19.99'.tr,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: () {
                Get.to(const CustomDetailScreen(),
                    transition: Transition.downToUp);
              },
              color: AppAssets.primaryColor,
              text: 'Other Plans'.tr,
            ),
            // customButton(
            //   onTap: () {
            //     Get.to(const CustomDetailScreen(
            //         plan: 'Yearly Plan',
            //         basicPlanPrice: '\$500/Month',
            //         standardPlanPrice: '\$800/Month',
            //         premiumPlanPrice: '\$1200/Month'));
            //   },
            //   btnColor: Colors.white,
            //   borderColor: AppAssets.primaryColor,
            //   text: 'Yearly Plan'.tr,
            //   textColor: AppAssets.primaryColor,
            //   fontWeight: FontWeight.normal,
            // ),
          ],
        ),
      ),
    );
  }
}

class FreeItemList extends StatelessWidget {
  final String text;
  final IconData? icon;
  const FreeItemList({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // Center the items horizontally
      children: [
        Icon(icon),
        SizedBox(width: Get.width * 0.05),
        CustomTextWidget(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: Colors.black87),
      ],
    );
  }
}
