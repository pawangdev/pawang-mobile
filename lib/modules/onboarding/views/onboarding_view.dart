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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _controller.onboardingPages[index].imageAsset,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _controller.onboardingPages[index].title,
                      style: TextStyle(fontSize: 24, fontWeight: bold),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Text(
                        _controller.onboardingPages[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: medium),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                );
              }),
          Positioned(
            bottom: 40,
            left: 40,
            child: Row(
              children: List.generate(
                _controller.onboardingPages.length,
                (index) => Obx(() {
                  return Container(
                    margin: const EdgeInsets.all(4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: _controller.selectedPageIndex.value == index
                          ? defaultPrimary
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: defaultPrimary,
              onPressed: () {
                if (_controller.isLastPage) {
                  Storage.saveValue('is_first_open', true);
                  Get.toNamed(RoutesName.landing);
                } else {
                  _controller.pageController
                      .nextPage(duration: 0.2.seconds, curve: Curves.ease);
                }
              },
              child: Obx(() {
                return Text(_controller.isLastPage ? 'Start' : 'Next');
              }),
            ),
          ),
        ],
      )),
    );
  }
}
