import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:admin_ecommerce/core/class/status_request.dart';
import 'package:admin_ecommerce/core/constant/constant_scale.dart';
import 'package:admin_ecommerce/core/function/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class Curd {
  final Map<String, String> _header = {
    // 'content-type': 'application/json',
    // 'accept': 'application/json',
    'authorization':
        'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfsf'))}',
  };
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String url, Map<String, dynamic> body) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(url),
          body: body,
        );
        if (response.statusCode >= ConstantScale.statusCode &&
            response.statusCode <= ConstantScale.statusCodeMax) {
          //remove and try catch
          // print("$response : body : ${response.body}");
          var responseBody = jsonDecode(response.body);

          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailur);
        }
      } else {
        return left(StatusRequest.offlineFailur);
      }
    } catch (_) {
      return left(StatusRequest.exceptionFailur);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> postDataWithFile({
    required String url,
    required Map<String, dynamic> body,
    required String fieldFile,
    required File file,
  }) async {
    try {
      if (await checkInternet()) {
        http.MultipartRequest multipartRequest =
            http.MultipartRequest("POST", Uri.parse(url));

        multipartRequest.headers.addAll(_header);

        http.ByteStream stream = http.ByteStream(file.openRead());
        int length = await file.length();

        var multifile = http.MultipartFile(
          fieldFile,
          stream,
          length,
          filename: basename(file.path),
        );
        multipartRequest.files.add(multifile);

        body.forEach((key, value) {
          multipartRequest.fields[key] = value;
        });

        http.StreamedResponse streamedResponse = await multipartRequest.send();

        http.Response response =
            await http.Response.fromStream(streamedResponse);

        if (response.statusCode >= ConstantScale.statusCode &&
            response.statusCode <= ConstantScale.statusCodeMax) {
          //remove and try catch
          // print("$response : body : ${response.body}");
          var responseBody = jsonDecode(response.body);

          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailur);
        }
      } else {
        return left(StatusRequest.offlineFailur);
      }
    } catch (_) {
      return left(StatusRequest.exceptionFailur);
    }
  }
}
