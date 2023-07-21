import 'package:flutter/material.dart';
import '../../domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Hola more', fromWho: FromWho.me),
    Message(text: 'Ya llegaste del trabajo', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    // todo: Implementar metodo
  }
}
