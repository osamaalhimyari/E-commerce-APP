import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetPassword/verfy_code_controller.dart';
import '../../../../core/localization/langs/translation.dart';
import '../../../../core/shared/loading.dart';
import '../../../widget/auth/custom_text_body.dart';

class VerfyCode extends StatelessWidget {
  const VerfyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Translate.verfyCode.tr,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<VerfyCodeControllerImp>(
          builder: (controller) => controller.loading()
              ? const SharedLoading()
              : Container(
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
                      borderColor: const Color(0xFF512DA8),

                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        controller.checkCode(verificationCode);
                      }, // end onSubmit
                    ),
                    const SizedBox(height: 25),
                  ]),
                )),
    );
  }
}
