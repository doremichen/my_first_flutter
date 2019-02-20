///
/// Data list view
///
import 'package:flutter/material.dart';

import 'package:flutter_app/model/data_model.dart';
import 'adam_data_card.dart';

class DataList extends StatelessWidget {

  final List<MyData> myDatas;

  DataList({Key key, this.myDatas}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  _buildList(BuildContext context) {
    return ListView.builder(
        itemCount: myDatas.length,
        itemBuilder: (context, id) {
            return DataCard(myData: myDatas[id],);
        },
    );
  }

}





