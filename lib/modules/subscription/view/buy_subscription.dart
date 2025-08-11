import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/subscription/view/payment_success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuySubscription extends StatefulWidget {
  const BuySubscription({super.key});

  @override
  State<BuySubscription> createState() => _BuySubscriptionState();
}

class _BuySubscriptionState extends State<BuySubscription> {
  int _selectedCardIndex = -1; // Tracks the selected card

  // Sample card data
  final List<Map<String, String>> cards = [
    {'bank': 'Axis Bank', 'type': 'Mastercard', 'lastFour': '8395'},
    {'bank': 'HDFC Bank', 'type': 'Visa', 'lastFour': '0246'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: CustomTextWidget(
          title: "Buy Subscription",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: "Credit & Debit Cards",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            SizedBox(height: 16),
            // Card List
            Expanded(
              child: ListView.builder(
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedCardIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCardIndex = index; // Update selected card
                      });
                    },
                    child: Card(
                      color: isSelected ? Colors.blue[50] : Colors.white,
                      elevation: 2,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            // Card Icon (Placeholder for Mastercard/Visa logo)
                            Icon(
                              cards[index]['type'] == 'Mastercard'
                                  ? Icons.credit_card
                                  : Icons.payment,
                              size: 35,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 16),
                            // Card Details
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    cards[index]['bank']!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '**** **** **** ${cards[index]['lastFour']}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            // Radio Button for Selection
                            Radio<int>(
                              value: index,
                              groupValue: _selectedCardIndex,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCardIndex = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Total and Pay Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        title: "Total \$65.00",
                        fontSize: 18,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        title: "View Detalis dil",
                        fontSize: 16,
                        color: AppColors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  CustomButtonWidget(
                    onTap: () {
                      Get.to(() => PaymentSuccess());
                    },
                    title: "Proceed to Pay",
                    cardColor: AppColors.black,
                    width: 170,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    borderRadius: BorderRadius.circular(22),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
