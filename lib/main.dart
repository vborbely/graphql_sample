import 'package:flutter/material.dart';
import 'package:gql_sample/core/client.dart';
import 'package:gql_sample/data/providers/products_provider.dart';
import 'package:provider/provider.dart';

import 'presentation/screens/home/home_screen.dart';

Future<void> main() async {
  final client = MyClient();
  await client.initClient();

  runApp( MyApp(client));
}

class MyApp extends StatelessWidget {
  final MyClient _client;
  const MyApp(MyClient client, {super.key}) : _client = client;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsProvider>(create: (_) => ProductsProvider(_client)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
