import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final MessageModel message;

  const ChatBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20), topEnd: Radius.circular(20), bottomEnd: Radius.circular(20))),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class ChatBubbleFromFriend extends StatelessWidget {
  final MessageModel message;

  const ChatBubbleFromFriend({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(color: kSecondaryColor, borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(20), topEnd: Radius.circular(20), bottomStart: Radius.circular(20))),
        child: Text(
          message.message,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
