import 'dart:convert';

import 'package:audacity_task/core/network/api_base_helper.dart';
import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'remote_datasource.dart';
import '../../models/message_response.dart';

class RemoteDataSourceImpl extends RemoteDataSource{

  final ApiBaseHelper helper;

  RemoteDataSourceImpl({required this.helper});

  @override
  Future<MessageResponse> getMessage() async{
    var response = await helper.get("");
    return MessageResponse.fromJson(jsonDecode(response?.data));
  }

  @override
  Future<List<TrendingSellerResponse>> getTrendingSellers() async{
    var response = await helper.getWithParams("", {
      "instanceName":"bd.ezassist.me",
      "opt":"trending_seller"
    });

    List<dynamic> temp = response?.data[0];

    return temp.map((e)=> TrendingSellerResponse.fromJson(e)).toList();
  }

}