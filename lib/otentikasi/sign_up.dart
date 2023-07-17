import 'dart:io';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // controller(s)
  final TextEditingController _controllerUserID = TextEditingController();
  final TextEditingController _controllerPwd = TextEditingController();
  final TextEditingController _controllerPwdAgain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // form
        Form(
          child: Column(
            children: <Widget>[
              // logo
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/gambars/krida-lombok-logo.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                width: 256,
                height: 128,
                margin: EdgeInsets.all(8.0),
              ),

              // user id
              TextFormField(
                controller: _controllerUserID,
                decoration: const InputDecoration(
                  labelText: "User ID",
                  prefixIcon: Icon(Icons.person),
                  hintText: "Masukkan user id",
                  filled: true,
                ),
                obscureText: false,
              ),

              const SizedBox(
                height: 16.0,
              ),

              // password
              TextFormField(
                controller: _controllerPwd,
                decoration: const InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.key),
                  hintText: "Masukkan password",
                  filled: true,
                ),
                obscureText: true,
              ),

              const SizedBox(
                height: 8.0,
              ),

              // password lagi
              TextFormField(
                controller: _controllerPwdAgain,
                decoration: const InputDecoration(
                  labelText: "Password lagi",
                  prefixIcon: Icon(Icons.key),
                  hintText: "Masukkan password lagi",
                  filled: true,
                ),
                obscureText: true,
              ),

            ],
          ),
        ),

        // button operasi
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: <ElevatedButton>[
            // ke luar aplikasi
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      icon: const Icon(Icons.question_mark),
                      title: const Text("Konfirmasi"),
                      content: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Text>[
                          Text("Ke luar dari aplikasi?"),
                        ],
                      ),
                      actions: <TextButton>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: const Text("Ya"),
                        ),

                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    );
                  },
                );
              },
              child: const Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text("Ke luar"),
                ],
              ),
            ),

            // daftar aplikasi
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  "/beranda",
                );
              },
              child: const Row(
                children: <Widget>[
                  Icon(Icons.app_registration),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text("Daftar"),
                ],
              ),
            ),

          ],
        ),

      ],
    );
  }
}
