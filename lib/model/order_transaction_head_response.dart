import 'order_transaction_head.dart';

class OrderTransactionHeadResponse {
  int total;
  int perPage;
  int page;
  int lastPage;
  List<OrderTransactionHead> data;
  String error;
  
OrderTransactionHeadResponse.withError(this.error);
OrderTransactionHeadResponse({this.total,this.perPage,this.page,this.lastPage,this.data});
OrderTransactionHeadResponse.fromJson(Map<String, dynamic> json){
    total = json['total'];
    perPage = json['perPage'];
    page = json['page'];
    lastPage = json['lastPage'];
    if (json['data'] != null) {
      data = new List<OrderTransactionHead>();
      json['data'].forEach((v) {
        data.add(new OrderTransactionHead.fromJson(v));
      });
    }
  }

  
}