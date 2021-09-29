import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Models/Order/Orderm.dart';
import 'package:thrid_ecom/Backend/Respo/OrderR/OrderRespo.dart';

part 'orderpage_event.dart';
part 'orderpage_state.dart';

class OrderpageBloc extends Bloc<OrderpageEvent, OrderpageState> {
  // ! Adding Repo for data logic
  OrderDataRespo orderRespo = OrderDataRespo();

  OrderpageBloc() : super(OrderpageInitial());

  @override
  Stream<OrderpageState> mapEventToState(
    OrderpageEvent event,
  ) async* {
    if (event is OrderBtn) {
      yield OrderLoading();

      try {
        List<Order> order = await orderRespo.orderData(
            address: event.address,
            product: event.product,
            quantity: event.quantity);

        yield OrderSucccess();
      } catch (error) {
        yield OrderFailure(error: error.toString());
      }
    }
  }
}
