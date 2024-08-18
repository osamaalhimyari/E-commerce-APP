import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/json_image_assets.dart';
import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest? statusRequest;
  final Widget child;
  final bool returnChildOnFilure;
  const HandlingDataView(
      {super.key,
      required this.statusRequest,
      required this.child,
      this.returnChildOnFilure = true});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
            AppJasonImageAsset.loading,
            width: 100,
            height: 100,
          ))
        : statusRequest == StatusRequest.offlineFailur
            ? Center(
                child: Lottie.asset(AppJasonImageAsset.offline,
                    width: 100, height: 100))
            : statusRequest == StatusRequest.serverFailur
                ? Center(
                    child: Lottie.asset(AppJasonImageAsset.server,
                        width: 100, height: 100))
                : statusRequest == StatusRequest.failur
                    ? Center(
                        child: Lottie.asset(AppJasonImageAsset.noData,
                            width: 100, height: 100, repeat: false))
                    : statusRequest == StatusRequest.serverException
                        ? Center(
                            child: Lottie.asset(AppJasonImageAsset.server,
                                width: 100, height: 100, repeat: false))
                        : child;
  }
}

// class HandlingDataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   const HandlingDataRequest(
//       {Key? key, required this.statusRequest, required this.widget})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppJasonImageAsset.loading, width: 100, height: 100))
//         : statusRequest == StatusRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(AppJasonImageAsset.offline,
//                     width: 100, height: 100))
//             : statusRequest == StatusRequest.serverfailure
//                 ? Center(
//                     child: Lottie.asset(AppJasonImageAsset.server,
//                         width: 100, height: 100))
//                 : widget;
//   }
// }
