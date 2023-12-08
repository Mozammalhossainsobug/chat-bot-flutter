import 'package:chat_bot_flutter/src/features/inbox/presentation/riverpods/messge_provider.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/widgets/message_thread.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageWidget extends ConsumerStatefulWidget {
  const MessageWidget({super.key});

  @override
  ConsumerState<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends ConsumerState<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    final messageList = ref.watch(messageProvider.notifier).messageList;
    final state = ref.watch(messageProvider);

    if (state.status.isSuccess) {
      return ListView.builder(
        reverse: true,
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          bool isChatGPT = messageList[index].user == 'ChatGPT' ? true : false;
          return Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: MessageThread(
              message: messageList[index].message,
              isChatGPT: isChatGPT,
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        reverse: true,
        itemCount: messageList.length,
        itemBuilder: (context, index) {
          bool isChatGPT = messageList[index].user == 'ChatGPT' ? true : false;
          return Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: MessageThread(
              message: messageList[index].message,
              isChatGPT: isChatGPT,
            ),
          );
        },
      );
    }
  }
}
