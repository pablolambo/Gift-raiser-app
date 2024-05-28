import 'package:flutter/material.dart';

import 'components/switch.dart';

class AccountPageWrapper extends StatefulWidget {
  final List<Fundraiser> fundraisers;

  const AccountPageWrapper({Key? key, required this.fundraisers}) : super(key: key);

  @override
  State<AccountPageWrapper> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPageWrapper> {
  bool showActiveGifts = true;

  void toggleSwitch(bool value) {
    setState(() {
      showActiveGifts = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AccountPage(
      showActiveGifts: showActiveGifts,
      onToggleGifts: toggleSwitch,
      fundraisers: [],);
  }
}

class Fundraiser {
  final String title;
  final double cost;
  final String endDate;

  Fundraiser({
    required this.title,
    required this.cost,
    required this.endDate,
  });
}

class AccountPage extends StatelessWidget {
  final bool showActiveGifts;
  final Function(bool) onToggleGifts;
  final List<Fundraiser> fundraisers;

  const AccountPage({
    required this.showActiveGifts,
    required this.onToggleGifts,
    required this.fundraisers,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              alignment: Alignment.topCenter,
              color: Color(0xFF08571E),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  Text(
                    'Wojciech Wąsacz',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    '+48 552 851 984',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                StatusSwitch(onChanged: onToggleGifts),
                SizedBox(height: 10),
                if (showActiveGifts)
                  ...fundraisers.map((fundraiser) => ListTile(
                        leading: Image.asset('assets/gift_icon.png'),
                        title: Text(fundraiser.title),
                        subtitle: Text('\$${fundraiser.cost} until ${fundraiser.endDate}'),
                        minLeadingWidth: 10,
                        horizontalTitleGap: 10,
                      ))
                else ...[
                  ListTile(
                    leading: Opacity(
                      opacity: 0.5,
                      child: Image.asset('assets/gift_icon.png'),
                    ),
                    title: Text(
                      'Gift for Agnieszka',
                      style: TextStyle(color: Colors.grey),
                    ),
                    subtitle: Text(
                      '\$200 until 02.02.2024',
                      style: TextStyle(color: Colors.grey),
                    ),
                    minLeadingWidth: 10,
                    horizontalTitleGap: 10,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
