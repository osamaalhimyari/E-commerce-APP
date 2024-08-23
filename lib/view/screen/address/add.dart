import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/add_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constants/color_app.dart';

class AddressAddPage extends StatelessWidget {
  const AddressAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    // AddressAddingController controllerpage =
    Get.put(AddressAddingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: GetBuilder<AddressAddingController>(
          builder: ((controllerpage) => HandlingDataView(
              statusRequest: controllerpage.statusRequest,
              child: Column(children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerpage.markers.toSet(),
                        onTap: (latlong) {
                          controllerpage.addMarkers(latlong);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {
                            controllerpage.goToPageAddDetailsAddress();
                          },
                          color: AppColors.primaryColor,
                          textColor: Colors.white,
                          child: const Text("اكمال",
                              style: TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
                  ))
              ])))),
    );
  }
}
