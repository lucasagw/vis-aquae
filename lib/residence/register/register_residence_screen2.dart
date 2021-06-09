import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register/view_models/register_residence_screen1_view_model.dart';
import 'package:vis_aquae/residence/register/view_models/register_residence_screen2_view_model.dart';
import 'package:vis_aquae/residence/residence_repository.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/button_green.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';

class RegisterResidenceScreen2 extends StatefulWidget {
  @override
  _RegisterResidenceScreen2State createState() =>
      _RegisterResidenceScreen2State();
}

class _RegisterResidenceScreen2State extends State<RegisterResidenceScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, String>();
  RegisterResidenceScreen1ViewModel registerResidenceScreen1ViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final registerResidenceScreen1ViewModelNavigator = ModalRoute.of(context)
        .settings
        .arguments as RegisterResidenceScreen1ViewModel;
    if (registerResidenceScreen1ViewModelNavigator != null) {
      registerResidenceScreen1ViewModel =
          registerResidenceScreen1ViewModelNavigator;

      _formData['estado'] = registerResidenceScreen1ViewModel.cep.uf;
      _formData['cidade'] = registerResidenceScreen1ViewModel.cep.localidade;
    }
  }

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final registerResidenceScreen2ViewModel =
          RegisterResidenceScreen2ViewModel(
        registerResidenceScreen1ViewModel,
        _formData['pais'],
        _formData['estado'],
        _formData['cidade'],
      );
      Navigator.of(context).pushNamed(
        AppRoutes.registerResidence3,
        arguments: registerResidenceScreen2ViewModel,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: media.width,
        height: media.height,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        color: AppColors.backgroundScreen,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarArrowBack(),
              ContainerTitle(title: 'Registrar Residência'),
              Container(
                width: 350,
                height: 400,
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.iconLogoBackgroun,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  width: 380,
                  height: 420,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              initialValue: 'Brasil',
                              readOnly: true,
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Pais',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['pais'] = newValue,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              initialValue: _formData['estado'] ?? '',
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Estado',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['estado'] = newValue,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              initialValue: _formData['cidade'] ?? '',
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Cidade',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['cidade'] = newValue,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: ButtonGreen(
                              label: 'Continuar',
                              onPressed: submit,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AppLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
