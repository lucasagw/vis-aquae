import 'package:flutter/material.dart';

class RegisterResidenceScreen extends StatefulWidget {
  @override
  _RegisterResidenceScreenState createState() =>
      _RegisterResidenceScreenState();
}

class _RegisterResidenceScreenState extends State<RegisterResidenceScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Preencha o campo.";
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
