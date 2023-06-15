import 'package:equatable/equatable.dart';
import 'package:ijw_transport_app/app/deeplinking/branch_data.dart';

import '../../utils/utils.dart';

class Deeplink extends Equatable {
  final Uri uri;
  late final Uri deeplink;

  // final ReferralData? referralData;
  late final BranchData? branchData;

  Deeplink(this.uri) {
    _setActualDeeplink();

    branchData = null;
  }

  void _setActualDeeplink() {
    if (uri.path == "/deeplink" && uri.queryParameters.containsKey("url")) {
      try {
        deeplink = Uri.parse(Uri.decodeFull(uri.queryParameters["url"]!));
        return;
      } catch (e) {
        // do nothing
      }
    }

    deeplink = uri;
  }

  String get route =>
      '${deeplink.path}${deeplink.queryParameters.isNotEmpty ? '?${uriEncodeMap(deeplink.queryParameters)}' : ''}'
          .trim();

  @override
  List<Object?> get props => [uri];
}
