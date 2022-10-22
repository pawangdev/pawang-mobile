import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/views/add_transaction_controller.dart';
import 'package:pawang_mobile/widgets/numpad.dart';
import 'package:date_time_picker/date_time_picker.dart';

class NewAddTransaction extends StatelessWidget {
  final AddTransactionController controller =
      Get.put(AddTransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF9F9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Income",
                      style: kOpenSans.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                child: Center(
                  child: Obx(
                    () => Text(
                      CurrencyFormat.convertToIdr(
                          int.parse(controller.amountController.value), 0),
                      style: kOpenSans.copyWith(fontSize: 24, fontWeight: bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 250,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Tanggal & Waktu",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DateTimePicker(
                                        type: DateTimePickerType.dateTime,
                                        initialDate: DateTime.now(),
                                        initialValue: '',
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                        use24HourFormat: true,
                                        onChanged: (value) {
                                          print(value);
                                        },
                                        decoration: const InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.calendar_month),
                                          fillColor: Color(0xFFF5F5F5),
                                          filled: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text("Today at 10.09"),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 250,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Expanded(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "Deskripsi",
                                            style: kOpenSans.copyWith(
                                                fontSize: 16,
                                                color:
                                                    defaultGray.withOpacity(1),
                                                fontWeight: semiBold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const TextField(
                                                decoration: InputDecoration(
                                                  fillColor: Color(0xFFF5F5F5),
                                                  filled: true,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: const Text("Tambahkan Catatan"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                            vertical: BorderSide.none,
                            horizontal: BorderSide(
                                color: defaultGray.withOpacity(0.3), width: 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Wallets",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            itemCount: 5,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 12),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: defaultGray
                                                          .withOpacity(0.3)),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    bottom: 14),
                                                child: Center(
                                                  child: Text(
                                                    "Wallet ${index + 1}",
                                                    style: kOpenSans.copyWith(
                                                        fontWeight: semiBold),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(24),
                                      topRight: const Radius.circular(24),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.wallet, size: 22),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Wallet",
                                    style: kOpenSans.copyWith(
                                        fontWeight: semiBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Icon(Icons.arrow_right, size: 22),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Income Category",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Expanded(
                                          child: GridView.count(
                                            crossAxisCount: 4,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Column(
                                                  children: [
                                                    const Icon(
                                                        Icons.shopping_cart),
                                                    const Text("Belanja")
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: const Radius.circular(24),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.shopping_cart, size: 22),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Belanja",
                                    style: kOpenSans.copyWith(
                                        fontWeight: semiBold,
                                        color: defaultBlack),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Simpan"),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(defaultBlack),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: NumpadWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
