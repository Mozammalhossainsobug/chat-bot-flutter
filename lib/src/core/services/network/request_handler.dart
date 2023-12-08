import 'package:chat_bot_flutter/src/core/utils/loggers/logger.dart';
import 'package:chat_bot_flutter/src/core/services/network/error_model.dart';
import 'package:flutter_network/flutter_network.dart';

extension FutureResponseExtension on Future<Response> {
  Future<(String, T?)> guard<T>(T Function(dynamic) parse) async {
    try {
      final response = await this;
      return ('', parse(response.data));
    } catch (e, stacktrace) {
      Log.error(e.toString());
      Log.error(stacktrace.toString());
      final errorModel = ErrorModel.fromJson((e as Failure).error);
      return (errorModel.message, null);
    }
  }
}
