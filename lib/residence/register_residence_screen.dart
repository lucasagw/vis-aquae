import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/shared/widgets/logo_with_background.dart';

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
        color: AppColors.backgroundScreen,
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            ContainerTitle(title: 'Registrar Residencia'),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Preencha o campo.';
                      return null;
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            LogoWithBackgound(),
          ],
        ),
      ),
    );
  }
}
