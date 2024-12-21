import 'package:flutter/material.dart';
import 'package:voiceassistant/Frontend%20Code/Reusable%20Widgets/text.dart';

showMessage(
  context,
    data,
) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: text(
        data: data,
        fw: FontWeight.bold,
        fs: 20,
        col: const Color(0xff272727)),
    backgroundColor: const Color(0xffF3F3F3),
  ));
}
