import 'dart:convert';

import 'package:audacity_task/core/network/api_base_helper.dart';
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

}