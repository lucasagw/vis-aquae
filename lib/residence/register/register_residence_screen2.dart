import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
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
                            padding: const EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: ButtonGreen(
                              label: 'Continuar',
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  AppRoutes.registerResidence3,
                                );
                              },
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
