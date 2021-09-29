part of 'searchproduct_bloc.dart';

abstract class SearchproductEvent extends Equatable {
  const SearchproductEvent();

  @override
  List<Object> get props => [];
}

class SearchProd extends SearchproductEvent {
  String query;
  SearchProd({required this.query});
  @override
  List<Object> get props => [];
}
