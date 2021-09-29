import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Product/Search_Product/searchproduct_bloc.dart';
import 'package:thrid_ecom/Fortend/Screen/Product_Scr/Product/Product_Cat.dart';
import 'package:thrid_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:thrid_ecom/Fortend/Widget/Resuable%20Code/Pic_Icon/Iocns_C.dart';

// ! 1. SEARCH PRODUCT
class SerachScr extends StatefulWidget {
  SerachScr({Key? key}) : super(key: key);

  @override
  _SerachScrState createState() => _SerachScrState();
}

class _SerachScrState extends State<SerachScr> {
  //  ! PRODUCT BLOC INSTANCE
  ProdwithcartBloc prodBloc = ProdwithcartBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<ProdwithcartBloc>(context);
    prodBloc.add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: 'SerachPage',
        act: [
          IconBtn(
            Icons.search,
            submitMethod: () {
              showSearch(
                  context: context,
                  delegate: SearchProduct(
                      searchBloc: BlocProvider.of<SearchproductBloc>(context)));
            },
          )
        ],
      ),

      // ! 2
      body: Container(
        child: BlocBuilder<ProdwithcartBloc, ProdwithcartState>(
            builder: (context, state) {
          print(state);
          if (state is ProdwithcartInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductCartLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductCartLoadedState) {
            return ProdGridList(
                cartState: state.cartData, prodState: state.productData);
          } else if (state is ProductCartErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         // !SEARCH PRODUCT DELEGAGE                        */
/* -------------------------------------------------------------------------- */
class SearchProduct extends SearchDelegate<List> {
  SearchproductBloc searchBloc;

  SearchProduct({required this.searchBloc});
  late String queryString;

  // ! 1. build ACtions method
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconBtn(Icons.clear, submitMethod: () {
        query = '';
      })
    ];
  }

  // ! 2. bulild Leading method
  @override
  Widget buildLeading(BuildContext context) {
    return IconBtn(Icons.arrow_back_ios, submitMethod: () {
      Navigator.pop(context);
    });
  }

  // ! 3.build buildSuggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  // ! 4. buildResult
  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(SearchProd(query: query));
    return SrchResult();
  }
}

// ! SEARCH RESULT METHOD
class SrchResult extends StatelessWidget {
  const SrchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchproductBloc, SearchproductState>(
      builder: (BuildContext context, SearchproductState state) {
        if (state is SearchproductInitial) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearachErrorState) {
          return Center(
            child: const Text('Failed To Load'),
          );
        }
        if (state is SearchLoadedState) {
          if (state.productData.isEmpty) {
            return Center(
              child: const Text('No Results'),
            );
          }
          return ProdGridList(prodState: state.productData);
        }
        return Scaffold();
      },
    );
  }
}
