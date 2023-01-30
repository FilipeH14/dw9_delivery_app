import 'package:bloc/bloc.dart';
import 'package:dw9_delivery_app/app/dto/order_product_dto.dart';
import 'package:dw9_delivery_app/app/pages/order/order_state.dart';
import 'package:dw9_delivery_app/app/repositories/order/order_repository.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  void load(List<OrderProductDto> products) async {
    emit(state.copyWith(status: OrderStatus.loading));
    final paymentTypes = await _orderRepository.getAllPaymentsTypes();
    
    emit(state.copyWith(
      orderProducts: products,
      status: OrderStatus.loaded,
      paymentTypes: paymentTypes
    ));
  }
}
