import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/add_transaction_controller.dart';

class NewAddTransaction extends StatelessWidget {
  final AddTransactionController controller =
      Get.put(AddTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(TablerIcons.x)),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "",
                        style: kOpenSans.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(TablerIcons.eraser),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 4, child: TextFormField()),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "IDR",
                        style: kOpenSans.copyWith(
                            fontSize: 22, fontWeight: semiBold),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                    controller: controller.tabController,
                    indicator: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        child: Text("Income"),
                      ),
                      Tab(
                        child: Text("Outcome"),
                      )
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 18),
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF7825C),
                                ),
                                child: const Icon(TablerIcons.pencil,
                                    color: Colors.white, size: 24),
                              ),
                              Text(
                                "Write a note",
                                style: kOpenSans.copyWith(
                                    fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Icon(TablerIcons.plus)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 18),
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF7825C),
                                ),
                                child: const Icon(TablerIcons.camera,
                                    color: Colors.white, size: 24),
                              ),
                              Text(
                                "Pick a photo",
                                style: kOpenSans.copyWith(
                                    fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Icon(TablerIcons.plus)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.black),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 18),
                                alignment: Alignment.center,
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffF7825C),
                                ),
                                child: const Icon(TablerIcons.calendar,
                                    color: Colors.white, size: 24),
                              ),
                              Text(
                                "1 September 2022",
                                style: kOpenSans.copyWith(
                                    fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Icon(TablerIcons.plus)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
