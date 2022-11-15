import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_repository.dart';
import '../model/order_transaction_head_response.dart';

abstract class OrderTransactionHeadResponseState {}

class OrderTransactionHeadResponseInitial extends OrderTransactionHeadResponseState {}

class OrderTransactionHeadResponseLoading extends OrderTransactionHeadResponseState {}

class OrderTransactionHeadResponseFailure extends OrderTransactionHeadResponseState {
  final String errorMessage;

  OrderTransactionHeadResponseFailure(this.errorMessage);
}

class OrderTransactionHeadResponseLoaded extends OrderTransactionHeadResponseState {
  final OrderTransactionHeadResponse orderTransactionHeadResponse;

  OrderTransactionHeadResponseLoaded(this.orderTransactionHeadResponse);
}

class OrderTransactionHeadResponseEvent {
  int displayItems;
  int page;
  OrderTransactionHeadResponseEvent(this.displayItems,this.page);
}

class OrderTransactionHeadResponseBloc extends Bloc<OrderTransactionHeadResponseEvent, OrderTransactionHeadResponseState> {
  final ApiRepository _apiRepository = ApiRepository();

  @override
  OrderTransactionHeadResponseState get initialState => OrderTransactionHeadResponseInitial();

  @override
  Stream<OrderTransactionHeadResponseState> mapEventToState(OrderTransactionHeadResponseEvent event) async* {
    yield OrderTransactionHeadResponseLoading();

    OrderTransactionHeadResponse orderTransactionHeadResponse = await _apiRepository.fetchOrderTransactionHeadResponse(event.displayItems,event.page);
    if (orderTransactionHeadResponse.error != null) {
      yield OrderTransactionHeadResponseFailure(orderTransactionHeadResponse.error);
      return;
    }
    yield OrderTransactionHeadResponseLoaded(orderTransactionHeadResponse);
  }

}