part of 'searchproduct_bloc.dart';

abstract class SearchproductState extends Equatable {
  const SearchproductState();

  @override
  List<Object> get props => [];
}

class SearchproductInitial extends SearchproductState {
  @override
  List<Object> get props => [];
}

class SearchLoadedState extends SearchproductState {
  List<ProductC> productData;
  SearchLoadedState({required this.productData});
  @override
  List<Object> get props => [];
}

class SearachErrorState extends SearchproductState {
  String message;
  SearachErrorState({required this.message});
}
