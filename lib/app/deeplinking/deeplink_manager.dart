import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:uni_links/uni_links.dart';

import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';
import 'deeplink.dart';

class DeeplinkManager implements Disposable {
  bool _initialized = false;

  final List<Deeplink> _pendingDeeplinks = [];

  late final StreamSubscription<Map<dynamic, dynamic>>? _branchSubcription;
  late final StreamSubscription<Uri?> _unilinksSubscripton;

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    _initBranch();
    await _initUnilinks();
  }

  void _initBranch() {
    // _branchSubcription = FlutterBranchSdk.initSession().listen(
    //   (data) async {

    //     await _parseBranchLink(e);
    //   },
    //   onError: (error) {
    //     // AppCore.instance.logger.error(error);
    //   },
    // );
  }

  // Future<void> _parseBranchLink(ReferralData referralData) async {
  //   getIt<DebugLog>().data.add({"ReferralData": referralData.data});

  //   final branchData = BranchData.fromParams(referralData.data);
  //   if (branchData.referringLink == null || !branchData.isReferringLink) return;

  //   final deeplink = Deeplink(
  //     Uri.parse(branchData.referringLink!),
  //     referralData: referralData,
  //   );
  //   _pushDeepLink(deeplink);
  // }

  Future<void> _initUnilinks() async {
    if (kIsWeb) return;

    final initialUri = await getInitialUri();
    if (initialUri != null) _parseUnilinksLink(initialUri);

    // Attach a listener to the links stream
    _unilinksSubscripton = uriLinkStream.listen(_parseUnilinksLink);
  }

  void _parseUnilinksLink(Uri? uri) {
    if (uri == null) return;

    // getIt<DebugLog>().data.add({"uniLink": uri});
    _pushDeepLink(Deeplink(uri));
  }

  void _pushDeepLink(Deeplink deeplinsk) {
    final deeplink = _maybeHandleInternally(deeplinsk);
    if (deeplink == null) return;

    if (_pendingDeeplinks.contains(deeplink)) return;
    _pendingDeeplinks.add(deeplink);
    Future.delayed(const Duration(milliseconds: 2000), () {
      _pendingDeeplinks.remove(deeplink);
    });

    getIt.get<EventBus>().emit(DeeplinkLaunched(deeplink: deeplink));
  }

  Deeplink? _maybeHandleInternally(Deeplink deeplink) {
    final hasReferrerId = deeplink.branchData?.referrerId?.isNotEmpty ?? false;
    final hasAffiliateId = deeplink.branchData?.affiliateId?.isNotEmpty ?? false;
    if (hasReferrerId || hasAffiliateId) {
      if (hasReferrerId) {
        // AppCore.instance.sharedPref
        //     .putString("referrerId", deeplink.branchData!.referrerId!, secure: true);
      }
      if (hasAffiliateId) {
        // AppCore.instance.sharedPref
        //     .putString("affiliateId", deeplink.branchData!.affiliateId!, secure: true);
      }
      return null;
    }

    final groupId = deeplink.branchData?.groupId;
    final groupAppId = deeplink.branchData?.groupAppId;
    if (groupId != null && groupAppId != null) {
      return Deeplink(
        Uri.parse('/groups/$groupAppId/$groupId'),
        // referralData: deeplink.referralData,
      );
    }

    // Don't allow handling of invite links
    if (deeplink.route.endsWith('/invite')) return null;

    return deeplink;
  }

  @override
  Future<void> onDispose() async {
    await _unilinksSubscripton.cancel();
    await _branchSubcription?.cancel();
  }
}
