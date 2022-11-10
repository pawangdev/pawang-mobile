import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  final CategoryController controller = Get.find();
  final TransactionController transactionController = Get.find();
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/background.png'),
                Container(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.07, left: 32, right: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(blueMode: false, onTap: (() => Get.back())),
                      Text(
                        'Kategori'.tr,
                        style: kInter.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                            color: defaultWhite),
                      ),
                      SizedBox(
                        width: Get.width * 0.072,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: defaultBlack.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: TabBar(
                    indicator: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [defaultPrimary, defaultPurple]),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    tabs: [
                      Tab(text: 'Pemasukan'.tr),
                      Tab(text: 'Pengeluaran'.tr)
                    ]),
              ),
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
                              args != null
                                  ? GestureDetector(
                                      onTap: () {
                                        // Category ID
                                        transactionController.categoryId.value =
                                            category.id;

                                        // Subcategory ID
                                        transactionController
                                            .subCategoryId.value = 0;

                                        // Set Category & Sub Category Display Name

                                        transactionController
                                            .displayCategoryName
                                            .text = category.name;
                                        Get.back();
                                      },
                                      child: Row(
                                        children: [
                                          CachedNetworkImage(
                                            width: 30,
                                            imageUrl:
                                                baseHOSTAPI + category.icon,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(
                                                    value: downloadProgress
                                                        .progress),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.05,
                                          ),
                                          Text(
                                            category.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: kInter.copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        CachedNetworkImage(
                                          width: 30,
                                          imageUrl: baseHOSTAPI + category.icon,
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.05,
                                        ),
                                        Text(
                                          category.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: kInter.copyWith(
                                              fontWeight: semiBold,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          collapsed: SizedBox(height: Get.height * 0.03),
                          expanded: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sub Kategori'.tr,
                                  style: textMuted,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                category.subcategories.isEmpty
                                    ? Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            "Belum Ada Sub Kategori".tr,
                                            style: kInter.copyWith(
                                                color: defaultGray),
                                          ),
                                        ),
                                      )
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
                                                    args == null
                                                        ? SizedBox(
                                                            width: Get.width *
                                                                0.45,
                                                            child: Text(
                                                              e.name,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: kInter
                                                                  .copyWith(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          medium),
                                                            ),
                                                          )
                                                        : TextButton(
                                                            onPressed: () {
                                                              // Category ID
                                                              transactionController
                                                                      .categoryId
                                                                      .value =
                                                                  e.categoryId;

                                                              // Subcategory ID
                                                              transactionController
                                                                  .subCategoryId
                                                                  .value = e.id;

                                                              // Set Category & Sub Category Display Name

                                                              transactionController
                                                                      .displayCategoryName
                                                                      .text =
                                                                  "${category.name} - ${e.name}";
                                                              Get.back();
                                                            },
                                                            style: TextButton.styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                minimumSize:
                                                                    const Size(
                                                                        50, 30),
                                                                tapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                alignment: Alignment
                                                                    .centerLeft),
                                                            child: SizedBox(
                                                              width: Get.width *
                                                                  0.5,
                                                              child: Text(
                                                                e.name,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: kInter.copyWith(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        medium,
                                                                    color:
                                                                        defaultBlack),
                                                              ),
                                                            )),
                                                    args == null
                                                        ? Row(
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
                                                                        'Memperbarui Sub Kategori'
                                                                            .tr,
                                                                    titleStyle: kInter.copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            bold),
                                                                    confirm:
                                                                        ButtonCustom(
                                                                      elevatedMode:
                                                                          true,
                                                                      text: 'Simpan Perubahan'
                                                                          .tr,
                                                                      onTap: () => controller.updateSubCategory(
                                                                          categoryId: category
                                                                              .id,
                                                                          subCategoryId:
                                                                              e.id),
                                                                    ),
                                                                    titlePadding:
                                                                        const EdgeInsets.only(
                                                                            top:
                                                                                25),
                                                                    contentPadding:
                                                                        const EdgeInsets.all(
                                                                            20),

                                                                    // cancel: ,
                                                                    content:
                                                                        Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 20),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              CachedNetworkImage(
                                                                                width: 40,
                                                                                imageUrl: baseHOSTAPI + category.icon,
                                                                                fit: BoxFit.cover,
                                                                                progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                                                                                  padding: const EdgeInsets.all(16.0),
                                                                                  child: CircularProgressIndicator(value: downloadProgress.progress),
                                                                                ),
                                                                                errorWidget: (context, url, error) => const Icon(Icons.error),
                                                                              ),
                                                                              SizedBox(
                                                                                width: Get.width * 0.05,
                                                                              ),
                                                                              Text(
                                                                                category.name,
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: kInter.copyWith(fontWeight: medium, fontSize: 16),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                            height:
                                                                                20),
                                                                        TextFormField(
                                                                          scrollPadding:
                                                                              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                                          controller:
                                                                              controller.nameTextController,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding:
                                                                                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                                                            hintText:
                                                                                'Isi Sub Kategori'.tr,
                                                                            hintStyle:
                                                                                kInter.copyWith(fontSize: 16),
                                                                            fillColor:
                                                                                defaultPrimary,
                                                                            border:
                                                                                OutlineInputBorder(
                                                                              gapPadding: 2,
                                                                              borderRadius: BorderRadius.circular(16),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                icon: const Icon(
                                                                    Icons
                                                                        .edit_outlined,
                                                                    color:
                                                                        defaultPrimary),
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  showDialog<
                                                                      void>(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false,
                                                                    builder: (BuildContext
                                                                            context) =>
                                                                        AlertDialog(
                                                                      title:
                                                                          Text(
                                                                        'Hapus Sub Kategori'
                                                                            .tr,
                                                                        style: kInter.copyWith(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                bold),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      content:
                                                                          Text(
                                                                        'Apakah kamu yakin akan menghapus sub kategori ini?'
                                                                            .tr,
                                                                        style: kInter.copyWith(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                medium),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8)),
                                                                      actions: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: ButtonCustom(
                                                                                elevatedMode: false,
                                                                                text: 'Kembali'.tr,
                                                                                onTap: () {
                                                                                  Navigator.pop(context, 'Kembali');
                                                                                },
                                                                              ),
                                                                            ),
                                                                            SizedBox(width: Get.width * 0.01),
                                                                            Expanded(
                                                                                child: ButtonCustom(
                                                                              elevatedMode: false,
                                                                              text: 'Hapus'.tr,
                                                                              blueMode: false,
                                                                              onTap: () => controller.deleteSubCategory(categoryId: category.id, subCategoryId: e.id),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons
                                                                      .delete_outlined,
                                                                  color:
                                                                      defaultError,
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : const SizedBox()
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                args == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title: 'Tambah Sub Kategori'.tr,
                                                titleStyle: kInter.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: bold),
                                                confirm: ButtonCustom(
                                                  text:
                                                      'Simpan Sub Kategori'.tr,
                                                  onTap: () =>
                                                      controller.addSubCategory(
                                                          category.id),
                                                ),
                                                titlePadding:
                                                    const EdgeInsets.only(
                                                        top: 25),
                                                contentPadding:
                                                    const EdgeInsets.all(20),
                                                content: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: Row(
                                                        children: [
                                                          CachedNetworkImage(
                                                            width: 20,
                                                            imageUrl:
                                                                baseHOSTAPI +
                                                                    category
                                                                        .icon,
                                                            fit: BoxFit.cover,
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        downloadProgress) =>
                                                                    Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      16.0),
                                                              child: CircularProgressIndicator(
                                                                  value: downloadProgress
                                                                      .progress),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const Icon(Icons
                                                                    .error),
                                                          ),
                                                          SizedBox(
                                                            width: Get.width *
                                                                0.05,
                                                          ),
                                                          Text(
                                                            category.name,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                kInter.copyWith(
                                                                    fontWeight:
                                                                        medium,
                                                                    fontSize:
                                                                        16),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20),
                                                    TextFormField(
                                                      scrollPadding:
                                                          EdgeInsets.only(
                                                              bottom: MediaQuery
                                                                      .of(context)
                                                                  .viewInsets
                                                                  .bottom),
                                                      controller: controller
                                                          .nameTextController,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                vertical: 5,
                                                                horizontal: 10),
                                                        hintText:
                                                            'Isi Sub Kategori'
                                                                .tr,
                                                        hintStyle:
                                                            kInter.copyWith(
                                                                fontSize: 14),
                                                        fillColor:
                                                            defaultPrimary,
                                                        border:
                                                            OutlineInputBorder(
                                                          gapPadding: 2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
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
                                                gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: [
                                                      defaultPrimary,
                                                      defaultPurple
                                                    ]),
                                                shape: BoxShape.circle,
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
                                    : const SizedBox()
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
      ),
    );
  }
}
