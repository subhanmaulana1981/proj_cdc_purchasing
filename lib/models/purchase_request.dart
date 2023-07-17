
class PurchaseRequest {
  // properti
  String? subject;
  String? requestCode;
  String? date;
  String? branchCode;
  String? requestor;
  String? signature;
  String? keterangan;

  // konstruktor
  PurchaseRequest({
    this.subject,
    this.requestCode,
    this.date,
    this.branchCode,
    this.requestor,
    this.signature,
    this.keterangan,
  });
}