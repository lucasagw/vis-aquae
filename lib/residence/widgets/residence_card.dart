import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vis_aquae/core/core.dart';
import 'package:vis_aquae/residence/view_models/residence_viewmodel.dart';
import 'package:vis_aquae/residence/view_models/residences_viewmodel.dart';

class ResidenceCard extends StatelessWidget {
  final ResidenceViewModel residenceViewModel;
  const ResidenceCard({Key key, @required this.residenceViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            residenceViewModel.nome,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.headline6Dark(context),
          ),
          trailing: Container(
            width: 100,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.residenceScreen,
                      arguments: residenceViewModel,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Provider.of<ResidencesViewModel>(context, listen: false)
                        .removeResidence(residenceViewModel.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
