import 'package:chat_bot_flutter/src/core/utils/assets.dart';
import 'package:chat_bot_flutter/src/core/utils/loggers/logger.dart';
import 'package:chat_bot_flutter/src/core/widgets/primary_snackbar.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/riverpods/messge_provider.dart';
import 'package:chat_bot_flutter/src/features/inbox/presentation/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InboxPage extends ConsumerStatefulWidget {
  const InboxPage({super.key});

  @override
  ConsumerState<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends ConsumerState<InboxPage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      Log.debug(_lastWords);
    });
  }

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

    setState(() {
      notifier.myQuery.text = _lastWords;
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
                  child: notifier.myQuery.text.isNotEmpty &&
                          _speechToText.isNotListening
                      ? IconButton(
                          onPressed: notifier.sendQuery,
                          icon: const Icon(
                            Icons.send,
                            color: Colors.blue,
                            size: 20,
                          ),
                        )
                      : _speechToText.isListening
                          ? IconButton(
                              onPressed: () {
                                _stopListening();
                              },
                              icon: const Icon(
                                Icons.mic_none_rounded,
                                color: Colors.green,
                                size: 20,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                _initSpeech();
                                _startListening();
                                Log.debug('start listening');
                              },
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
