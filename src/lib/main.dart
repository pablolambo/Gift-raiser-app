import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'account_page.dart';
import 'add_fundraiser_widget.dart';
import 'sign_in_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Gift raiser',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xFF08571E)),
            primaryColorDark: Color.fromARGB(255, 24, 24, 24),
            fontFamily: 'Roboto'),
        home: SignInPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    AccountPageWrapper(),
    AddFundraiserWidget(),
    FriendsPage(),
  ];


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift fundraiser'),
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'Fundraiser'),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'Friends'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FriendsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
      Center(
        child: Text(
          textAlign: TextAlign.left,
          'Friends',
          style: TextStyle(
            fontSize: 36,
          ),
        ),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_picture2.png'),
        ),
        title: Text('Agnieszka Nowakowska'),
        subtitle: Text('\$\$'),

      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_picture3.png'),
        ),
        title: Text('Robert Kowalski'),
        subtitle: Text('\$'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_picture4.png'),
        ),
        title: Text('Adam Nowak'),
        subtitle: Text('\$\$\$'),
      ),
    ],);
  }
}
