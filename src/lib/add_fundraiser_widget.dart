import 'package:flutter/material.dart';
import 'main.dart';

class AddFundraiserWidget extends StatefulWidget {
  const AddFundraiserWidget({super.key});

  @override
  _AddFundraiserWidgetState createState() => _AddFundraiserWidgetState();
}

class _AddFundraiserWidgetState extends State<AddFundraiserWidget> {
  DateTime? _selectedDate;
  List<String> peopleNames = ['Agnieszka Nowakowska', 'Robert Kowalski', 'Adam Nowak'];
  List<String> peopleWealth = ['\$\$', '\$', '\$\$\$'];
  List<String> selectedPeople = [];
  List<String> selectedPeopleWealth = [];

  void _addPerson(BuildContext context) {
      showDialog(
       context: context,
       builder: (BuildContext context){
          const double itemHeight = 56;
          double dialogHeight = itemHeight * peopleNames.length;

          return Dialog(
              child: Container(
                height: dialogHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: peopleNames.asMap().entries.map((entry){
                      int index = entry.key;
                      String name = entry.value;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedPeople.add(name);
                              selectedPeopleWealth.add(peopleWealth[index]);
                              peopleNames.remove(name);
                              peopleWealth.remove(peopleWealth[index]);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('$name: ${peopleWealth[index]}'),
                        ),
                      );
                  }).toList(),
                ),
              ),
          );
       },
      );
  }

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
        Column(
          children: selectedPeople.map((person) => Padding(
            padding: const EdgeInsets.all(0.0),
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  peopleNames.add(person);
                  peopleWealth.add(selectedPeopleWealth[selectedPeople.indexOf(person)]);
                  selectedPeople.remove(person);
                  selectedPeopleWealth.remove(peopleWealth[peopleNames.indexOf(person)]);
                 });
                },
                icon: Icon(Icons.remove_circle),
                label: Text(person),
            ),
          )).toList(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () => _addPerson(context),
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Success'),
                    content: Text('Your operation was successful.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
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

// class AddPerson extends StatelessWidget {
//   final List<String> filters = ['Woman', 'Man', '\$', '\$\$', '\$\$\$'];
//   List<String> selectedFilters = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Gift fundraiser'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Add a person',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 36),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.filter_list),
//                   onPressed: () {
//                     showDialog(context: 
//                     context, builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text('Filter'),
//                         content: Column(
//                           children: filters
//                               .map((filter) => CheckboxListTile(
//                                     title: Text(filter),
//                                     value: false,
//                                     onChanged: (bool? value) {},
//                                   ))
//                               .toList(),
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Text('OK'),
//                           ),
//                         ],
//                       );
//                     },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 labelText: 'Search',
//                 fillColor: Color.fromARGB(240, 240, 240, 240),
//                 filled: true,
//               ),
//             ),
//           ),
//           // Add your ListView or other content here
//         ],
//       ),
//     );
//   }
// }