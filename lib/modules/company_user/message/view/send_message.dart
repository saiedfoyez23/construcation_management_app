import 'package:construction_management_app/common/app_color/app_color.dart';
import 'package:construction_management_app/common/app_images/app_images.dart';
import 'package:construction_management_app/common/custom_widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Add intl package for formatting timestamps

class SendMessage extends StatefulWidget {
  const SendMessage({super.key});

  @override
  State<SendMessage> createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'sender': 'user',
        'text': text,
        'timestamp': DateFormat(
          'hh:mm a',
        ).format(DateTime.now()), // Add timestamp
      });
    });
    _controller.clear();
    _scrollToBottom();

    // Simulated bot response
    Future.delayed(Duration(milliseconds: 500), () {
      String reply = _getAutoReply(text);
      setState(() {
        _messages.add({
          'sender': 'bot',
          'text': reply,
          'timestamp': DateFormat(
            'hh:mm a',
          ).format(DateTime.now()), // Add timestamp
        });
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String _getAutoReply(String userMessage) {
    userMessage = userMessage.toLowerCase();
    if (userMessage.contains("hello")) {
      return "Hi there! How can I help you?";
    }
    if (userMessage.contains("help")) {
      return "Sure! What do you need help with?";
    }
    if (userMessage.contains("price")) {
      return "Prices vary depending on the product.";
    }
    if (userMessage.contains("bye")) {
      return "Goodbye!";
    }
    return "I'm just a simple bot. Ask me anything!";
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: CustomTextWidget(
          title: "Highway Bridge Project",
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.75,
                    ),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          isUser
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                      children: [
                        Text(message['text']!, style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Text(
                          message['timestamp']!,
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.white),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            IconButton(
              color: Colors.blue,
              onPressed: () {},
              icon: Image.asset(AppImages.solid, height: 20, width: 20),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 45,
                child: TextField(
                  controller: _controller,
                  onSubmitted: _sendMessage,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.gray),
                    ),
                    hintText: "Type a message",
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          _sendMessage(_controller.text.trim());
                        }
                      },
                      icon: Image.asset(AppImages.send, height: 18, width: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
