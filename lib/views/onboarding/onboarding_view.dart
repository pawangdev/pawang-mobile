import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/onboarding/onboarding_controllers.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);

  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/onboard.png"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller.pageController,
                onPageChanged: _controller.selectedPageIndex,
                itemCount: _controller.onboardingPages.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                            _controller.onboardingPages[index].imageAsset),
                        SizedBox(height: 80),
                        Text(
                          _controller.onboardingPages[index].title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 32),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 64.0),
                          child: Text(
                            _controller.onboardingPages[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            Positioned(
              bottom: 60,
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
              bottom: 40,
              child: FloatingActionButton(
                backgroundColor: defaultPrimary,
                onPressed: _controller.forwardAction,
                child: Obx(() {
                  return Text(_controller.isLastPage ? 'Start' : 'Next');
                }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
