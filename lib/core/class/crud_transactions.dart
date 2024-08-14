import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce1/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

import 'status_request.dart';

var res = true;

class CrudTrans {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
    if (await checkInternet() || res) {
      var response = await http.post(Uri.parse(linkUrl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailur);
      }
    } else {
      return const Left(StatusRequest.offlineFailur);
    }
    // } catch (_) {
    //   return const Left(StatusRequest.serverException);
    // }
  }
}