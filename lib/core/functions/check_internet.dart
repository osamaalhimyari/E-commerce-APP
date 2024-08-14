import 'dart:io';

Future<bool> checkInternet([bool isLocal = false]) async {
  try {
    var result = await InternetAddress.lookup("google.com");
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty || isLocal;
  } on SocketException catch (_) {
    return false;
  }
}
