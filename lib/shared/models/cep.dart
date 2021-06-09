class Cep {
  final String cep;
  final String logradouro;
  final String uf;
  final String bairro;
  final String localidade;

  Cep(this.cep, this.logradouro, this.uf, this.bairro, this.localidade);

  factory Cep.fromJson(Map<String, dynamic> json) => Cep(
        json['cep'],
        json['logradouro'],
        json['uf'],
        json['bairro'],
        json['localidade'],
      );

  Map<String, dynamic> toJson() => {
        'cep': cep,
        'logradouro': logradouro,
        'uf': uf,
        'bairro': bairro,
        'localidade': localidade
      };
}
