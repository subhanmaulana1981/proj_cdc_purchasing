import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/models/purchase_request.dart';
import 'package:proj_cdc_purchasing/models/purchase_request_details.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class PurchaseRequestDetailsForm extends StatefulWidget {
  const PurchaseRequestDetailsForm({super.key});

  @override
  State<PurchaseRequestDetailsForm> createState() => _PurchaseRequestDetailsFormState();
}

class _PurchaseRequestDetailsFormState extends State<PurchaseRequestDetailsForm> {
  // data sample request purchase
  final List<PurchaseRequest> _listPurchaseRequest = <PurchaseRequest>[
    PurchaseRequest(
      requestCode: "1",
      date: "2023-07-01",
      subject: "service ac",
      branchCode: "PST",
      requestor: "Fahmi",
      signature: "",
      keterangan: "",
    ),

    PurchaseRequest(
      requestCode: "2",
      date: "2023-07-02",
      subject: "service mobil",
      branchCode: "CAB",
      requestor: "Rohmat",
      signature: "",
      keterangan: "",
    ),

    PurchaseRequest(
      requestCode: "3",
      date: "2023-07-03",
      subject: "beli dispenser",
      branchCode: "PST",
      requestor: "Budi",
      signature: "",
      keterangan: "",
    ),
  ];

  // purhcase request details
  List<PurchaseRequestDetails> _listPurchaseRequestDetails = <PurchaseRequestDetails>[
    PurchaseRequestDetails(
      requestCode: "1",
      itemOrServiceName: "service ac",
      itemOrServiceType: "jasa",
      categoryName: "jasa service ac",
      qty: 1,
      unit: "unit",
      keterangan: "",
    ),

    PurchaseRequestDetails(
      requestCode: "2",
      itemOrServiceName: "service mobil",
      itemOrServiceType: "jasa",
      categoryName: "jasa service mobil",
      qty: 1,
      unit: "unit",
      keterangan: "mobil operasional",
    ),

    PurchaseRequestDetails(
      requestCode: "3",
      itemOrServiceName: "beli dispenser",
      itemOrServiceType: "barang",
      categoryName: "perlengkapan kantor",
      qty: 1,
      unit: "unit",
      keterangan: "",
    ),
  ];

  // controller(s)
  final TextEditingController _controllerRequestSubject = TextEditingController();
  final TextEditingController _controllerRequestNumber = TextEditingController();
  final TextEditingController _controllerRequestDate = TextEditingController();
  final TextEditingController _controllerBranchCode = TextEditingController();
  final TextEditingController _controllerRequestor = TextEditingController();
  final TextEditingController _controllerKeterangan = TextEditingController();

  // signature pad
  final GlobalKey<SfSignaturePadState> _globalKeySignature = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final purchaseRequest = ModalRoute.of(context)!.settings.arguments as PurchaseRequest;
    if(purchaseRequest.requestCode!.isNotEmpty) {
      _controllerRequestSubject.text = purchaseRequest.subject.toString();
      _controllerRequestNumber.text = purchaseRequest.requestCode.toString();
      _controllerRequestDate.text = purchaseRequest.date.toString();
      _controllerBranchCode.text = purchaseRequest.branchCode.toString();
      _controllerRequestor.text = purchaseRequest.requestor.toString();
      _controllerKeterangan.text = purchaseRequest.keterangan.toString();
    }

    _listPurchaseRequestDetails = _listPurchaseRequestDetails.where((PurchaseRequestDetails purchaseRequestDetails) {
      return purchaseRequestDetails.requestCode == purchaseRequest.requestCode;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Request | details"),
        elevation: 8.0,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: <Widget>[
            // form header
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      // title
                      Text(
                        "Request",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      // subjek
                      TextFormField(
                        controller: _controllerRequestSubject,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Subjek request"),
                          labelText: "Subjek request",
                          hintText: "Masukkan subjek request",
                          prefixIcon: Icon(Icons.title),
                          filled: true,
                        ),
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      // nomor request
                      TextFormField(
                        controller: _controllerRequestNumber,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Nomor request"),
                          labelText: "Nomor request",
                          hintText: "Nomor request [auto]",
                          prefixIcon: Icon(Icons.numbers),
                          filled: true,
                        ),
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      // tanggal request
                      TextFormField(
                        controller: _controllerRequestDate,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Tanggal request"),
                          labelText: "Tanggal request",
                          hintText: "Tanggal request [auto]",
                          prefixIcon: Icon(Icons.calendar_month),
                          filled: true,
                        ),
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      // kode cabang
                      TextFormField(
                        controller: _controllerBranchCode,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Kode cabang"),
                          labelText: "Kode cabang",
                          hintText: "Pilih cabang",
                          prefixIcon: Icon(Icons.numbers),
                          suffixIcon: Icon(Icons.search),
                          filled: true,
                        ),
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      // requestor
                      TextFormField(
                        controller: _controllerRequestor,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Requestor"),
                          labelText: "Requestor",
                          hintText: "Nama requestor",
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(Icons.search),
                          filled: true,
                        ),
                        obscureText: false,
                      ),

                      const SizedBox(
                        height: 8.0,
                      ),

                      // keterangan
                      TextFormField(
                        controller: _controllerKeterangan,
                        // initialValue: "",
                        decoration: const InputDecoration(
                          // label: Text("Requestor"),
                          labelText: "Keterangan",
                          hintText: "Keterangan",
                          prefixIcon: Icon(Icons.info),
                          // suffixIcon: Icon(Icons.search),
                          filled: true,
                        ),
                        obscureText: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // title
            Text(
              "Details",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            // details
            ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.circle),
                  title: Text(_listPurchaseRequestDetails[index].itemOrServiceName.toString()),
                  subtitle: Text("Sebanyak ${_listPurchaseRequestDetails[index].qty.toString()} ${_listPurchaseRequestDetails[index].unit}"),
                  trailing: Text(_listPurchaseRequestDetails[index].itemOrServiceType.toString()),
                  tileColor: (index.isEven) ? Colors.orange[100] : Colors.transparent,
                );
              },
              itemCount: _listPurchaseRequestDetails.length,
            ),

            // title
            Text(
              "Approval",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            // signature pad
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFEF5350),
                      width: 0.5,
                    ),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: SfSignaturePad(
                    key: _globalKeySignature,
                  ),
                ),
                Text(
                  "Tanda tangan  di atas untuk menyetujui",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                ButtonBar(
                  children: <TextButton>[
                    TextButton(
                      onPressed: () {
                        _globalKeySignature.currentState!.clear();
                      },
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              ],
            ),

            // tombol operasi
            ButtonBar(
              children: <ElevatedButton>[
                // approved
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
                              Text("Setujui permintaan ini?"),
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
                                Navigator.pop(context);
                              },
                              child: const Text("Ya"),
                            ),
                          ],

                        );
                      },
                    );
                  },
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.approval),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("Approve"),
                    ],
                  ),
                ),

                // not approved
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: <Widget>[
                      Icon(Icons.cancel),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("Not Approve"),
                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
