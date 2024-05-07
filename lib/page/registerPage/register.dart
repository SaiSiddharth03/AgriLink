import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:a2/page/home_page.dart';

class RegisterPage extends StatefulWidget {
  final String phoneNum; // Pass the phone number from previous page

  const RegisterPage({super.key, required this.phoneNum, required String typeUser});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isFirstButtonClicked = false;
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = FirebaseAuth.instance.currentUser!; // Assuming user is logged in with phone auth

        // Add user data to Firestore
        final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
        await docRef.set({
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'phoneNumber': widget.phoneNum, // Use phone number from previous page
          'address': _addressController.text,
        });

        // Add onSuccess functionality here
        _onSuccess();

        // Navigate to home page
        _isFirstButtonClicked = true;
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!)),
        );
      }
    }
  }

  void _onSuccess() {
    // Add your onSuccess functionality here, for example, show a dialog or navigate to another page
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Registration successful!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _home(); // Navigate to home page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _home() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) => value!.isEmpty ? 'Please enter your address' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Register'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                      onPressed: () {
                          _home();

                      },
                      child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }


}