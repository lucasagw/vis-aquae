import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/device/device_viewmodel.dart';
import 'package:vis_aquae/residence/view_models/residence_viewmodel.dart';
import 'package:vis_aquae/residence/widgets/text_residence_card.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/button_green.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';

class ResidenceScreen extends StatefulWidget {
  const ResidenceScreen({Key key}) : super(key: key);

  @override
  _ResidenceScreenState createState() => _ResidenceScreenState();
}

class _ResidenceScreenState extends State<ResidenceScreen> {
  ResidenceViewModel residence;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    residence = ModalRoute.of(context).settings.arguments;
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
                child: ContainerTitle(title: 'Residência'),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextResidenceCard('Nome:\n${residence.nome}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard(
                          'Quantidade de Moradores:\n${residence.qtdMoradores}',
                        ),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Cep:\n${residence.cep}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Pais:\n${residence.pais}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Estado:\n${residence.estado}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Cidade:\n${residence.cidade}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Bairro:\n${residence.bairro}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Rua:\n${residence.rua}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard('Número:\n${residence.numero}'),
                        Divider(color: Colors.black38),
                        TextResidenceCard(
                          'Complemento:\n${residence.complemento}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ButtonGreen(
                        label: 'DISPOSITIVOS',
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.deviceScreen,
                            arguments: residence.residence.dispositivos
                                .map(
                                  (device) => DeviceViewModel(
                                    device.nome,
                                    device.consumo,
                                    device.tempoLigado,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AppLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
