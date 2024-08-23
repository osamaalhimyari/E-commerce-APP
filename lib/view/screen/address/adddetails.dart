import 'package:ecommerce2/view/widget/auth/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/adddetails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/auth/custom_text_form.dart';

class AddressAddDetailsPage extends StatelessWidget {
  const AddressAddDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AddAddressDetailsController controller =
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                child: ListView(children: [
                  CustomTextFormAuth(
                    hintText: "city",
                    lableText: "city",
                    icon: const Icon(Icons.location_city),
                    controller: controller.city,
                    validator: (val) {
                      return null;
                    },
                  ),
                  CustomTextFormAuth(
                    hintText: "street",
                    lableText: "street",
                    icon: const Icon(Icons.streetview),
                    controller: controller.street,
                    validator: (val) {
                      return null;
                    },
                  ),
                  CustomTextFormAuth(
                    hintText: "name",
                    lableText: "name",
                    icon: const Icon(Icons.near_me),
                    controller: controller.name,
                    validator: (val) {
                      return null;
                    },
                  ),
                  CustomButtonAuth(
                    text: "Add",
                    onPressed: () {
                      controller.addAddress();
                    },
                  )
                ])),
          )),
    );
  }
}
