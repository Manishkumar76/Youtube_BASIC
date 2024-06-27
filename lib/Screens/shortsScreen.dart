

import 'package:flutter/material.dart';

class ShortScreen extends StatefulWidget {
  const ShortScreen({super.key});

  @override
  State<ShortScreen> createState() => _ShortScreenState();
}

class _ShortScreenState extends State<ShortScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text("this is Short screen"),));
  }
}
