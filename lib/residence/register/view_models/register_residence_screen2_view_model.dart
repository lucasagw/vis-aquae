import 'package:vis_aquae/residence/register/view_models/register_residence_screen1_view_model.dart';

class RegisterResidenceScreen2ViewModel {
  final RegisterResidenceScreen1ViewModel registerResidenceScreen1ViewModel;
  final String pais;
  final String estado;
  final String cidade;

  RegisterResidenceScreen2ViewModel(
    this.registerResidenceScreen1ViewModel,
    this.pais,
    this.estado,
    this.cidade,
  );
}
