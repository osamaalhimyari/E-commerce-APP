import 'dart:io';

Future<bool> checkInternet([String link = "google.com"]) async {
  try {
    var result = await InternetAddress.lookup(link);
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
