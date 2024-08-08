import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:milkcollection/app/theme/app_colors.dart';
import 'package:milkcollection/app/widgets/backdround_container.dart';
import 'package:milkcollection/app/widgets/custom_button.dart';
import 'package:milkcollection/app/widgets/text_form_widget.dart';

import '../controllers/farmer_controller.dart';

class FarmerView extends GetView<FarmerController> {
  const FarmerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title)),
        centerTitle: true,
      ),
      body: BackgroundContainer(
        child: Obx(() => !controller.progressBar
            ? Form(
                key: controller.farmerFormKey,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  // color: Colors.amber,
                  height: Get.height,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Famer Name:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: !controller.type
                                ? TextFormWidget(
                                    // readOnly: controller.type,
                                    initialValue: controller.farmerName,
                                    onChanged: (p0) =>
                                        controller.farmerName = p0,
                                    keyboardType: TextInputType.text,
                                    validator: (val) => val!.length < 3
                                        ? "Field is required!"
                                        : null,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      controller.farmerName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bank Name:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: !controller.type
                                ? TextFormWidget(
                                    readOnly: controller.type,
                                    initialValue: controller.bankName,
                                    onChanged: (p0) => controller.bankName = p0,
                                    keyboardType: TextInputType.text,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      controller.bankName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Branch Name:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: !controller.type
                                ? TextFormWidget(
                                    readOnly: controller.type,
                                    initialValue: controller.branchName,
                                    onChanged: (p0) =>
                                        controller.branchName = p0,
                                    keyboardType: TextInputType.text,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      controller.branchName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Account Number:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: !controller.type
                                ? TextFormWidget(
                                    readOnly: controller.type,
                                    initialValue: controller.accountNumber,
                                    onChanged: (p0) =>
                                        controller.accountNumber = p0,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true, signed: false),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    maxLength: 17,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      controller.accountNumber,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "IFSC Code:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: !controller.type
                                ? TextFormWidget(
                                    readOnly: controller.type,
                                    initialValue: controller.ifscCode,
                                    onChanged: (p0) => controller.ifscCode = p0,
                                    keyboardType: TextInputType.text,
                                    maxLength: 11,
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      controller.ifscCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium,
                                    ),
                                  ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Aadhar Card Number:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: TextFormWidget(
                              initialValue: controller.aadharCard,
                              onChanged: (p0) => controller.aadharCard = p0,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (val) => val!.length < 12
                                  ? "Field is required!"
                                  : null,
                              maxLength: 12,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Mobile Number:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium!,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: TextFormWidget(
                              initialValue: controller.mobileNumber,
                              onChanged: (p0) => controller.mobileNumber = p0,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (val) => val!.length < 10
                                  ? "Field is required!"
                                  : null,
                              maxLength: 10,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Number of cows:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: TextFormWidget(
                              initialValue: controller.numberOfCows,
                              onChanged: (p0) => controller.numberOfCows = p0,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (val) =>
                                  val!.length < 1 ? "Field is required!" : null,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Number of buffalo:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: TextFormWidget(
                              initialValue: controller.numberOfBuffalo,
                              onChanged: (p0) =>
                                  controller.numberOfBuffalo = p0,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (val) =>
                                  val!.length < 1 ? "Field is required!" : null,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Address:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(() => SizedBox(
                            child: TextFormWidget(
                              initialValue: controller.address,
                              onChanged: (p0) => controller.address = p0,
                              keyboardType: TextInputType.text,
                              // maxLength: 10,
                              validator: (val) =>
                                  val!.length < 3 ? "Field is required!" : null,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Mode of Pay:",
                          style: Theme.of(Get.context!).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Obx(
                            () => !controller.type
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(() => SizedBox(
                                            width: Get.width * 0.2,
                                            child: Radio(
                                              activeColor: AppColors.yellow,
                                              value: 0,
                                              groupValue: controller.radio,
                                              onChanged: (int? i) {
                                                controller.radio = i!;
                                              },
                                            ),
                                          )),
                                      InkWell(
                                        child: const Text("Cash"),
                                        onTap: () {
                                          controller.radio = 0;
                                        },
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Obx(() => SizedBox(
                                            width: Get.width * 0.2,
                                            child: Radio(
                                              activeColor: AppColors.yellow,
                                              value: 0,
                                              groupValue: controller.radio,
                                              onChanged: (int? i) {
                                                // print(i);

                                                // controller.radio = i!;
                                              },
                                            ),
                                          )),
                                      InkWell(
                                        child: const Text("Cash"),
                                        onTap: () {
                                          // controller.radio = 0;
                                        },
                                      ),
                                    ],
                                  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Obx(() => SizedBox(
                                    width: Get.width * 0.2,
                                    child: Radio(
                                      activeColor: AppColors.yellow,
                                      value: 1,
                                      groupValue: controller.radio,
                                      onChanged: (int? i) {
                                        controller.radio = i!;
                                      },
                                    ),
                                  )),
                              InkWell(
                                child: const Text("Bank"),
                                onTap: () {
                                  controller.radio = 1;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomButton(
                        onPressed: () async {
                          if (controller.type) {
                            bool result =
                                await InternetConnection().hasInternetAccess;
                            if (result) {
                              controller.localFarmerUpdate(true);
                            } else {
                              controller.localFarmerUpdate(false);
                            }
                          } else {
                            bool result =
                                await InternetConnection().hasInternetAccess;

                            if (result) {
                              controller.createFarmerLocal(1);

                              controller.addFarmer().then((onValue) async {
                                await controller.farmerlistController
                                    .getFarmerListLocal()
                                    .then((v) {
                                  Get.back();
                                });
                              });
                            } else {
                              controller
                                  .createFarmerLocal(0)
                                  .then((onValue) async {
                                await controller.farmerlistController
                                    .getFarmerListLocal()
                                    .then((v) {
                                  Get.back();
                                });
                              });
                            }
                          }
                        },
                        title: controller.type ? "Update" : "Save",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
