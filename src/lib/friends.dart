import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<String> peopleNames = ['Agnieszka Nowakowska', 'Robert Kowalski', 'Adam Nowak'];
  List<String> peopleWealth = ['\$\$', '\$', '\$\$\$'];
  List<String> peopleSex = ['K', 'M', 'M'];
  final List<String> filters = ['Woman', 'Man', '\$', '\$\$', '\$\$\$'];
  List<String> selectedFilters = [];

  List<String> filteredNames = [];
  List<String> filteredWealth = [];
  List<String> filteredImages = [];

  bool sortAscending = true;

  @override
  void initState() {
    super.initState();
    applyFilters();
  }

  void applyFilters() {
    filteredNames.clear();
    filteredWealth.clear();
    filteredImages.clear();

    List<int> indices = [];

    for (int i = 0; i < peopleNames.length; i++) {
      bool addToFiltered = true;

      if (selectedFilters.contains('Woman') && peopleSex[i] != 'K') {
        addToFiltered = false;
      }
      if (selectedFilters.contains('Man') && peopleSex[i] != 'M') {
        addToFiltered = false;
      }
      if (selectedFilters.contains('\$') && peopleWealth[i] != '\$') {
        addToFiltered = false;
      }
      if (selectedFilters.contains('\$\$') && peopleWealth[i] != '\$\$') {
        addToFiltered = false;
      }
      if (selectedFilters.contains('\$\$\$') && peopleWealth[i] != '\$\$\$') {
        addToFiltered = false;
      }

      if (addToFiltered) {
        filteredNames.add(peopleNames[i]);
        filteredWealth.add(peopleWealth[i]);
        filteredImages.add('assets/profile_picture${i + 2}.png');
        indices.add(i);
      }
    }

    if (sortAscending) {
      indices.sort((a, b) => peopleWealth[a].compareTo(peopleWealth[b]));
    } else {
      indices.sort((a, b) => peopleWealth[b].compareTo(peopleWealth[a]));
    }

    filteredNames = indices.map((index) => peopleNames[index]).toList();
    filteredWealth = indices.map((index) => peopleWealth[index]).toList();
    filteredImages = indices.map((index) => 'assets/profile_picture${index + 2}.png').toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friends',
                  style: TextStyle(
                    fontSize: 36,
                  ),
                ),
                SizedBox(width: 36),
                IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Filter'),
                          content: Container(
                            constraints: BoxConstraints(maxHeight: 250, maxWidth: 200),
                            child: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return buildFilters(setState);
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                applyFilters();
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
                  onPressed: () {
                    setState(() {
                      sortAscending = !sortAscending;
                    });
                    applyFilters();
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: filteredNames.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(filteredImages[index]),
              ),
              title: Text(filteredNames[index]),
              subtitle: Text(filteredWealth[index]),
            );
          },
        ),
      ],
    );
  }

  Widget buildFilters(StateSetter setState) {
    return Column(
      children: filters
          .map((filter) => ListTile(
                title: Text(filter),
                leading: Checkbox(
                  value: selectedFilters.contains(filter),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        selectedFilters.add(filter);
                      } else {
                        selectedFilters.remove(filter);
                      }
                    });
                  },
                ),
              ))
          .toList(),
    );
  }
}
