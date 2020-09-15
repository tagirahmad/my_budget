import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_budget/bloc/money_movement_item_bloc.dart';
import 'package:my_budget/configs/size_config.dart';
import 'package:my_budget/models/money_movement_item.dart';
import 'package:my_budget/statics/styles.dart';
import 'package:my_budget/widgets/available_balance.dart';
import 'package:my_budget/widgets/money_movement_widget.dart';
import 'package:my_budget/widgets/welcome_home_widget.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class HomePage extends StatelessWidget {
  List<MoneyMovementItem> items = [
    MoneyMovementItem(
        id: 0,
        dateTime: DateTime(2020, 9, 13, 0, 30),
        moneyCount: -20.0,
        text: 'Money Sent to Tony Stark'),
    MoneyMovementItem(
        id: 1,
        dateTime: DateTime(2019, 12, 2, 0, 30),
        moneyCount: -30.0,
        text: 'Money Sent to Bobby Stark'),
    MoneyMovementItem(
        id: 2,
        dateTime: DateTime(2019, 12, 1, 0, 30),
        moneyCount: -40.0,
        text: 'Money Sent to Jack Stark'),
    MoneyMovementItem(
        id: 3,
        dateTime: DateTime(2019, 12, 22, 0, 30),
        moneyCount: -50.0,
        text: 'Money Sent to Jack Stark'),
    MoneyMovementItem(
        id: 4,
        dateTime: DateTime(2019, 12, 22, 1, 30),
        moneyCount: -60.0,
        text: 'Money Sent to Jack Stark'),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // items.sort((a, b) {
    //   return b.dateTime.compareTo(a.dateTime);
    // });
    DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: Color(0xFFF3F3F3),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              WelcomeHomeWidget(),
              SizedBox(
                height: 15,
              ),
              AvailableBalance(),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child:
                    BlocBuilder<MoneyMovementItemBloc, MoneyMovementItemState>(
                  builder: (context, state) {
                    if (state is MoneyMovementItemInitial) {
                      return Center(
                        child: Text('Not added any spendings/earnings yet.'),
                      );
                    } else if (state is MoneyMovementItemStartedLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is MoneyMovementItemLoadingSuccess) {
                      if (state.moneyMovementItems == null || state == null) {
                        return Center(
                          child: Text('Not added any spendings/earnings yet.'),
                        );
                      } else if (state.moneyMovementItems != null) {
                        return StickyGroupedListView<MoneyMovementItem, String>(
                          elements: state.moneyMovementItems,
                          groupBy: (dynamic element) =>
                              DateFormat('yMMMMd').format(element.dateTime),
                          groupSeparatorBuilder: (dynamic element) => Container(
                            color: Color(0xFFF3F3F3),
                            child: Text(
                              element.dateTime.day != now.day
                                  ? DateFormat('MMMd').format(element.dateTime)
                                  : 'Today',
                              style: Styles.dateSeparatorText,
                            ),
                          ),
                          itemBuilder: (context, MoneyMovementItem element) =>
                              MoneyMovementWidget(
                            moneyMovementItem: element,
                          ),
                          itemScrollController: GroupedItemScrollController(),
                          order: StickyGroupedListOrder.DESC,
                        );
                      } else if (state is FailureState) {
                        return Center(child: Text('error'));
                      } else {
                        return Center(
                          child: Text('something weird happened'),
                        );
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
