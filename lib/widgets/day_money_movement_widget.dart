import 'package:flutter/material.dart';
import 'package:my_budget/models/money_movement_item.dart';
import 'package:my_budget/widgets/money_movement_widget.dart';

class DayMoneyMovementWidget extends StatelessWidget {
  const DayMoneyMovementWidget({Key key, @required this.items})
      : super(key: key);
  final List<MoneyMovementItem> items;
  _resolveWidgets(items) {
    for (MoneyMovementItem item in items) {
      return MoneyMovementWidget(
        key: UniqueKey(),
        moneyMovementItem: item,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Today',
              style: TextStyle(
                  color: Color(0xFF3755FF), fontWeight: FontWeight.w500),
            ),
          ),
          _resolveWidgets(items)
        ],
      ),
    );
  }
}
