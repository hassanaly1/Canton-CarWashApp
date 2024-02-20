import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_membership_card.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/screens/membership/membership_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageMembershipScreen extends StatefulWidget {
  const ManageMembershipScreen({Key? key}) : super(key: key);

  @override
  State<ManageMembershipScreen> createState() => _ManageMembershipScreenState();
}

class _ManageMembershipScreenState extends State<ManageMembershipScreen> {
  List<String> reason = [
    'Subscription price is too high',
    'No longer fit in my budget',
    "i'll be back",
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppAssets.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              text: 'Manage Subscription',
              textColor: AppAssets.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextWidget(
              text: 'Current Plan',
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPricingWidget(
                onTap: () {},
                planType: 'Basic',
                planPrice: '\$500/Month',
                imagePath: 'basic-plan.png'),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const MembershipPurchaseScreen());
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Available Plan',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  Icon(Icons.next_week)
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                //  Get.to(const HomeScreen());
              },
              color: Colors.white,
              text: 'PAUSE SUBSCRIPTION',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              onTap: () {
                _showReasonDialog(context);
                //  Get.to(const HomeScreen());
              },
              color: Colors.white,
              text: 'CANCEL SUBSCRIPTION',
            ),
          ],
        ),
      ),
    );
  }

  void _showReasonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: setupAlertDialoadContainer(),
          actions: [
            TextButton(
              onPressed: () {
                // Perform any action you need, like submitting the selected reasons
                Navigator.of(context).pop();
              },
              child: const Text('Confirm'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget setupAlertDialoadContainer() {
    return SizedBox(
      height: Get.height * 0.55,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
            text: 'Cancel Subscription?',
            textColor: AppAssets.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          const CustomTextWidget(
            text:
                "To help us improve our products, let us know why you're cancelling.",
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: Get.height * 0.4,
            width: Get.width * 0.75,
            child: ListView.builder(
              itemCount: reason.length,
              itemBuilder: (BuildContext context, int index) {
                List<bool> reasonSelections =
                    List.generate(reason.length, (index) => false);

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckboxListTile(
                      title: CustomTextWidget(
                        text: reason[index],
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        textColor: reasonSelections[index]
                            ? AppAssets.primaryColor
                            : Colors.black,
                      ),

                      autofocus: false,
                      activeColor: AppAssets.primaryColor,
                      checkColor: Colors.white,
                      selected: reasonSelections[index],
                      value: reasonSelections[index],
                      // value: reasonSelections[index],
                      onChanged: (bool? value) {
                        setState(() {
                          reasonSelections[index] = value ?? false;
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
