import 'package:chat_bot_flutter/src/core/theme/colors.dart';
import 'package:chat_bot_flutter/src/core/utils/assets.dart';
import 'package:chat_bot_flutter/src/core/widgets/primary_input_form_field.dart';
import 'package:chat_bot_flutter/src/core/widgets/primary_snackbar.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/riverpods/messge_provider.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InboxPage extends ConsumerStatefulWidget {
  const InboxPage({super.key});

  @override
  ConsumerState<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends ConsumerState<InboxPage> {
  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(messageProvider.notifier);

    ref.listen(messageProvider, (previous, next) {
      if (next.status.isFailure) {
        ShowSnackBarMessage.showErrorSnackBar(
          message: 'Something is went wong',
          context: context,
        );
      }
      if (next.status.isSuccess) {
        setState(() {});
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  Assets.chatGpt,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ChatGPT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.green,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Text(
                          'Online',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Flexible(
            child: MessageWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextFormField(
              controller: notifier.myQuery,
              textAlignVertical: TextAlignVertical.top,
              cursorColor: Colors.blue,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 5, 1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffix: SizedBox(
                  width: MediaQuery.of(context).size.width * .1,
                  child: notifier.myQuery.text.isNotEmpty
                      ? IconButton(
                          onPressed: notifier.sendQuery,
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                            size: 20,
                          ),
                        )
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic_none_rounded,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
