import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ijw_transport_app/utils/theme/app_text.dart';
import 'package:ijw_transport_app/utils/theme/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svg/logo-icon-color.svg",
                  width: 25,
                ),
                const SizedBox(width: 20),
                AppText.h3Bold("IJW Transport", textColor: AppColors.primary),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: SvgPicture.asset(
              "assets/svg/signin-page.svg",
              width: double.infinity,
            )),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.gray.shade300, borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/google-icon.svg",
                    width: 30,
                  ),
                  const SizedBox(width: 15),
                  AppText.h6Bold(
                    "Continue with Google",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: AppColors.gray.shade300, borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/svg/facebook-icon.svg",
                    width: 30,
                  ),
                  const SizedBox(width: 15),
                  AppText.h6Bold(
                    "Continue with Facebook",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            AppText.captionRegular("Powered by CyPrep", textColor: AppColors.gray)
          ]),
        ),
      ),
    );
  }
}
