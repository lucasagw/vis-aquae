import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/register/view_models/register_residence_screen1_view_model.dart';
import 'package:vis_aquae/shared/widgets/button_green.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';

class RegisterResidenceScreen1 extends StatefulWidget {
  @override
  _RegisterResidenceScreen1State createState() =>
      _RegisterResidenceScreen1State();
}

class _RegisterResidenceScreen1State extends State<RegisterResidenceScreen1> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, String>();

  void submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final registerResidenceScreen1ViewModel =
          RegisterResidenceScreen1ViewModel(
        _formData['nome'],
        int.tryParse(_formData['qtdMoradores']) ?? 0,
        _formData['cep'],
      );
      Navigator.of(context).pushNamed(
        AppRoutes.registerResidence2,
        arguments: registerResidenceScreen1ViewModel,
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
                          TextFormField(
                            cursorColor: Colors.grey,
                            decoration: AppInputDecoration.inputDecoration(
                              labelText: 'Nome',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (newValue) => _formData['nome'] = newValue,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Preencha o campo.';
                              return null;
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: AppInputDecoration.inputDecoration(
                                labelText: 'Quantidade de Moradores',
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (newValue) =>
                                  _formData['qtdMoradores'] = newValue,
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
                                labelText: 'CEP',
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (newValue) =>
                                  _formData['cep'] = newValue,
                              validator: (value) {
                                if (value == null || value.isEmpty)
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
