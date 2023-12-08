import 'package:chat_bot_flutter/src/core/services/local_storage/cache_service.dart';
import 'package:chat_bot_flutter/src/core/services/network/api_end_points.dart';
import 'package:flutter_network/flutter_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkProvider = Provider(
  (ref) {
    return FlutterNetwork(
      baseUrl: API.base,
    );
  },
);
