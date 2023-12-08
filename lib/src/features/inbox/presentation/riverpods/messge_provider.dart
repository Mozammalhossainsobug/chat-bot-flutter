import 'package:chat_bot_flutter/src/core/base/state.dart';
import 'package:chat_bot_flutter/src/core/utils/loggers/logger.dart';
import 'package:chat_bot_flutter/src/features/inbox/domain/entities/MessageEntity.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'message_notifier.dart';

final messageProvider =
    NotifierProvider<MessageNotifier, BaseState>(MessageNotifier.new);
