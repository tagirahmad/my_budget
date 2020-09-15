import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_budget/configs/size_config.dart';
import 'package:my_budget/models/money_movement_item.dart';
import 'package:my_budget/statics/styles.dart';

class MoneyMovementWidget extends StatefulWidget {
  const MoneyMovementWidget({Key key, @required this.moneyMovementItem})
      : super(key: key);
  final MoneyMovementItem moneyMovementItem;

  @override
  _MoneyMovementWidgetState createState() => _MoneyMovementWidgetState();
}

class _MoneyMovementWidgetState extends State<MoneyMovementWidget> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          active = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          active = false;
        });
      },
      // onVerticalDragStart: (details) {
      //   setState(() {
      //     active = true;
      //   });
      // },
      // onVerticalDragEnd: (details) {
      //   setState(() {
      //     active = false;
      //   });
      // },
      // onVerticalDragDown: (details) {
      //   setState(() {
      //     active = true;
      //   });
      // },
      // onVerticalDragCancel: () {
      //   setState(() {
      //     active = false;
      //   });
      // },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: active ? Colors.white : null,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 0.1, color: Color(0xFF707070)),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Text(widget.moneyMovementItem.dateTime.day.toString(),
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 5.5,
                                fontWeight: FontWeight.bold)),
                        Text(
                            widget.moneyMovementItem.dateTime.day ==
                                    DateTime.now().day
                                ? 'TODAY'
                                : DateFormat('MMM')
                                    .format(widget.moneyMovementItem.dateTime)
                                    .toUpperCase(),
                            style: Styles.monthMMM)
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.moneyMovementItem.text,
                          style: Styles.moneyMovementItemText,
                        ),
                        Text(
                            DateFormat('Hm')
                                .format(widget.moneyMovementItem.dateTime),
                            style: Styles.moneyMovementItemTime)
                      ],
                    ),
                  ),
                ),
                Text(
                  '${widget.moneyMovementItem.moneyCount}\$',
                  style: Styles.moneyMovementItemMoneyCount,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
