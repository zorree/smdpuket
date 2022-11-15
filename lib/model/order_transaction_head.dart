import 'package:intl/intl.dart';
import 'order_state.dart';
import 'patient.dart';

class OrderTransactionHead{
  BigInt order_number;
  String hn;
  DateTime nextdate;
  DateTime nexttime;
  String global_que;
  DateTime order_date;
  DateTime order_time;
  String doctor;
  String clinic;
  String rf_id;
  String internal_que;
  String order_cancel;
  DateTime checkindate;
  DateTime checkintime;
  DateTime checkoutdate;
  DateTime checkouttime;
  String vn;
  BigInt lock_pay_station;
  String pay;
  String station_called;
  String finance_number;
  DateTime payout_date;
  DateTime payout_time;
  DateTime visitdate;
  DateTime visittime;
  BigInt lock_pay_wait;
  int item_cat;
  BigInt checklot;
  BigInt tickcount;
  DateTime ticktime;
  Patient patient;
  OrderState orderState;
  String error;

  OrderTransactionHead.withError(this.error);
  OrderTransactionHead({
        this.order_number,
        this.hn,
        this.nextdate,
        this.nexttime,
        this.global_que,
        this.order_date,
        this.order_time,
        this.doctor,
        this.clinic,
        this.rf_id,
        this.internal_que,
        this.order_cancel,
        this.checkindate,
        this.checkintime,
        this.checkoutdate,
        this.checkouttime,
        this.vn,
        this.lock_pay_station,
        this.pay,
        this.station_called,
        this.finance_number,
        this.payout_date,
        this.payout_time,
        this.visitdate,
        this.visittime,
        this.lock_pay_wait,
        this.item_cat,
        this.checklot,
        this.tickcount,
        this.ticktime,
        this.patient,
        this.orderState
      });
  factory OrderTransactionHead.fromJson(Map<String, dynamic> parsedJson){
    return OrderTransactionHead(
        order_number: BigInt.parse(parsedJson['order_number']),
        hn: parsedJson['hn'],
        nextdate: parsedJson['nextdate'] != null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['nextdate']):null,
        nexttime: parsedJson['nexttime'] != null ? DateFormat('hh:mm:ss').parse(parsedJson['nexttime']):null,
        global_que: parsedJson['global_que'],
        order_date: parsedJson['order_date'] != null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['order_date']):null,
        order_time: parsedJson['order_time'] != null ? DateFormat('hh:mm:ss').parse(parsedJson['order_time']):null,
        doctor: parsedJson['doctor'],
        clinic: parsedJson['clinic'],
        rf_id: parsedJson['rf_id'],
        internal_que: parsedJson['internal_que'],
        order_cancel: parsedJson['order_cancel'],
        checkindate: parsedJson['checkindate'] != null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['checkindate']):null,
        checkintime: parsedJson['checkintime'] != null ? DateFormat('hh:mm:ss').parse(parsedJson['checkintime']):null,
        checkoutdate: parsedJson['checkoutdate'] != null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['checkoutdate']):null,
        checkouttime: parsedJson['checkouttime'] != null ? DateFormat('hh:mm:ss').parse(parsedJson['checkouttime']):null,
        vn: parsedJson['vn'],
        lock_pay_station: parsedJson['lock_pay_station']!=null?BigInt.parse(parsedJson['lock_pay_station']):null,
        pay: parsedJson['pay'],
        station_called: parsedJson['station_called'],
        finance_number: parsedJson['finance_number'],
        payout_date: parsedJson['payout_date'] != null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['payout_date']):null,
        payout_time: parsedJson['payout_time'] != null ? DateFormat('hh:mm:ss').parse(parsedJson['payout_time']):null,
        visitdate: parsedJson['visitdate']!=null?DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['visitdate']):null,
        visittime: parsedJson['visittime']!=null?DateFormat('hh:mm:ss').parse(parsedJson['visittime']):null,
        lock_pay_wait: parsedJson['lock_pay_wait'] != null ? BigInt.parse(parsedJson['lock_pay_wait']):null,
        item_cat: parsedJson['item_cat'],
        checklot: parsedJson['checklot']!= null ? BigInt.parse(parsedJson['checklot']):null,
        tickcount: parsedJson['tickcount']!= null ? BigInt.parse(parsedJson['tickcount']):null,
        ticktime: parsedJson['ticktime']!=null?DateFormat('yyyy-MM-dd hh:mm:ss').parse(parsedJson['ticktime']):null,
        patient: Patient.fromJson(parsedJson['patient']) ,
        orderState:OrderState.fromJson(parsedJson['orderState']) ,

    );
  }
  
}

