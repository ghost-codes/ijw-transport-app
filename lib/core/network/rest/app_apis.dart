import 'package:ijw_transport_app/core/network/rest/rest_client.dart';

class AppApi {
  AppApi(
    RestClient restClient,
  ) : _restClient = restClient;

  final RestClient _restClient;
}
