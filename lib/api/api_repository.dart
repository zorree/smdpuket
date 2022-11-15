

import '../model/order_transaction_head_response.dart';
import '../model/que_display.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<QueDisplay>> fetchQueue(String queuePrefix,int orderStart,int queueCount) => _apiProvider.getQueue(queuePrefix,orderStart,queueCount);
  Future<int> fetchTotalCount() => _apiProvider.getTotalCount();
  Future<int> fetchWaitingCount() => _apiProvider.getWaitingCount();
  Future<OrderTransactionHeadResponse> fetchOrderTransactionHeadResponse(int displayItems,int page) => _apiProvider.getOrderTransactionHeadResponse(displayItems,page);
}