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
                    SizedBox(height: Get.height * 0.095),
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
          Obx(() => _controller.isLastPage
              ? const SizedBox()
              : Positioned(
                  top: 50,
                  right: 40,
                  child: GestureDetector(
                    onTap: () {
                      _controller.pageController.jumpToPage(2);
                    },
                    child: Center(
                        child: Text(
                      'Skip',
                      style: kOpenSans.copyWith(
                          color: defaultPrimary, fontWeight: semiBold),
                    )),
                  ))),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _controller.onboardingPages.length,
                      (index) => Obx(() {
                        return Container(
                          margin: const EdgeInsets.all(4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _controller.selectedPageIndex.value == index
                                ? defaultPrimary
                                : defaultGray.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                  Obx(
                    () => TextButton(
                      onPressed: () {
                        if (_controller.isLastPage) {
                          Storage.saveValue('is_first_open', true);
                          Get.offNamed(RoutesName.login);
                        } else {
                          _controller.pageController.nextPage(
                              duration: 0.5.seconds, curve: Curves.ease);
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _controller.isLastPage ? 'Get Started' : 'Next',
                            style: kOpenSans.copyWith(
                                color: defaultPrimary, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            color: defaultPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
