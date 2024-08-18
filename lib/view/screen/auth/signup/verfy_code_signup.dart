// ignore_for_file: file_names

import 'package:ecommerce2/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../../controller/auth/signup/verfy_code_signup_controller.dart';
import '../../../widget/auth/custom_text_body.dart';

class VerfyCodeSignUp extends StatelessWidget {
  const VerfyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Translate.verfyCode.tr,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          centerTitle: true,
        ),
        body: GetBuilder<VerfyCodeSignUpControllerImp>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                returnChildOnFilure: false,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  alignment: Alignment.center,
                  child: ListView(children: [
                    const SizedBox(height: 20),
                    CustomBodyAuth(text: Translate.verfyCodeMessage.tr),
                    const SizedBox(height: 65),
                    OtpTextField(
                      fieldWidth: 50,
                      borderRadius: BorderRadius.circular(12),
                      numberOfFields: 5,
                      // borderColor:
                      // Color.fromARGB(255, 45, 76, 168),

                      enabledBorderColor: controller.approved
                          ? const Color.fromARGB(255, 160, 191, 163)
                          : const Color.fromARGB(255, 168, 45, 45),

                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                        controller.changeApproved(true);
                      },

                      //runs when every textfield is filled
                      onSubmit:
                          // controller.checkCode,
                          (String verificationCode) {
                        controller.checkCode(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 25),
                  ]),
                ));
          },
        ));
  }
}
