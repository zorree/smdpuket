import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/order_transaction_head.dart';
import '../model/order_transaction_head_response.dart';
import '../model/que_display.dart';
import 'app_exception.dart';

class ApiProvider {
  
/* final  Dio dio = Dio(BaseOptions(
    baseUrl: "http://192.168.15.245:3333/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
)); */
  // Set default configs
  
  //final String _baseUrl = 'http://192.168.15.245:3333';
  //final String strDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //final String _baseUrl = 'http://192.168.1.153:3333';
  //final String strDate = "2020-02-03";
  //final String strDate = "2020-03-11";
  //String address = '192.168.100.3:3333';
  String address = '192.168.15.245:3333';
  Map<String, String> headers = {"Content-type": "application/json"};

  Future<List<QueDisplay>> getQueue(String queueQuery,int orderStart,int queueCount) async {
    if (!(orderStart>1)){
        orderStart = 1;
      }
      if (queueCount>50){
        queueCount = 50;
      }
      var params;
      if (queueQuery==''){
        params = {
        'is_urgent':'true',
        'status': 'waiting',
        //'order_date':'$strDate',
        'today': 'true',
        'sort': 'global_que',
        'order_start': orderStart.toString(),
        'per_page': queueCount.toString()
        };      
      }else{
        params = {
        'internal_que':queueQuery,
        'status': 'waiting',
        //'order_date':'$strDate',
        'today': 'true',
        'sort': 'internal_que',
        'order_start': orderStart.toString(),
        'per_page': queueCount.toString()
        };      
      }
      String url='/api/ordertransactionheads/getlist';
      var uri = Uri.http(address,url, params);
      //print(uri.toString());
    try {
      //Response response = await dio.get('/ordertransactionheads/getlist', queryParameters:params);
      final response = await http.get(uri,headers: headers);
      final data = _returnResponse(response);
      //print("data");
      //print(data.runtimeType.toString());
      //print(data);
      //final data = jsonDecode(response.data);
      //print(response.data.toString());
      List<QueDisplay> listModel = [];
      //print(response.data);
      for(Map i in data){
          OrderTransactionHead _item = OrderTransactionHead.fromJson(i);
          QueDisplay queDisplay = new QueDisplay();
          queDisplay.id = _item.order_number;
          queDisplay.prefix = _item.internal_que.length > 0 ? _item.internal_que.substring(0, 1) : '0';
          queDisplay.rxq = _item.internal_que.length > 0 ? '#'+_item.internal_que : ('0000'+_item.global_que).substring(('0000'+_item.global_que).length-4);
          queDisplay.visitq = _item.internal_que.length > 0 ? _item.global_que : ('0000'+_item.global_que).substring(('0000'+_item.global_que).length-4);
          queDisplay.orderDate = _item.order_date;
          queDisplay.patient = _item.patient;
          queDisplay.orderState = _item.orderState;
          queDisplay.isLabel = false;
          listModel.add(queDisplay);
      }
      listModel.sort((a, b) => a.rxq.compareTo(b.rxq));
      return listModel;
    } catch (error) {
      //debugPrint('$error');
      //print(error.runtimeType.toString());
      return [];
    }
  }

  Future<int> getTotalCount() async {
    var params = {
        //'order_date':'$strDate',
        'today': 'true',
        }; 
    String url='/api/ordertransactionheads/getcount';
    var uri = Uri.http(address,url, params);
    try {
           
      //final response = await dio.get('/ordertransactionheads/getcount', queryParameters:params);
      //print(response);
      final response = await http.get(uri,headers: headers);
      final data = _returnResponse(response);
      //print(data.runtimeType.toString());
      return data;
    } catch (error) {
      //debugPrint('$error');
      //print(error.runtimeType.toString());
      return -1;
    }
  }

  Future<int> getWaitingCount() async {
    var params = {
        'status': 'waiting',
        //'order_date':'$strDate',
        'today': 'true',
    }; 
    String url='/api/ordertransactionheads/getcount';
    var uri = Uri.http(address,url, params);
    try {
      //final response = await dio.get('/ordertransactionheads/getcount', queryParameters:params);
      //print(response);
      final response = await http.get(uri,headers: headers);
      final data = _returnResponse(response);
      //print(data.runtimeType.toString());
      return data;
    } catch (error) {
      //debugPrint('$error');
      //print(error.runtimeType.toString());
      return -1;
    }
  }

  Future<OrderTransactionHeadResponse> getOrderTransactionHeadResponse(int displayItems,int page) async {
    var params = {
      //'order_date':'$strDate',
      'today': 'true',
      'status': 'inprocess',
      'perPage': '$displayItems',
      'sort': 'order_number',
      'page': page
    };
    String url='/api/ordertransactionheads';
    var uri = Uri.http(address,url, params);
    try {
    //  final response = await dio.get('/ordertransactionheads', queryParameters:params);
    //  return OrderTransactionHeadResponse.fromJson(response.data);
      final response = await http.get(uri,headers: headers);
      final data = _returnResponse(response);
      return data;
    } catch (error) {
      //debugPrint('$error');
      //print(error.runtimeType.toString());
      return OrderTransactionHeadResponse.withError('$error');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
  
}