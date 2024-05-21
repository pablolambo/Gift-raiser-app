import 'package:flutter/material.dart';

import 'sign_in_page.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(context),
            SizedBox(height: 16.0),
            _buildTextField(hintText: 'Username', icon: Icons.person),
            SizedBox(height: 16.0),
            _buildTextField(hintText: 'Email', icon: Icons.email),
            SizedBox(height: 16.0),
            _buildTextField(
                hintText: 'Password', icon: Icons.lock, obscureText: true),
            SizedBox(height: 16.0),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sign Up',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
          },
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 16.0,
              color: theme.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData icon,
      bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInPage()),
            );
          },
          child: Text('Sign Up'),
        ),
      ],
    );
  }
}