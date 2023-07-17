import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/screens/purchasing/request/purchase_request_form.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Krida | Purchasing"),
        actions: <IconButton>[
          // logout
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    icon: const Icon(Icons.question_mark),
                    title: const Text("Konfirmasi"),
                    content: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Yakin mau ke luar dari aplikasi?")
                      ],
                    ),
                    actions: <TextButton>[
                      // tidak
                      TextButton(
                        onPressed: () {},
                        child: const Text("Tidak"),
                      ),

                      // ya
                      TextButton(
                        onPressed: () {
                          /*Navigator.pushReplacementNamed(
                            context,
                            "/otentikasi",
                          );*/

                          /*Navigator.popAndPushNamed(
                            context,
                            "/otentikasi",
                          );*/

                          Navigator.popUntil(
                            context,
                            ModalRoute.withName("/"),
                          );

                        },
                        child: const Text("Ya"),
                      ),

                    ],
                    actionsAlignment: MainAxisAlignment.center,
                    elevation: 8.0,
                  );
                },
              );
            },
            tooltip: "Ke luar aplikasi",
            icon: const Icon(Icons.logout),
          ),
        ],
        elevation: 8.0,
      ),
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          // backImage
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/gambars/krida-lombok-background-2.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "(c) 2023 CDC | All rights reserved",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],

      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: ListView(
            children: <Widget>[
              // header
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/gambars/profile.png"),
                ),
                currentAccountPictureSize: Size.square(72.0),
                accountName: Text("Subhan Maulana"),
                accountEmail: Text("SubhanMaulana@cdc.com"),
              ),

              // purchasing
              ExpansionTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text("Purchasing"),
                subtitle: const Text("Pengadaan barang"),
                children: <Widget>[
                  // requesting
                  ExpansionTile(
                    title: const Text("Requesting"),
                    subtitle: const Text("Request purchasing"),
                    children: <Widget>[
                      // purchase request
                      ListTile(
                        title: const Text("Purchase request"),
                        subtitle: const Text("Request purchasing"),
                        onTap: () {},
                      ),
                      // request approvals
                      ListTile(
                        title: const Text("Approvals"),
                        subtitle: const Text("Request approvals"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const PurchaseRequestForm();
                              },
                            ),
                          );
                        },
                      ),

                    ],
                  ),

                  // purchase order
                  ExpansionTile(
                    title: const Text("Purchasing"),
                    subtitle: const Text("Purchasing order"),
                    children: <Widget>[
                      // purchase order
                      ListTile(
                        title: const Text("Purchase order"),
                        subtitle: const Text("Purchasing order"),
                        onTap: () {},
                      ),
                      // purchase return
                      ListTile(
                        title: const Text("Purchase return"),
                        subtitle: const Text("Purchasing returns"),
                        onTap: () {},
                      ),

                    ],
                  ),

                ],
              ),

              // pengaturan
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Pengaturan"),
                subtitle: const Text("Pengaturan aplikasi"),
                onTap: () {},
              ),

              // informasi
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text("Informasi"),
                subtitle: const Text("Tentang aplikasi"),
                onTap: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
