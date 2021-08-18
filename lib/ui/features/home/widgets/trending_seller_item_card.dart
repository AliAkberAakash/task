import 'package:audacity_task/data/models/home/trending_seller_response.dart';
import 'package:audacity_task/utils/dimens.dart';
import 'package:audacity_task/utils/my_colors.dart';
import 'package:audacity_task/utils/string_formatter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TrendingSellerItemCard extends StatelessWidget {

  final TrendingSellerResponse response;
  final double height, width;

  const TrendingSellerItemCard({
    Key? key,
    required this.response,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(dp5)),
        child: Container(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              Image.network(
                checkNull(response.sellerItemPhoto),
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),

              Positioned(
                top: dp10,
                left: dp10,
                child: SizedBox(
                  height: dp25,
                  width: dp25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(dp50)),
                      child: Image.network(
                        checkNull(response.sellerProfilePhoto),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  padding: EdgeInsets.all(dp10),
                  color: black.withOpacity(0.3),
                  child: Text(
                    response.sellerName ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
