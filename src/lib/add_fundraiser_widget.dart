import 'package:flutter/material.dart';

import 'components/switch.dart';
import 'main.dart';

class AddFundraiserWidget extends StatefulWidget {
  const AddFundraiserWidget({Key? key}) : super(key: key);

  @override
  _AddFundraiserWidgetState createState() => _AddFundraiserWidgetState();
}

class _AddFundraiserWidgetState extends State<AddFundraiserWidget> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            'Create a fundraiser',
            style: TextStyle(
              fontSize: 36,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
              fillColor: Color.fromARGB(240, 240, 240, 240),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Cost',
              fillColor: Color.fromARGB(240, 240, 240, 240),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: _selectedDate == null
                      ? 'End date dd/mm/yyyy'
                      : 'End date: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  fillColor: Color.fromARGB(240, 240, 240, 240),
                  filled: true,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  // TODO: Implement this
                },
                icon: Icon(
                  Icons.add_circle,
                  size: 36,
                ),
                label: Text(
                  'Add a person to the fundraiser',
                ),
              ),
            ],
          ),
        ),
Expanded(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
           TextButton(
            onPressed: () {
              // TODO: Implement this
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary,
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.center,
                'Create',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          SizedBox(
            width: double.infinity,
            child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            style: ButtonStyle(
              alignment: Alignment.center,
            ),
            child: Text(
              textAlign: TextAlign.center,
              'Dismiss',
                ),
               ),
          ),
            ],
          ),
         ),
        ),
      ],
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
                StatusSwitch( ),
                SizedBox(height: 10),
                ListTile(
                  leading: Image.asset('assets/gift_icon.png'),
                  title: Text('Gift for Robert'),
                  subtitle: Text('\$100 until 08.06.2024'),
                  minLeadingWidth: 10,
                  horizontalTitleGap: 10,
                ),
                ListTile(
                  leading: Image.asset('assets/gift_icon.png'),
                  title: Text('Gift for Adam'),
                  subtitle: Text('\$150 until 10.12.2024'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}