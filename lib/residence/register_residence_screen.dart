import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/widgets/button_register.dart';
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
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          color: AppColors.backgroundScreen,
          width: media.width,
          height: media.height,
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
              SingleChildScrollView(
                child: Container(
                  width: 400,
                  height: 450,
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
                      child: ListView(
                        children: <Widget>[
                          TextFormField(
                            cursorColor: Colors.grey,
                            decoration: AppInputDecoration.inputDecoration(
                              labelText: 'Nome',
                            ),
                            keyboardType: TextInputType.text,
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
                              keyboardType: TextInputType.text,
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
                                labelText: 'Pais',
                              ),
                              keyboardType: TextInputType.text,
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
                                labelText: 'Estado',
                              ),
                              keyboardType: TextInputType.text,
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
                                labelText: 'Cidade',
                              ),
                              keyboardType: TextInputType.text,
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
                                labelText: 'Bairro',
                              ),
                              keyboardType: TextInputType.text,
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
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Preencha o campo.';
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 10,
                            ),
                            child: ButtonRegister(
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              LogoWithBackgound(),
            ],
          ),
        ),
      ),
    );
  }
}
