import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_appbar.dart';
import 'package:canton/classes/custom_plan_widget.dart';
import 'package:flutter/material.dart';

class SupremePlanScreen extends StatefulWidget {
  const SupremePlanScreen({super.key});

  @override
  State<SupremePlanScreen> createState() => _SupremePlanScreenState();
}

class _SupremePlanScreenState extends State<SupremePlanScreen> {
  final List _basicPlanItems = [
    [
      'The King Graphene Wash Club',
      '\$29.99/mo',
      '1.png',
      'Redeem for The King Graphene Wash.\nUnlimited Redemptions.A redemption can not be applied credit toward a more expensive upgrade\nThis is a monthly Recurring Plan that will charge your credit card today and on a monthly basis. \nRecurring Plans are for personal use only, not intended for commercial use.\nYour License Plate will be used for redemptions. \nPlease ensure that the License Plate entered is correct.\nProduct SKU: 449922'
    ],
    [
      'The Shining Knight Ceramic Wash Club',
      '\$29.99/mo',
      '2.png',
      'Redeem for The King Graphene Wash.\nUnlimited Redemptions.A redemption can not be applied credit toward a more expensive upgrade\nThis is a monthly Recurring Plan that will charge your credit card today and on a monthly basis. \nRecurring Plans are for personal use only, not intended for commercial use.\nYour License Plate will be used for redemptions. \nPlease ensure that the License Plate entered is correct.\nProduct SKU: 449922'
    ],
    [
      'The Wicked Wheel Wash Club',
      '\$29.99/mo',
      '3.png',
      'Redeem for The King Graphene Wash.\nUnlimited Redemptions.A redemption can not be applied credit toward a more expensive upgrade\nThis is a monthly Recurring Plan that will charge your credit card today and on a monthly basis. \nRecurring Plans are for personal use only, not intended for commercial use.\nYour License Plate will be used for redemptions. \nPlease ensure that the License Plate entered is correct.\nProduct SKU: 449922'
    ],
    [
      'The Magic Wash Club',
      '\$29.99/mo',
      '4.png',
      'Redeem for The King Graphene Wash.\nUnlimited Redemptions.A redemption can not be applied credit toward a more expensive upgrade\nThis is a monthly Recurring Plan that will charge your credit card today and on a monthly basis. \nRecurring Plans are for personal use only, not intended for commercial use.\nYour License Plate will be used for redemptions. \nPlease ensure that the License Plate entered is correct.\nProduct SKU: 449922'
    ],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppAssets.backgroundColor,
      appBar: whiteCustomAppBar(title: 'Supreme Monthly Plan'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _basicPlanItems.length,
                itemBuilder: (context, index) {
                  return CustomPlanWidget(
                    packageName: _basicPlanItems[index][0],
                    packagePrice: _basicPlanItems[index][1],
                    packageImagePath: _basicPlanItems[index][2],
                    packageDescription: _basicPlanItems[index][3],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
