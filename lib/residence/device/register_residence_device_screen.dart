import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/residence/device/devices_viewmodels.dart';
import 'package:vis_aquae/residence/view_models/residences_viewmodel.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/button_green.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';

class RegisterResidenceDeviceScreen extends StatefulWidget {
  const RegisterResidenceDeviceScreen({Key key}) : super(key: key);

  @override
  _RegisterResidenceDeviceScreenState createState() =>
      _RegisterResidenceDeviceScreenState();
}

class _RegisterResidenceDeviceScreenState
    extends State<RegisterResidenceDeviceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, dynamic>();
  DeviceViewModel dropdownValue;

  @override
  void initState() {
    super.initState();
    loadDevices();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String idResidence = ModalRoute.of(context).settings.arguments;
    if (idResidence != null) _formData['id_residencia'] = idResidence;
  }

  void loadDevices() async {
    await Provider.of<DevicesViewModels>(context, listen: false).loadDevices();
    dropdownValue =
        Provider.of<DevicesViewModels>(context, listen: false).deviceByIndex(0);
  }

  void submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await Provider.of<ResidencesViewModel>(context, listen: false)
            .addResidenceDevice(
          _formData['id_dispositivo'],
          _formData['id_residencia'],
          _formData['tempo_ligado'],
        );
      } catch (e) {
        developer.log(e.toString());
      }

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Dispositivo Cadastrado'),
          content: Icon(Icons.done_outline),
        ),
      );

      await Future.delayed(Duration(seconds: 3));

      Navigator.of(context).popUntil(
        ModalRoute.withName(AppRoutes.residencesScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.backgroundScreen,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarArrowBack(),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ContainerTitle(title: 'Registrar Dispositivo'),
              ),
              Card(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Dispositivos:'),
                          Consumer<DevicesViewModels>(
                            builder: (_, devicesViewModel, __) =>
                                DropdownButton<DeviceViewModel>(
                              value: dropdownValue,
                              items: devicesViewModel.devices
                                  .map(
                                    (device) =>
                                        DropdownMenuItem<DeviceViewModel>(
                                      value: device,
                                      child: SizedBox(
                                        width: 200,
                                        child: Text(
                                          device.nome,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  dropdownValue = value;
                                  _formData['id_dispositivo'] = value.id;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          dropdownValue != null ? dropdownValue.nome : '',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: AppInputDecoration.inputDecoration(
                            labelText: 'Tempo Ligado',
                          ),
                          keyboardType: TextInputType.text,
                          onSaved: (newValue) =>
                              _formData['tempo_ligado'] = newValue,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty)
                              return 'Preencha o campo.';
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ButtonGreen(
                          label: 'CADASTRAR',
                          onPressed: submit,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AppLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
