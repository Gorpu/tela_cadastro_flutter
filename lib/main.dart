import 'package:flutter/material.dart';
import 'customer_cadastre/customer_cadastre_view.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomerCadastreView(),
    ),
  );
}
