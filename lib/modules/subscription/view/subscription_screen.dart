import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/custom_widget/custom_button_widget.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:construction_management_app/modules/subscription/view/buy_subscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlan =
      0; // Tracks the selected plan (0 for Basic, 1 for Pro, 2 for Premium)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Subscription',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: "Upgrade plan",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.linerColor,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              title: "Choose a subscription plan",
              fontSize: 16,
              color: AppColors.lightGray,
            ),
            SizedBox(height: 20),
            // Basic Plan
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPlan = 0;
                });
              },
              child: Card(
                color: _selectedPlan == 0 ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Basic Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: _selectedPlan == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '(1-10 Users)',
                    style: TextStyle(
                      fontSize: 15,
                      color: _selectedPlan == 0 ? Colors.white70 : Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '\$49.99 /month',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedPlan == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Pro Plan
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPlan = 1;
                });
              },
              child: Card(
                color: _selectedPlan == 1 ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Pro Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: _selectedPlan == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '(11-50 Users)',
                    style: TextStyle(
                      fontSize: 15,
                      color: _selectedPlan == 1 ? Colors.white70 : Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '\$99.99 /month',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedPlan == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Premium Plan
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPlan = 2;
                });
              },
              child: Card(
                color: _selectedPlan == 2 ? Colors.blue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    'Premium Plan',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: _selectedPlan == 2 ? Colors.white : Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '(51+ Users)',
                    style: TextStyle(
                      fontSize: 15,
                      color: _selectedPlan == 2 ? Colors.white70 : Colors.grey,
                    ),
                  ),
                  trailing: Text(
                    '\$199.99 /month',
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedPlan == 2 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CustomButtonWidget(
              onTap: () {
                Get.to(() => BuySubscription());
              },
              title: "Buy Now",
              cardColor: AppColors.black,
              borderRadius: BorderRadius.circular(20),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
