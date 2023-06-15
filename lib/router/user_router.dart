import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ijw_transport_app/utils/navigator/router_observer.dart';
import 'package:ijw_transport_app/utils/theme/app_typography.dart';
import 'package:ijw_transport_app/utils/ui/widgets/primary_button.dart';

abstract class UserRoutes {}

String homeRedirect(context, state) => '/';

final userRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  observers: [
    RouterObserver(),
  ],
  initialLocation: "/",
  redirect: (context, state) {
    return null;
  },
  routes: [],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                'assets/img/new/404-img.png',
                width: 150,
                height: 150,
              ),
            ),
            Text(
              'Something is wrong',
              textAlign: TextAlign.center,
              style: AppTypography.h6Bold(textColor: Colors.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'The page you are looking for was moved, removed, renamed or might never existed!',
              textAlign: TextAlign.center,
              style: AppTypography.paragraphRegular(),
            ),
            const SizedBox(
              height: 40,
            ),
            PrimaryButton(
              'Go Home',
              onPressed: () => context.go('/'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  },
);
