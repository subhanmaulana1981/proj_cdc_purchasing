
class PurchaseRequestDetails {
  // properti
  String? requestCode;
  String? itemOrServiceName;
  String? itemOrServiceType;
  String? categoryCode;
  String? categoryName;
  double? qty;
  String? unit;
  String? keterangan;

  // konstruktor
  PurchaseRequestDetails({
    this.requestCode,
    this.itemOrServiceName,
    this.itemOrServiceType,
    this.categoryCode,
    this.categoryName,
    this.qty,
    this.unit,
    this.keterangan,
  });
}