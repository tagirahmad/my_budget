import 'package:flutter/material.dart';
import 'package:my_budget/configs/size_config.dart';
import 'package:my_budget/statics/styles.dart';

class AvailableBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: SizeConfig.safeBlockHorizontal * 35,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [const Color(0xFFB400FF), const Color(0xFF0279FF)],
              tileMode: TileMode.repeated,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Available balance',
                    style: Styles.availableBalanceText,
                  ),
                  Text('Mon, June 27,2109', style: Styles.availableBalanceDate),
                ],
              ),
              Text(
                '\$32,000',
                style: Styles.availableBalanceCount,
              )
            ],
          ),
        ),
        Positioned(
            bottom: -25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              height: SizeConfig.safeBlockHorizontal * 15,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SPENT',
                          style: Styles.spentMoneyText,
                        ),
                        Text(
                          '\$160.0',
                          style: Styles.spentMoneyCount,
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: Color(0xFF707070),
                    width: 0.1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'INCOME',
                          style: Styles.incomeMoneyText,
                        ),
                        Text('\$160.0', style: Styles.incomeMoneyCount)
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
