import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/otentikasi/otentikasi.dart';
import 'package:proj_cdc_purchasing/screens/beranda/beranda.dart';
import 'package:proj_cdc_purchasing/screens/purchasing/request/purchase_request_details_form.dart';
import 'package:proj_cdc_purchasing/screens/purchasing/request/purchase_request_form.dart';
import 'package:proj_cdc_purchasing/wrapper.dart';

class AppKrida extends StatelessWidget {
  const AppKrida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const Wrapper(),
      routes: {
        "/": (context) {
          return Wrapper();
        },

        "/otentikasi": (context) {
          return const Otentikasi();
        },

        "/beranda": (context) {
          return const Beranda();
        },

        "/purchaseRequestForm": (context) {
          return const PurchaseRequestForm();
        },

        "/purchaseRequestDetailsForm": (context) {
          return const PurchaseRequestDetailsForm();
        },
      },
      initialRoute: "/",
      title: "Krida | Purchasing",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
    );
  }
}
