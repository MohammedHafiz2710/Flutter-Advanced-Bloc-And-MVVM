import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  List<MessageModel> messagesList = [];
  ChatCubit() : super(ChatInitial());
  CollectionReference messages = FirebaseFirestore.instance.collection(kMassagesCollection);
  void sendMessage({required String message, required String email}) {
    messages.add({
      'messages': message,
      'time': DateTime.now().microsecondsSinceEpoch,
      "id": email,
    });
  }

  void getMessages() {
    messages.orderBy("time", descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccess(messagesList: messagesList));
    });
  }
}
