class Medico {
  String _nome;
  String _cpf;
  String _email;
  String _celular;
  String _senha;
  String _especialidade;
  String _cnpj;
  String _endereco;
  String _cidade;


  Medico();

  Map<String, dynamic> toMap(){
      Map<String, dynamic> map = {
        "nome" : this.nome,
        "cpf" : this.cpf,
        "email" : this.email,
        "celular" : this.celular,
        "especialidade" : this.especialidade,
        "cnpj" : this.cnpj,
        "endereco" : this.endereco,
        "cidade" : this.cidade,
     
    };
    return map;
  }
  
 
  String get cidade => _cidade;
  String get nome => _nome;
  String get cpf => _cpf;
  String get email => _email;
  String get celular => _celular;
  String get senha => _senha;
  String get especialidade => _especialidade;
  String get cnpj => _cnpj;
  String get endereco => _endereco;
  
  set endereco(String value) {
    _endereco = value;
  }

   set cnpj(String value) {
    _cnpj = value;
  }

 set especialidade(String value) {
    _especialidade = value;
  }

  set nome(String value) {
    _nome = value;
  }

  set cpf(String value) {
    _cpf = value;
  }

  set email(String value) {
    _email = value;
  }

  set celular(String value) {
    _celular = value;
  }

  set senha(String value) {
    _senha = value;
  }
  set cidade(String value) => _cidade = value;
}