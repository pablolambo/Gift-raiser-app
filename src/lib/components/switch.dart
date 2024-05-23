import 'package:flutter/material.dart';

class StatusSwitch extends StatefulWidget {
  const StatusSwitch({super.key});

  @override
  State<StatusSwitch> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<StatusSwitch> {
  bool light0 = true;
  bool light1 = true;

  final WidgetStateProperty<Icon?> thumbIcon =
      WidgetStateProperty.resolveWith<Icon?>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
        Text('Show active'),
      ],
    );
  }
}
