// import 'package:ecommerce1/controller/test_ontroller.dart';
// import 'package:ecommerce1/core/class/status_request.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TestView extends StatelessWidget {
//   const TestView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(TestController());
//     return Scaffold(
//       appBar: AppBar(),
//       body: GetBuilder<TestController>(
//         builder: (controller) {
//           if (controller.statusRequest == StatusRequest.loading) {
//             return const Center(child: Text('Loading'));
//           } else if (controller.statusRequest == StatusRequest.offlineFailur) {
//             return const Center(child: Text('offlineFailur'));
//           } else if (controller.statusRequest == StatusRequest.serverFailur) {
//             return const Center(child: Text('serverFailur'));
//           }

//           return ListView.builder(
//             itemCount: controller.data.length,
//             itemBuilder: (context, index) {
//               return Center(child: Text('${controller.data}'));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
