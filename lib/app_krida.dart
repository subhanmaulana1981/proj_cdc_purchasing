import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/screens/purchasing/request/purchase_request_details_form.dart';
import 'package:proj_cdc_purchasing/screens/purchasing/request/purchase_request_form.dart';
import 'package:proj_cdc_purchasing/wrapper.dart';

class AppKrida extends StatelessWidget {
  const AppKrida({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
      routes: {
        "/purchaseRequestForm": (context) {
          return PurchaseRequestForm();
        },

        "/purchaseRequestDetailsForm": (context) {
          return PurchaseRequestDetailsForm();
        },
      },
      title: "Krida | Purchasing",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
    );
  }
}
