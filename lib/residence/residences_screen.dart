import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/view_models/residences_viewmodel.dart';
import 'package:vis_aquae/residence/widgets/residence_card.dart';
import 'package:vis_aquae/shared/widgets/app_bar_arrow_back.dart';
import 'package:vis_aquae/shared/widgets/app_logo.dart';
import 'package:vis_aquae/shared/widgets/container_title.dart';

class ResidencesScreen extends StatefulWidget {
  const ResidencesScreen({Key key}) : super(key: key);

  @override
  _ResidencesScreenState createState() => _ResidencesScreenState();
}

class _ResidencesScreenState extends State<ResidencesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ResidencesViewModel>(context, listen: false).loadResidences();
  }

  @override
  Widget build(BuildContext context) {
    final residencesViewModel = Provider.of<ResidencesViewModel>(context);

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
                        style: AppButtonStyles.appButtonDark,
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
                    return ResidenceCard(
                      residenceViewModel: residenceViewModel,
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
