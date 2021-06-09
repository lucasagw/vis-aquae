import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register/view_models/register_residence_screen2_view_model.dart';
import 'package:vis_aquae/residence/residence_viewmodel.dart';

import 'package:vis_aquae/shared/widgets/button_green.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';

class RegisterResidenceScreen3 extends StatefulWidget {
  @override
  _RegisterResidenceScreen3State createState() =>
      _RegisterResidenceScreen3State();
}

class _RegisterResidenceScreen3State extends State<RegisterResidenceScreen3> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, String>();
  RegisterResidenceScreen2ViewModel registerResidenceScreen2ViewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final registerResidenceScreen2ViewModelNavigator = ModalRoute.of(context)
        .settings
        .arguments as RegisterResidenceScreen2ViewModel;
    if (registerResidenceScreen2ViewModelNavigator != null) {
      registerResidenceScreen2ViewModel =
          registerResidenceScreen2ViewModelNavigator;
    }
  }

  void submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Provider.of<ResidenceViewModel>(context, listen: false).addResidence(
        registerResidenceScreen2ViewModel
            .registerResidenceScreen1ViewModel.nome,
        registerResidenceScreen2ViewModel
            .registerResidenceScreen1ViewModel.qtdMoradores,
        registerResidenceScreen2ViewModel.registerResidenceScreen1ViewModel.cep,
        registerResidenceScreen2ViewModel.pais,
        registerResidenceScreen2ViewModel.estado,
        registerResidenceScreen2ViewModel.cidade,
        _formData['bairro'],
        _formData['rua'],
        _formData['numero'],
        _formData['complemento'],
      );

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Residência Cadastrada'),
          content: Icon(Icons.done_outline),
        ),
      );

      await Future.delayed(Duration(seconds: 3));

      Navigator.of(context).popUntil(ModalRoute.withName(AppRoutes.home));
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
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Bairro',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['bairro'] = newValue,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Rua',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['rua'] = newValue,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Número',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['numero'] = newValue,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Complemento',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['complemento'] = newValue,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: ButtonGreen(
                              label: 'Registrar',
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
