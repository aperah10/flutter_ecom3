import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Models/Product/New_Product_m.dart';
import 'package:thrid_ecom/Backend/Respo/Product/SerachRespo.dart';

part 'searchproduct_event.dart';
part 'searchproduct_state.dart';

class SearchproductBloc extends Bloc<SearchproductEvent, SearchproductState> {
  SearchPDataRespo searchRepository = SearchPDataRespo();
  SearchproductBloc() : super(SearchproductInitial());

  @override
  Stream<SearchproductState> mapEventToState(
    SearchproductEvent event,
  ) async* {
    if (event is SearchProd) {
      yield SearchproductInitial();
      try {
        List<ProductC> prod = await searchRepository.getSearchP(event.query);

        yield SearchLoadedState(productData: prod);
      } catch (e) {
        yield SearachErrorState(message: e.toString());
      }
    }
  }
}
