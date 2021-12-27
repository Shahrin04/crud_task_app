import 'package:crud_task_app/data/model/get_data_model.dart';

class GetDataResponse {
  final List<GetDataModel> getDataList;

  GetDataResponse({this.getDataList});

  factory GetDataResponse.fromMap(Map<String, dynamic> map) {
    return GetDataResponse(
        getDataList:
            (map['data'] as List).map((i) => GetDataModel.fromMap(i)).toList());
  }
}
