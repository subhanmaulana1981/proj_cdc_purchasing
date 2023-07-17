import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/otentikasi/sign_in.dart';
import 'package:proj_cdc_purchasing/otentikasi/sign_up.dart';
import 'package:proj_cdc_purchasing/screens/beranda/beranda.dart';

class Otentikasi extends StatefulWidget {
  const Otentikasi({super.key});

  @override
  State<Otentikasi> createState() => _OtentikasiState();
}

class _OtentikasiState extends State<Otentikasi> {
  bool goToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Krida | Otentikasi"),
        actions: <Widget>[
          Text(
            (goToggle == false)
              ? "Belum punya akun?"
              : "Sudah punya akun?"
          ),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                goToggle = !goToggle;
              });
            },
            icon: (goToggle == false)
              ? const Icon(Icons.app_registration)
              : const Icon(Icons.login),
            tooltip: (goToggle == false)
              ? "Daftar di sini"
              : "Masuk di sini",
          ),
        ],
        elevation: 8.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        physics: const ScrollPhysics(),
        child: (goToggle == false)
          ? const SignIn()
          : const SignUp(),
      ),
    );
  }
}
