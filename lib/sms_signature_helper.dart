import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class SmsSignatureHelper {
  static const MethodChannel _channel =
      const MethodChannel('sms_signature_helper');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get signature async {
    if (Platform.isAndroid) {
      final String signature =
          await _channel.invokeMethod('getSignature');
      return signature;
    } else {
      return null;
    }
  }
}
