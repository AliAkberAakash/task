import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/pages/empty_page.dart';
import '../../../core/pages/loading_pge.dart';
import '../../../data/models/message_response.dart';
import '../../../data/repositories/repository.dart';
import '../../../di/dependency_injection.dart';
import 'home_bloc.dart';
import '../../../utils/string_formatter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<TrendingSellerResponse>? _response;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home"
        ),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(repository: locator<Repository>())
        ..add(GetTrendingSellerEvent()), //load data at the start
        child: Builder(
          builder: (ctxB){
            print("Event was loaded");
            return BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state){
                if(state is HomeLoadingState){
                  return LoadingPage();
                }else if(state is HomeTrendingSellerLoadedState) {
                  _response = state.response; //in case we need the response
                  return Center(
                    child: Text(
                      checkNull(_response?[0].sellerName),
                    ),
                  );
                }
                return EmptyPage(message: "Failed to load data from the server",);
              },
            );
          },
        ),
      ),
    );
  }
}
