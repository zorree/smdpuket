import 'package:intl/intl.dart';
class Patient{
  String hn;
  String cid;
  String pname;
  String fname;
  String lname;
  String sex;
  DateTime birthday;
  String error;

  Patient.withError(this.error);
  Patient(
      {
        this.hn,
        this.cid,
        this.pname,
        this.fname,
        this.lname,
        this.sex,
        this.birthday});

  factory Patient.fromJson(Map<String, dynamic> parsedJson){
    return Patient(
        hn: parsedJson['hn'],
        cid: parsedJson['cid'],
        pname: parsedJson['pname'],
        fname: parsedJson['fname'],
        lname: parsedJson['lname'],
        sex: parsedJson['sex'],
        birthday: parsedJson['birthday']!=null ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(parsedJson['birthday']):null
    );
  }
}