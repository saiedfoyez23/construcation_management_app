import 'package:construction_management_app/modules/company_user/subscription/controller/subscription_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuySubscriptionView extends StatefulWidget {
  const BuySubscriptionView({super.key,required this.paymentUrl});
  final String paymentUrl;
  @override
  State<BuySubscriptionView> createState() => _BuySubscriptionViewState();
}

class _BuySubscriptionViewState extends State<BuySubscriptionView> {
  late final WebViewController _controller;
  final SubscriptionController subscriptionController = Get.put(SubscriptionController());

  @override
  void initState() {
    super.initState();
    // Initialize WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            // Show loading indicator if needed
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            // Page loaded
            print('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            // Handle errors
            print('Error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) async {
            print("hello ${request.url}");
            //Handle redirects or specific URLs (e.g., success/failure callbacks)
            await subscriptionController.getPaymentDetailsController(paymentConfirm: request.url);
            if (request.url.contains('success') || request.url.contains('failure')) {
              //Handle payment result
              //_handlePaymentResult(request.url);

              return NavigationDecision.prevent; // Prevent navigation in WebView
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl)); // Load the Paymob URL
  }

  // Handle payment result based on redirect URL
  // void _successPage({required PaymentSuccessFullResponse paymentSuccessFullResponse}) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentConfirmationScreen(paymentSuccessFullResponse: paymentSuccessFullResponse)));
  // }


  // void _failedPage() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>SubscriptionScreen()));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
