import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/residences_viewmodel.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';

class ResidenceScreen extends StatefulWidget {
  const ResidenceScreen({Key key}) : super(key: key);

  @override
  _ResidenceScreenState createState() => _ResidenceScreenState();
}

class _ResidenceScreenState extends State<ResidenceScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ResidencesViewModel>(context, listen: false).loadResidences();
  }

  @override
  Widget build(BuildContext context) {
    print('LOAD RESIDENCES');
    final residencesViewModel = Provider.of<ResidencesViewModel>(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.backgroundScreen,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarArrowBack(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ContainerTitle(title: 'Residências'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      color: AppColors.sideBackgroundBlackLight,
                      child: ElevatedButton(
                        child: Text('CADASTRAR RESIDÊNCIA'),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.registerResidence1,
                          );
                        },
                        style: AppButtonStyles.appSideBarStyleButton,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: residencesViewModel.residencesCount,
                  itemBuilder: (BuildContext context, int index) {
                    final residenceViewModel =
                        residencesViewModel.residenceByIndex(index);
                    return Card(
                      child: Column(
                        children: [
                          Text(residenceViewModel.nome),
                          Text(residenceViewModel.cidade),
                          Text(residenceViewModel.bairro),
                          Text(residenceViewModel.cep),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: AppLogo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
