import 'dart:convert';

import 'package:crud_task_app/data/utils/strings.dart';
import 'package:crud_task_app/data/model/data_model.dart';
import 'package:crud_task_app/data/model/get_data_response.dart';
import 'package:http/http.dart' as http;

class Data {
  Future<DataModel> createUser({DataModel dataModel}) async {
    final result = await http.Client()
        .post(Uri.parse(POST_URL), body: dataModel.toMap());

    if (result.statusCode != 201) {
      throw Exception('status code is not 201');
    } else {
      print(result.body);
      final jsonDecoded = json.decode(result.body);
      return DataModel.fromMap(jsonDecoded);
    }
  }

  Future<GetDataResponse> fetchUser() async {
    final result = await http.Client()
        .get(Uri.parse(GET_URL));

    if (result.statusCode != 200) {
      throw Exception('status code is not 200');
    } else {
      final jsonDecoded = json.decode(result.body);
      return GetDataResponse.fromMap(jsonDecoded);
    }
  }

}
