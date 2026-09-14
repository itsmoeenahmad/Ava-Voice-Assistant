import 'package:flutter/material.dart';

import 'text.dart';

void showMessage(BuildContext context, Object? data) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: text(
        data: data?.toString() ?? '',
        fw: FontWeight.bold,
        fs: 20,
        col: const Color(0xff272727)),
    backgroundColor: const Color(0xffF3F3F3),
  ));
}
