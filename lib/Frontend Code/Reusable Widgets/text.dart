import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  final String data;
  final FontWeight fw;
  final double fs;
  final Color col;
  const text({super.key, required this.data, required this.fw, required this.fs,required this.col });

  @override
  Widget build(BuildContext context) {
    return Text(data,style: GoogleFonts.bricolageGrotesque(
        fontSize:fs,
        fontWeight: fw,
        color: col
    ),);
  }
}
