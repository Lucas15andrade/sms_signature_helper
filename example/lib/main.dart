import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sms_signature_helper/sms_signature_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _signature;

  @override
  void initState() {
    super.initState();
    getSignatures();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> getSignatures() async {
    String signature;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      signature = await SmsSignatureHelper.signature;
    } catch(e) {
     print("Error: "+e.toString());
    }

    setState(() {
      _signature = signature;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example signature'),
        ),
        body: Center(
          child: Text('Signature: $_signature'),
        ),
      ),
    );
  }
}
