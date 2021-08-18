import 'dart:async';

import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import "../../../data/models/message_response.dart";
import '../../../data/repositories/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final Repository repository;

  HomeBloc({required this.repository}) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    // if(event is GetMessageEvent){
    //   try{
    //     yield HomeLoadingState();
    //     final response = await repository.getMessage();
    //     /*print(response.toJson());*/
    //     yield HomeLoadedState(response: response);
    //   }on Exception {
    //     yield HomeFailureState();
    //     print("Exception");
    //   }
    // }

    if(event is GetTrendingSellerEvent){
      try{
        yield HomeLoadingState();
        final response = await repository.getTrendingSellers();
        print("in block $response");

        yield HomeTrendingSellerLoadedState(response: response);

      }catch(e){
        yield HomeFailureState();
        print("Exception $e");
      }
    }

  }
}
