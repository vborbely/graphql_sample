import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:ferry/ferry.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../app_constants.dart';
import '../graphql/__generated__/schema.schema.gql.dart' show possibleTypesMap;

final _link = HttpLink(graphQlUrl);

class MyClient {
  Client? _client;

  Client get client {
    final client = _client;
    if (client == null) {
      throw StateError('Client is not initialized');
    }

    return client;
  }

  Future<void> initClient() async {
    await Hive.initFlutter('hive_data');
    final box = await Hive.openBox("graphql");
    final store = HiveStore(box);
    final cache = Cache(store: store, possibleTypes: possibleTypesMap);
    final link = _link;

    _client = Client(
      link: link,
      cache: cache,
    );
  }
}
