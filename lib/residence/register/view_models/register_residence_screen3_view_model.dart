import 'package:vis_aquae/residence/register/view_models/register_residence_screen2_view_model.dart';

class RegisterResidenceScreen3ViewModel {
  final RegisterResidenceScreen2ViewModel registerResidenceScreen2ViewModel;
  final String bairro;
  final String rua;
  final String numero;
  final String complemento;

  RegisterResidenceScreen3ViewModel(
    this.registerResidenceScreen2ViewModel,
    this.bairro,
    this.rua,
    this.numero,
    this.complemento,
  );
}
