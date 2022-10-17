import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  final CategoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        colors: [defaultPrimary, defaultPurple])),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Get.statusBarHeight * 0.6, left: 32, right: 32),
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
                          color: defaultWhite,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Kategori',
                          style: kOpenSans.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: defaultWhite),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.categories.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var category = controller.categories[index];
                      return ExpandablePanel(
                        header: Row(
                          children: [
                            // Text(category.icon),
                            Icon(
                              TablerIcons.shopping_cart,
                              color: defaultPrimary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              category.name,
                              style: kOpenSans.copyWith(
                                  fontWeight: semiBold, fontSize: 16),
                            ),
                          ],
                        ),
                        collapsed: const SizedBox(height: 20),
                        expanded: Container(
                          margin: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sub kategori',
                                style: kOpenSans.copyWith(
                                    fontWeight: light, fontSize: 12),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // controller.subcategories.map((e) {
                              //   return Container(
                              //     child: Text(""),
                              //   );
                              // }).toList(),\
                              Text(
                                'Belom ada sub kategori',
                                style: kOpenSans.copyWith(fontWeight: medium),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: 'Tambah Sub Kategori',
                                        titleStyle: kOpenSans.copyWith(
                                            fontSize: 14, fontWeight: bold),
                                        textConfirm: 'Save',
                                        confirmTextColor: defaultWhite,
                                        buttonColor: defaultPrimary,
                                        // cancel: ,
                                        content: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    TablerIcons.shopping_cart,
                                                    color: defaultPrimary,
                                                    size: 14,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    category.name,
                                                    style: kOpenSans.copyWith(
                                                        fontWeight: semiBold,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 10),
                                                hintText: 'Isi Sub Kategori',
                                                hintStyle: kOpenSans.copyWith(
                                                    fontSize: 12),
                                                fillColor: defaultPrimary,
                                                // filled: true,
                                                border: OutlineInputBorder(
                                                  gapPadding: 2,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  // borderSide:
                                                  //     BorderSide.none
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: defaultPrimary,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: defaultWhite,
                                        size: 16,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        builder: (_, collapsed, expanded) => Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                        ),
                        theme: const ExpandableThemeData(
                          animationDuration: Duration(milliseconds: 300),
                        ),
                      );
                    }),
              ),
              // GetBuilder<CategoryController>(
              //   init: CategoryController(),
              //   builder: (controller) {
              //     return ListView(
              //       children: [
              //         ExpansionPanelList(
              //           // expandedHeaderPadding: EdgeInsets.all(5),
              //           expansionCallback: (int index, bool isExpanded) {
              //             // setState(() {
              //             //   _data[index].isExpanded = !isExpanded;
              //             // });
              //             controller.categories[index];
              //             // controller.categories[index].isExpanded = !isExpanded;
              //           },
              //           children:
              //               controller.categories.map<ExpansionPanel>((data) {
              //             return ExpansionPanel(
              //               canTapOnHeader: true,
              //               headerBuilder:
              //                   (BuildContext context, bool isExpanded) {
              //                 return ListTile(
              //                   title: Row(
              //                     children: [
              //                       Icon(
              //                         Icons.car_crash,
              //                         color: defaultPrimary,
              //                       ),
              //                       SizedBox(width: 10),
              //                       Text(data.name),
              //                     ],
              //                   ),
              //                 );
              //               },
              //               // isExpanded: data.isExpanded,
              //               body: ListTile(
              //                   title: Text(data.icon),
              //                   subtitle: const Text(
              //                       'To delete this panel, tap the trash can icon'),
              //                   trailing: const Icon(Icons.delete),
              //                   onTap: () {}),
              //             );
              //           }).toList(),
              //         ),
              //       ],
              //     );
              //   },
              // ),
              // child: Obx(
              //   () => GridView.builder(
              //     clipBehavior: Clip.none,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         childAspectRatio: 2,
              //         crossAxisCount: 2,
              //         crossAxisSpacing: 1,
              //         mainAxisSpacing: 1),
              //     itemCount: controller.categories.length,
              //     itemBuilder: (context, index) {
              //       var category = controller.categories[index];
              //       return Container(
              //         margin:
              //             const EdgeInsets.only(left: 5, right: 5, bottom: 16),
              //         height: 6.4.h,
              //         decoration: BoxDecoration(
              //             color: defaultWhite,
              //             borderRadius: BorderRadius.circular(12),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: defaultBlack.withOpacity(0.07),
              //                 spreadRadius: 2,
              //                 blurRadius: 10,
              //               )
              //             ]),
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: SizedBox(
              //             height: 6.4.h,
              //             child: Row(
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.only(
              //                       left: 20.0, right: 18),
              //                   child: Container(
              //                     width: 25,
              //                     height: 25,
              //                     // child: SvgPicture.network(
              //                     //     baseHOSTAPI + category.icon,
              //                     //     fit: BoxFit.cover),
              //                     child: Icon(TablerIcons.shopping_cart),
              //                   ),
              //                 ),
              //                 Expanded(
              //                   child: Text(
              //                     category.name,
              //                     style: kOpenSans.copyWith(
              //                       fontSize: 12,
              //                       fontWeight: medium,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ),
          ),
        ],
      ),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(25.0),
      //   child: FloatingActionButton(
      //     backgroundColor: defaultWhite,
      //     onPressed: () {
      //       Navigator.pushNamed(context, AddCategoryScreen.routeName);
      //     },
      //     tooltip: 'Tambah Kategori',
      //     splashColor: defaultPrimary,
      //     child: Icon(
      //       Icons.add,
      //       color: defaultPrimary,
      //     ),
      //   ),
      // ),
    );
  }
}
