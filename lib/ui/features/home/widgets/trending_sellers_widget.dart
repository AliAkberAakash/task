import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'package:audacity_task/ui/features/home/widgets/trending_seller_item_card.dart';
import 'package:audacity_task/utils/dimens.dart';
import 'package:audacity_task/utils/spacers.dart';
import 'package:flutter/material.dart';

class TrendingSellersWidget extends StatelessWidget {

  final List<TrendingSellerResponse> response;
  final double height;

  const TrendingSellersWidget({
    Key? key,
    required this.response,
    required this.height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: height,
        padding: EdgeInsets.all(dp10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Trending Sellers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: dp18,
              ),
            ),
            VSpacer20(),
            Expanded(
              child: Container(
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: response.length,
                  itemBuilder: (ctx, idx){
                    return TrendingSellerItemCard(
                        response: response[idx],
                        height: dp180,
                        width: dp120,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
