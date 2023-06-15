import 'package:flutter/material.dart';

import '../../core/services/event_bus/event_bus.dart';
import '../../core/services/event_bus/events.dart';
import '../../core/services/injection_container.dart';

class MaintenanceHost extends StatefulWidget {
  static const String name = 'MaintenanceHost';
  const MaintenanceHost({Key? key}) : super(key: key);

  @override
  State<MaintenanceHost> createState() => _MaintenanceHostState();
}

class _MaintenanceHostState extends State<MaintenanceHost> {
  // RemoteConfig get rmConfig => AchieveCore.instance.remoteConfig;

  @override
  void initState() {
    super.initState();

    getIt.get<EventBus>().emit(RouteChanged(MaintenanceHost.name));
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   backgroundColor: AchieveColors.green,
    //   appBar: heroAppBar(
    //     appbar: AppBar(
    //       elevation: 0,
    //       systemOverlayStyle: SystemUiOverlayStyle.dark,
    //       backgroundColor: Colors.transparent,
    //       automaticallyImplyLeading: false,
    //     ),
    //   ),
    //   body: Stack(
    //     children: [
    //       SvgPicture.asset(
    //         'assets/svg/splash-background-pattern.svg',
    //         fit: BoxFit.fill,
    //       ),
    //       Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 24),
    //         alignment: Alignment.center,
    //         child: Container(
    //           constraints: const BoxConstraints(
    //             maxWidth: AchieveBreakpoints.small,
    //           ),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: <Widget>[
    //               const Spacer(),
    //               Hero(
    //                 tag: 'splash',
    //                 child: Image.asset(
    //                   'assets/img/achieve.png',
    //                   height: 70,
    //                   color: Colors.white,
    //                 ),
    //               ),
    //               const SizedBox(height: 48),
    //               Text(
    //                 "We'll be back",
    //                 style: themeData.textTheme.headline1!.copyWith(
    //                   fontSize: 24,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.w700,
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ),
    //               const SizedBox(height: 40),
    //               Text(
    //                 rmConfig.getString('maintenance_message'),
    //                 style: themeData.textTheme.subtitle2!.copyWith(
    //                   fontSize: 18,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.w300,
    //                 ),
    //                 textAlign: TextAlign.center,
    //               ),
    //               const SizedBox(height: 22),
    //               const Spacer(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Container();
  }

  @override
  String get pageName => 'Maintenance Screen';
}
