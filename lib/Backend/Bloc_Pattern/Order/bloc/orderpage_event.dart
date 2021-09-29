part of 'orderpage_bloc.dart';

abstract class OrderpageEvent extends Equatable {
  const OrderpageEvent();

  @override
  List<Object> get props => [];
}

class OrderBtn extends OrderpageEvent {
  final String address;
  final String product;
  int? quantity;

  OrderBtn({required this.address, required this.product, this.quantity});

  @override
  List<Object> get props => [product, address];

  @override
  String toString() =>
      'OrderBtnPressed { username: $product, password: $address }';
}
