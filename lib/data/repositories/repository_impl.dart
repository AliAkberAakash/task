import 'dart:convert';
import 'dart:io';

import 'package:audacity_task/core/failure/exceptions/network_exception.dart';
import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'package:audacity_task/utils/shared_pref_utils.dart';

import '../../core/network/network_info.dart';
import '../datasources/local_datasource/local_datasource.dart';
import '../datasources/remote_datasource/remote_datasource.dart';
import '../models/message_response.dart';
import 'repository.dart';

class RepositoryImpl extends Repository{

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.localDataSource});


  @override
  Future<MessageResponse> getMessage() async{
    if(await networkInfo.isConnected) {
      final response = await remoteDataSource.getMessage();
      if (response.success) {
        localDataSource.setMessageResponse(response); //if there is data then store it in db
      }
    }
    return localDataSource.getMessageResponse(); // always return local data
  }

  @override
  Future<List<TrendingSellerResponse>> getTrendingSellers() async{
      if(await networkInfo.isConnected){
        final response = await remoteDataSource.getTrendingSellers();
        await SharedPrefUtil.writeStringList(
            "trending_sellers", response.map((e) => jsonEncode(e.toJson())).toList());
        return response;
      }else return getLocalTrendingSellers();
  }

  @override
  Future<List<TrendingSellerResponse>> getLocalTrendingSellers() async{
    try {
      final responseString = await SharedPrefUtil.getStringList("trending_sellers");

      var response = responseString.map((e) =>
          TrendingSellerResponse.fromJson(jsonDecode(e))).toList();

      return response;
    }catch(e){
      print(e);
    }

    return Future.value(null);
  }

}