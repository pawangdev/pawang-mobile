import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/onboarding/controllers/onboarding_controllers.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/storage.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);

  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onboardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.075),
                    Image.asset(
                      _controller.onboardingPages[index].imageAsset,
                      fit: BoxFit.contain,
                      width: Get.width,
                    ),
                    Text(
                      _controller.onboardingPages[index].title,
                      style: TextStyle(fontSize: 24, fontWeight: bold),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Text(
                        _controller.onboardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: medium),
                      ),
                    ),
                  ],
                );
              }),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  width: Get.width,
                  height: Get.height * 0.1,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [defaultPrimary, defaultPurple]),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: _controller.isLastPage
                      ? InkWell(
                          onTap: () {
                            Storage.saveValue('is_first_open', true);
                            Get.toNamed(RoutesName.login);
                          },
                          child: Center(
                              child: Text(
                            'Get Started',
                            style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: semiBold,
                                color: defaultBlack),
                          )),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                if (_controller.isFirstPage) {
                                  _controller.pageController.jumpToPage(2);
                                } else {
                                  _controller.pageController.previousPage(
                                      duration: 0.5.seconds,
                                      curve: Curves.ease);
                                }
                              },
                              child: Obx(() {
                                return Text(
                                  _controller.isFirstPage ? 'Skip' : 'Prev',
                                  style: kOpenSans.copyWith(
                                      fontWeight: semiBold,
                                      color: defaultBlack),
                                );
                              }),
                            ),
                            Row(
                              children: List.generate(
                                _controller.onboardingPages.length,
                                (index) => Obx(() {
                                  return Container(
                                    margin: const EdgeInsets.all(4),
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color:
                                          _controller.selectedPageIndex.value ==
                                                  index
                                              ? defaultBlack.withOpacity(0.7)
                                              : Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
                                  );
                                }),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _controller.pageController.nextPage(
                                    duration: 0.5.seconds, curve: Curves.ease);
                              },
                              child: Text(
                                'Next',
                                style: kOpenSans.copyWith(
                                    fontWeight: semiBold, color: defaultBlack),
                              ),
                            ),
                          ],
                        ))),
            ),
          )
        ],
      )),
    );
  }
}
