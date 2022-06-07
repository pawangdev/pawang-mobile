import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/services/category_service.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class KategoriScreen extends StatefulWidget {
  static const String routeName = "/kategori";
  const KategoriScreen({Key? key}) : super(key: key);

  @override
  State<KategoriScreen> createState() => _KategoriScreenState();
}

class _KategoriScreenState extends State<KategoriScreen> {
  late Future<CategoriesModel> _categories;
  @override
  void initState() {
    _categories = CategoryService.getCategories();
    super.initState();
  }

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
                child: FutureBuilder(
              future: _categories,
              builder: (context, AsyncSnapshot<CategoriesModel> snapshot) {
                var state = snapshot.connectionState;

                if (state != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    if (snapshot.data?.data.length != 0) {
                      return ListView.builder(
                        itemCount: snapshot.data?.data.length,
                        itemBuilder: (context, index) {
                          var category = snapshot.data?.data[index];
                          return Container(
                            margin: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 16),
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
                                    // ICON
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 18),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(baseURLAPI +
                                                    category!.iconUrl))),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        category.name,
                                        style: kOpenSans.copyWith(
                                          fontSize: 14,
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
                      );
                    } else {
                      return Center(
                        child: Text(
                          "Belum Ada Kategori",
                          style: kOpenSans.copyWith(
                              color: kGray,
                              fontSize: 13, //0.23.dp,
                              fontWeight: medium),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else {
                    return Text("");
                  }
                }
              },
            ))
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
