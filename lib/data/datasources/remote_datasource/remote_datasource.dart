import 'package:audacity_task/data/models/home/trending_seller_response.dart';

import '../../models/message_response.dart';

abstract class RemoteDataSource {
  /// Calls [BASE_URL]
  ///
  /// returns a [MessageResponse] on success
  Future<MessageResponse> getMessage();

  Future<List<TrendingSellerResponse>> getTrendingSellers();

}