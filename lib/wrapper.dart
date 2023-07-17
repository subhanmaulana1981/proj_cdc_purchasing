import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/otentikasi/otentikasi.dart';
import 'package:proj_cdc_purchasing/screens/beranda/beranda.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late String? penggunaID = "";

  @override
  Widget build(BuildContext context) {
    return (penggunaID == "") ? Otentikasi() : Beranda();
  }
}
