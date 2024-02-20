import 'package:calender_picker/calender_picker.dart';
import 'package:canton/classes/app_assets.dart';
import 'package:canton/classes/custom_button.dart';
import 'package:canton/classes/custom_text.dart';
import 'package:canton/screens/home/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:time_range/time_range.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DateTime selectedValue = DateTime.now();
  DateTime dateTime = DateTime.now();

  int days = 10;
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
            SizedBox(
              height: Get.height * 0.20,
              child: Stack(
                children: [
                  Container(
                    height: Get.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.18,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                              color: AppAssets.primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset('assets/icons/jeep.png',
                                color: Colors.white70),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                                text: 'Big Car',
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                            CustomTextWidget(
                              text: 'Jeep / SUV',
                            ),
                            Row(
                              children: [
                                CustomTextWidget(text: '1 Hour -'),
                                CustomTextWidget(
                                    text: '\$18.00',
                                    fontWeight: FontWeight.w600),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: 'Date:',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  InkWell(
                    onTap: () => Get.bottomSheet(
                        SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.range,
                          view: DateRangePickerView.month,
                          onSelectionChanged: _onSelectionChanged,
                        ),
                        backgroundColor: Colors.white),
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0XFFEDF3FF),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.calendar_today,
                            color: Color(0XFF0342E9),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            CalenderPicker(
              dateTime,
              daysCount: days,
              // ignore: avoid_print
              enableMultiSelection: true,
              //  DateTime.now(),
              //  initialSelectedDate: DateTime.now(),
              selectionColor: AppAssets.primaryColor,
              selectedTextColor: Colors.white,
              height: 75,
              width: 60,

              onDateChange: (date) {
                // New date selected
                setState(() {
                  selectedValue = date;
                });
              },
            ),
            TimeRange(
              fromTitle: const Text(
                'From',
                style: TextStyle(fontSize: 18, color: AppAssets.greyColor),
              ),
              toTitle: const Text(
                '',
                style: TextStyle(fontSize: 0, color: AppAssets.greyColor),
              ),
              titlePadding: 20,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black87),
              activeTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
              borderColor: AppAssets.primaryColor,
              backgroundColor: Colors.transparent,
              activeBackgroundColor: Colors.red,
              firstTime: const TimeOfDay(hour: 09, minute: 00),
              lastTime: const TimeOfDay(hour: 20, minute: 00),
              timeStep: 60,
              timeBlock: 60,
              onRangeCompleted: (range) => setState(() => print(range)),
            ),
            const Spacer(),
            CustomButton(
              onTap: () {
                Get.to(() => const MyDemoPage());
              },
              color: AppAssets.primaryColor,
              text: 'BUY NOW',
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        dateTime = args.value.startDate;

        if (args.value.endDate != null) {
          different(first: args.value.startDate, last: args.value.endDate);
          // ignore: avoid_print
          print(args.value.startDate);
          // ignore: avoid_print
          print(args.value.endDate);
        }
      });
    }
  }

  different({DateTime? first, DateTime? last}) async {
    int data = last!.difference(first!).inDays;
    // ignore: avoid_print

    setState(() {
      data++;
      days = data;
      // ignore: avoid_print
      print(data);
    });
  }
}
