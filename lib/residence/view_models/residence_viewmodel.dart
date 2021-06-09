import 'package:vis_aquae/shared/models/residence.dart';

class ResidenceViewModel {
  final Residence residence;

  String get id => residence.id;
  String get nome => residence.nome;
  int get qtdMoradores => residence.qtdMoradores;
  String get cep => residence.cep;
  String get pais => residence.pais;
  String get estado => residence.estado;
  String get cidade => residence.cidade;
  String get bairro => residence.bairro;
  String get rua => residence.rua;
  String get numero => residence.numero;
  String get complemento => residence.complemento;

  ResidenceViewModel(this.residence);
}
