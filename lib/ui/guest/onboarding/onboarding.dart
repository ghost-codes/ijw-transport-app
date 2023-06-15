import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ijw_transport_app/utils/theme/app_text.dart';
import 'package:ijw_transport_app/utils/theme/colors.dart';
import 'package:ijw_transport_app/utils/ui/widgets/primary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardInfoItem {
  final String title;
  final String description;
  final String imageAsset;

  OnboardInfoItem(this.title, this.description, this.imageAsset);
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();

  final pages = [
    OnboardInfoItem(
      "Care",
      "Consectetur mollit ad ullamco tempor sunt pariatur. Eu ea exercitation occaecat elit proident excepteur labore ut nulla minim. Ut commodo minim amet Lorem exercitation dolor sit reprehenderit id",
      "assets/svg/onboarding-page-1.svg",
    ),
    OnboardInfoItem(
      "Health",
      "Ut elit incididunt ex proident sunt sint. Anim ullamco eiusmod voluptate deserunt cupidatat id sit velit adipisicing occaecat aliqua amet cillum. Exercitation eiusmod tempor culpa aute aliquip sit ut ut anim et duis eu.",
      "assets/svg/onboarding-page-2.svg",
    ),
    OnboardInfoItem(
      "Dedication",
      "Culpa culpa esse aliqua non aliquip adipisicing eiusmod consequat. Sunt ex magna adipisicing cupidatat ut sit consequat voluptate culpa amet. Tempor duis consectetur nulla non.",
      "assets/svg/onboarding-page-3.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
            Expanded(
              child: PageView.builder(
                  itemCount: pages.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    final item = pages[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width,
                            child: Center(child: SvgPicture.asset(pages[index].imageAsset))),
                        const SizedBox(height: 20),
                        AppText.h4Bold(item.title),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 300,
                          child: AppText.descriptionRegular(item.description),
                        ),
                      ],
                    );
                  }),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: const ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                radius: 10,
                dotColor: AppColors.primary,
                activeDotColor: AppColors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(width: 100, child: PrimaryButton("Skip", onPressed: () {})),
            )
          ],
        ),
      )),
    );
  }
}
