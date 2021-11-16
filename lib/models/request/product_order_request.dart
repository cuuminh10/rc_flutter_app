import 'package:gmc_app/models/response/favor_detail_reponse.dart';

class ProductOrderRequest {

  String description;
  List<DetailPO> listDetail;


  ProductOrderRequest({this.description, this.listDetail});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = description;
    data['detail'] = listDetail;
    return data;
  }
}

class DetailPO {
  int id;
  double qty;
  double cancelQty;
  double setUpQty;
  double ncrQty;

  DetailPO({this.id, this.qty, this.cancelQty, this.setUpQty, this.ncrQty});

  DetailPO.copyFromDetail(Detail detail) {
    id = detail.itemID;
    qty = detail.qty;
    cancelQty = detail.cancelQty;
    setUpQty = detail.setUpQty;
    ncrQty = detail.ncrQty;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['qty'] = qty;
    data['cancelQty'] = cancelQty;
    data['setUpQty'] = setUpQty;
    data['ncrQty'] = ncrQty;
    return data;
  }
}