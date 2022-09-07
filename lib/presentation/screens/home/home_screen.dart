import 'package:flutter/material.dart';
import 'package:gql_sample/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Consumer<ProductsProvider>(
        builder: (context, provider, widget) {
          final products = provider.products;

          return ListView.builder(
            itemBuilder: (context, index) {
              final product = products[index];

              return ListTile(
                title: Text(product.name),
              );
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
