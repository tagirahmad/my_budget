import 'package:flutter/material.dart';
import 'package:my_budget/statics/styles.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class WelcomeHomeWidget extends StatelessWidget {
  const WelcomeHomeWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _simplePopup() => PopupMenuButton<int>(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF474AFF),
              ),
              height: 40,
              width: 40,
              child: Icon(
                Icons.add,
                color: Colors.white,
              )),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                  onTap: () {
                    print('add spending tapped');
                  },
                  child: Text("Add spending")),
            ),
            PopupMenuItem(
              value: 2,
              child: GestureDetector(
                  onTap: () {
                    print('Add Earning tapped');
                  },
                  child: Text("Add Earning")),
            ),
          ],
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Tagir',
              style: Styles.welcomeHomeText,
            ),
            Text(
              'Welcome',
              style: Styles.welcomeHomeText.copyWith(
                  color: Color(0xFF2699FB), fontWeight: FontWeight.w900),
            ),
          ],
        ),
        // GestureDetector(
        //   onTap: _simplePopup,
        // child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12),
        //       color: Color(0xFF474AFF),
        //     ),
        //     height: 40,
        //     width: 40,
        //     child: Icon(
        //       Icons.add,
        //       color: Colors.white,
        //     )),
        // )
        _simplePopup()
      ],
    );
  }
}
