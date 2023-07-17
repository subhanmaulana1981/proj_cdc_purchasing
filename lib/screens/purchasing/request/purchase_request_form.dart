import 'package:flutter/material.dart';
import 'package:proj_cdc_purchasing/models/purchase_request.dart';

class PurchaseRequestForm extends StatefulWidget {
  const PurchaseRequestForm({super.key});

  @override
  State<PurchaseRequestForm> createState() => _PurchaseRequestFormState();
}

class _PurchaseRequestFormState extends State<PurchaseRequestForm> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Approval need(s)"),
        elevation: 8.0,
      ),
      body: Column(
        children: <Widget>[
          // pencarian

          // list approval need(s)
          ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.approval),
                  title: Text("No. request: ${_listPurchaseRequest[index].requestCode.toString()}"),
                  subtitle: Text(_listPurchaseRequest[index].subject.toString()),
                  trailing: Text(_listPurchaseRequest[index].date.toString()),
                  tileColor: (index.isEven) ? Colors.orange[100] : Colors.white,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      "/purchaseRequestDetailsForm",
                      arguments: PurchaseRequest(
                        subject: _listPurchaseRequest[index].subject.toString(),
                        requestCode: _listPurchaseRequest[index].requestCode.toString(),
                        date: _listPurchaseRequest[index].date.toString(),
                        branchCode: _listPurchaseRequest[index].branchCode.toString(),
                        requestor: _listPurchaseRequest[index].requestor.toString(),
                        signature: _listPurchaseRequest[index].signature.toString(),
                        keterangan: _listPurchaseRequest[index].keterangan.toString(),
                      ),
                    );
                  },
                ),
              );
            },
            itemCount: _listPurchaseRequest.length,
          ),

        ],
      ),
    );
  }
}
