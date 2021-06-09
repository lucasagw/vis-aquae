import 'package:flutter/material.dart';
import 'package:vis_aquae/core/core.dart';
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
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                        TextResidenceCard('Nome: ${residence.nome}'),
                        TextResidenceCard(
                          'Quantidade de Moradores: ${residence.qtdMoradores}',
                        ),
                        TextResidenceCard('Cep: ${residence.cep}'),
                        TextResidenceCard('Pais: ${residence.pais}'),
                        TextResidenceCard('Estado: ${residence.estado}'),
                        TextResidenceCard('Cidade: ${residence.cidade}'),
                        TextResidenceCard('Bairro: ${residence.bairro}'),
                        TextResidenceCard('Rua: ${residence.rua}'),
                        TextResidenceCard('Número: ${residence.numero}'),
                        TextResidenceCard(
                          'Complemento: ${residence.complemento}',
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
                        onPressed: () {},
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
