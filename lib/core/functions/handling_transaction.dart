import '/core/class/status_request.dart';

handlingTransaction(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    if (response['status'] == 'success') {
      return StatusRequest.success;
    }
    return StatusRequest.failur;
  }
}
