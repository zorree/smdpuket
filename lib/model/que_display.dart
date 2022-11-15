
import 'order_state.dart';
import 'patient.dart';

class QueDisplay{
  BigInt id;
  int orderNo;
  String prefix;
  String rxq;
  String visitq;
  DateTime orderDate;
  Patient patient;
  OrderState orderState;
  bool isLabel = false;
  String labelName ;
  String labelColor;

  QueDisplay(
      {this.id, this.orderNo, this.prefix,this.rxq,this.visitq,
      this.orderDate, this.patient, this.orderState,
      this.isLabel, this.labelName});
}