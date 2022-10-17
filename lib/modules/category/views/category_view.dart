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
                            SvgPicture.network(baseHOSTAPI + category.icon),
                            const SizedBox(
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
                                'Sub Kategori',
                                style: kOpenSans.copyWith(
                                    fontWeight: light, fontSize: 12),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              category.subcategories.isEmpty
                                  ? const Text("Belum Ada Sub Kategori")
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: category.subcategories
                                          .map(
                                            (e) => Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    e.name,
                                                    style: kOpenSans.copyWith(
                                                        fontSize: 16,
                                                        fontWeight: medium),
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                        onPressed: () {
                                                          controller
                                                              .nameTextController
                                                              .text = e.name;

                                                          Get.defaultDialog(
                                                            onWillPop:
                                                                () async {
                                                              controller
                                                                  .nameTextController
                                                                  .text = "";

                                                              return true;
                                                            },
                                                            title:
                                                                'Memperbarui Sub Kategori',
                                                            titleStyle: kOpenSans
                                                                .copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        bold),
                                                            textConfirm:
                                                                'Simpan',
                                                            confirmTextColor:
                                                                defaultWhite,
                                                            buttonColor:
                                                                defaultPrimary,
                                                            onConfirm: () => controller
                                                                .updateSubCategory(
                                                                    categoryId:
                                                                        category
                                                                            .id,
                                                                    subCategoryId:
                                                                        e.id),
                                                            // cancel: ,
                                                            content: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          20),
                                                                  child: Row(
                                                                    children: [
                                                                      SvgPicture.network(
                                                                          baseHOSTAPI +
                                                                              category.icon),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      Text(
                                                                        category
                                                                            .name,
                                                                        style: kOpenSans.copyWith(
                                                                            fontWeight:
                                                                                semiBold,
                                                                            fontSize:
                                                                                12),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                                TextFormField(
                                                                  controller:
                                                                      controller
                                                                          .nameTextController,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    contentPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            0,
                                                                        horizontal:
                                                                            10),
                                                                    hintText:
                                                                        'Isi Sub Kategori',
                                                                    hintStyle: kOpenSans.copyWith(
                                                                        fontSize:
                                                                            12),
                                                                    fillColor:
                                                                        defaultPrimary,
                                                                    border:
                                                                        OutlineInputBorder(
                                                                      gapPadding:
                                                                          2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                            TablerIcons.pencil,
                                                            color:
                                                                defaultPrimary),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          showDialog<void>(
                                                            context: context,
                                                            barrierDismissible:
                                                                false,
                                                            builder: (BuildContext
                                                                    context) =>
                                                                AlertDialog(
                                                              title: Text(
                                                                'Hapus Sub Kategori',
                                                                style: kOpenSans
                                                                    .copyWith(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            bold),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              content: Text(
                                                                'Apakah kamu yakin akan menghapus sub kategori ini?',
                                                                style: kOpenSans
                                                                    .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            light),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              actions: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          OutlinedButton(
                                                                        child:
                                                                            Text(
                                                                          "Kembali",
                                                                          style: kOpenSans.copyWith(
                                                                              fontSize: 16,
                                                                              fontWeight: medium,
                                                                              color: defaultPrimary),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context,
                                                                              'Kembali');
                                                                        },
                                                                        style: OutlinedButton
                                                                            .styleFrom(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: 4),
                                                                          side:
                                                                              const BorderSide(color: defaultPrimary),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        width: 1
                                                                            .w),
                                                                    Expanded(
                                                                      child:
                                                                          OutlinedButton(
                                                                        style: OutlinedButton
                                                                            .styleFrom(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(vertical: 4),
                                                                          side:
                                                                              const BorderSide(color: defaultError),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Hapus',
                                                                          style: kOpenSans.copyWith(
                                                                              color: defaultError,
                                                                              fontWeight: medium,
                                                                              fontSize: 16),
                                                                        ),
                                                                        onPressed: () => controller.deleteSubCategory(
                                                                            categoryId:
                                                                                category.id,
                                                                            subCategoryId: e.id),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        icon: const Icon(
                                                          TablerIcons.trash,
                                                          color: defaultError,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                              const SizedBox(
                                height: 10,
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
                                        textConfirm: 'Simpan',
                                        confirmTextColor: defaultWhite,
                                        buttonColor: defaultPrimary,
                                        onConfirm: () => controller
                                            .addSubCategory(category.id),
                                        // cancel: ,
                                        content: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                children: [
                                                  SvgPicture.network(
                                                      baseHOSTAPI +
                                                          category.icon),
                                                  const SizedBox(
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
                                            const SizedBox(height: 20),
                                            TextFormField(
                                              controller:
                                                  controller.nameTextController,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0,
                                                        horizontal: 10),
                                                hintText: 'Isi Sub Kategori',
                                                hintStyle: kOpenSans.copyWith(
                                                    fontSize: 12),
                                                fillColor: defaultPrimary,
                                                border: OutlineInputBorder(
                                                  gapPadding: 2,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
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
            ),
          ),
        ],
      ),
    );
  }
}
