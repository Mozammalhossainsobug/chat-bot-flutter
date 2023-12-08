import 'package:chat_bot_flutter/src/core/theme/theme.dart';
import 'package:chat_bot_flutter/src/core/theme/typography/fonts.dart';
import 'package:chat_bot_flutter/src/core/utils/assets.dart';
import 'package:flutter/material.dart';

class MessageThread extends StatelessWidget {
  MessageThread({
    required this.message,
    required this.isChatGPT,
    super.key,
  });
  bool isChatGPT;
  String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isChatGPT ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        isChatGPT
            ? Card(
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: isChatGPT ? Colors.white : UIColors.platinum,
                  child: isChatGPT
                      ? Image.asset(
                          Assets.chatGpt,
                          height: 20,
                          width: 20,
                        )
                      : Image.asset(
                          Assets.userImage,
                          height: 20,
                          width: 20,
                          color: UIColors.black,
                        ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .68,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: UIColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
        isChatGPT
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Container(
                  decoration: const BoxDecoration(
                    color: UIColors.antiFlashWhite,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width * .68,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      message,
                      style: const TextStyle(
                        color: UIColors.black,
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
