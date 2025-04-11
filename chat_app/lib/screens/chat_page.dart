import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  TextEditingController controller = TextEditingController();
  // ignore: non_constant_identifier_names
  final scroll_controller = ScrollController();
  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kLogo, height: 50),
              SizedBox(width: 10),
              Text('Scholar Chat', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: scroll_controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email ? ChatBubble(message: messagesList[index]) : ChatBubbleFromFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                BlocProvider.of<ChatCubit>(context).sendMessage(message: value, email: email.toString());
                controller.clear();
                scroll_controller.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  color: kPrimaryColor,
                ),
                enabledBorder: borderBuilder(),
                border: borderBuilder(),
                focusedBorder: borderBuilder(),
              ),
            ),
          )
        ],
      ),
    );
  }

  OutlineInputBorder borderBuilder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: kPrimaryColor),
    );
  }
}
