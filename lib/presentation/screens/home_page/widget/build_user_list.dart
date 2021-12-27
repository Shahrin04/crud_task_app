import 'package:crud_task_app/data/model/get_data_model.dart';
import 'package:crud_task_app/data/model/get_data_response.dart';
import 'package:flutter/material.dart';

class BuildUserList extends StatelessWidget {
  final GetDataResponse data;

  const BuildUserList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var ratio = MediaQuery.of(context).size.aspectRatio;

    List<GetDataModel> dataList = data.getDataList;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.01),
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.02, width * 0.05, 0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(dataList[index].avatar),
                radius: ratio * 50,
                backgroundColor: Colors.brown,
              ),
              title: Text(
                  dataList[index].first_name + ' ' + dataList[index].last_name),
              subtitle: Text(dataList[index].email),
            ),
          );
        },
      ),
    );
  }
}
