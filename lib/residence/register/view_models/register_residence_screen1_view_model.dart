import 'package:vis_aquae/shared/models/cep.dart';

class RegisterResidenceScreen1ViewModel {
  final String nome;
  final int qtdMoradores;
  final Cep cep;

  RegisterResidenceScreen1ViewModel(
    this.cep,
    this.nome,
    this.qtdMoradores,
  );

  factory RegisterResidenceScreen1ViewModel.fromJson(
          Map<String, dynamic> json) =>
      RegisterResidenceScreen1ViewModel(
        Cep.fromJson(json['cep']),
        json['nome'],
        json['qtdMoradores'],
      );
}
