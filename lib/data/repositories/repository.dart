import 'package:audacity_task/data/models/home/trending_seller_response.dart';

import '../models/message_response.dart';

abstract class Repository {
  Future<MessageResponse> getMessage();
  Future<List<TrendingSellerResponse>> getTrendingSellers();
}