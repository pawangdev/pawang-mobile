import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  final CategoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 13.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [kPrimary, kPurple])),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 28, left: 32, right: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(
                        blueMode: false,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/kategori.svg',
                            color: kWhite,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Kategori',
                            style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                                color: kWhite),
                          ),
                        ],
                      ),
                      Container(
                        width: 7.2.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.4.h,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Obx(
                  () => GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 2,
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    itemCount: controller.categories.length,
                    itemBuilder: (context, index) {
                      var category = controller.categories[index];
                      return Container(
                        margin: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 16),
                        height: 6.4.h,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: kBlack.withOpacity(0.07),
                                spreadRadius: 2,
                                blurRadius: 10,
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 6.4.h,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 18),
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: SvgPicture.network(
                                        baseHOSTAPI + category.icon,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    category.name,
                                    style: kOpenSans.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(25.0),
      //   child: FloatingActionButton(
      //     backgroundColor: kWhite,
      //     onPressed: () {
      //       Navigator.pushNamed(context, AddCategoryScreen.routeName);
      //     },
      //     tooltip: 'Tambah Kategori',
      //     splashColor: kPrimary,
      //     child: Icon(
      //       Icons.add,
      //       color: kPrimary,
      //     ),
      //   ),
      // ),
    );
  }
}
