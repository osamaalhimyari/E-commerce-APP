// import 'package:flutter/material.dart';

// import 'core/functions/check_internet.dart';

// class TestWidget extends StatefulWidget {
//   const TestWidget({super.key});

//   @override
//   State<TestWidget> createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<TestWidget> {
//   // ignore: prefer_typing_uninitialized_variables
//   var res;
//   initData() async {
//     res = await checkInternet();
//     debugPrint('$res');
//   }

//   @override
//   void initState() {
//     initData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('for test'),
//       ),
//       body: Container(
//           padding: const EdgeInsets.only(top: 20),
//           child: ListView(
//             children: const [],
//           )),
//     );
//   }
// }
import '/controller/test_ontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/class/handlingdataview.dart';
import 'core/constants/color_app.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
          title: const Text('data'), backgroundColor: AppColors.prymarColor),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Center(
                      child: Text('${controller.data[index]['user_name']}'));
                },
              ));
        },
      ),
    );
  }
}
