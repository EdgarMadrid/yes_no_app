import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_app/domain/entities/message.dart";
import "package:yes_no_app/presentation/providers/chat_provider.dart";
import "package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_app/presentation/widgets/shared/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://scontent.feoh1-1.fna.fbcdn.net/v/t39.30808-6/357116220_3533367970280199_7207953951193989383_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEu7-3jNg7NvRjcC3hRVmoZwo218UC39EvCjbXxQLf0S9o09N0IX_cfWoam05KVUZT7Hi1QWjRgypW5uIUKp16k&_nc_ohc=2vrKRUe_R4kAX-3gO9x&_nc_ht=scontent.feoh1-1.fna&oh=00_AfCdw3g7f3mfR4_oHXEg9lzFjF7vq0orwB-Zxd6V0flB3Q&oe=64BF43F0'),
          ),
        ),
        title: const Text('Cariño'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBubble(message: message);
                },
              ),
            ),

            // Caja de texto de mensajes
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
