import 'package:flutter/widgets.dart';
import 'package:gql_sample/core/client.dart';
import 'package:gql_sample/graphql/query/__generated__/all_products.req.gql.dart';

import '../../graphql/query/__generated__/all_products.data.gql.dart';

class ProductsProvider extends ChangeNotifier {
  final _products = <GAllProductsData_products_edges_node>[];

  List<GAllProductsData_products_edges_node> get products => _products;
  final MyClient _client;

  ProductsProvider(MyClient client) : _client = client {
    _load();
  }

  void _loadMore() {}

  void _load() {
    final request = GAllProductsReq(
      (b) => b..vars.first = 10,
    );

    _client.client.request(request).listen((event) {
      final products = event.data?.products?.edges.map((edge) {
        // print(edge.node.toString());
        return edge.node;
      }).toList();

      _products.clear();
      _products.addAll(products ?? []);
      notifyListeners();
    });
  }
}
