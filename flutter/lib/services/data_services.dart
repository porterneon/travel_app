import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/constants.dart';
import 'package:travel_app/models/data_model.dart';

class DataServices {
  String baseUrl = ApiUrl;

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/Places';
    try {
      var res = await http.get(Uri.parse(baseUrl + apiUrl));

      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }

    return <DataModel>[];
  }
}
