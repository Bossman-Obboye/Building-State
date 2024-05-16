import 'package:building/second_project/components/colors.dart';
import 'package:building/second_project/state_managers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class If_EmptyNoticeCard extends StatelessWidget {
  const If_EmptyNoticeCard({
    super.key,
    // this is defined arrangement of text, don't alter any thing
    this.message = '''Seems like we dont have any 
            thing here yet.
          Let go shopping!''',
    this.navigateToHome = true,
  });
  final String message;
  final bool navigateToHome;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: size(context).height * 0.4,
      width: 300,
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size(context).height * 0.02,
            ),
            const ImageIcon(
              size: 120,
              AssetImage('lib/second_project/my_assets/oops.png'),
            ),
            SizedBox(
              height: size(context).height * 0.02,
            ),
            Text(
              message,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size(context).width * 0.04),
            ),
            SizedBox(
              height: size(context).height * 0.04, 
            ),
            TextButton(
              onPressed: () {
                if (navigateToHome) {
                  (context.read<ItemProvider>().bottomNavBarItemOnTap(0));
                }
              },
              child: const Text(
                'Go to home',
                style: TextStyle(color: callToAction),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
