import 'package:vis_aquae/shared/models/device_residence.dart';

class Residence {
  final String id;
  final String nome;
  final int qtdMoradores;
  final String cep;
  final String pais;
  final String estado;
  final String cidade;
  final String bairro;
  final String rua;
  final String numero;
  final String complemento;
  List<DeviceResidence> dispositivos = [];

  Residence(
    this.id,
    this.nome,
    this.qtdMoradores,
    this.cep,
    this.pais,
    this.estado,
    this.cidade,
    this.bairro,
    this.rua,
    this.numero,
    this.complemento,
  );
}
