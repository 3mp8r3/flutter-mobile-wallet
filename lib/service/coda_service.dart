import 'package:graphql/client.dart';
import 'dart:io';
import 'package:http/io_client.dart';

class CodaService {
  GraphQLClient _client;

  CodaService() {
    HttpClient httpClient = HttpClient();
    IOClient ioClient;
    httpClient.findProxy = (url) {
      return HttpClient.findProxyFromEnvironment(url, environment: {'http_proxy': 'http://192.168.84.201:9999'});
    };

    ioClient = IOClient(httpClient);
    final HttpLink httpLink = HttpLink(
        uri: 'http://45.77.177.210:3085/graphql',
        headers: <String, String> {
          'content-type': 'application/json',
        },
        httpClient: ioClient
    );

    _client = GraphQLClient(link: httpLink, cache: InMemoryCache());
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic> variables}) async {
    QueryOptions options = QueryOptions(documentNode: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic> variables}) async {
    MutationOptions options =
    MutationOptions(documentNode: gql(query), variables: variables);

    final result = await _client.mutate(options);

    print(result);

    return result;
  }
}