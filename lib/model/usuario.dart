class Usuario {
  String _nome;
  String _cpf;
  String _email;
  String _celular;
  String _senha;

  Usuario();

  Map<String, dynamic> toMap(){
      Map<String, dynamic> map = {
        "nome" : this.nome,
        "cpf" : this.cpf,
        "email" : this.email,
        "celular" : this.celular,
     //   "senha" : this.senha,
     
    };
    return map;
  }
   
  String get nome => _nome;
  String get cpf => _cpf;
  String get email => _email;
  String get celular => _celular;
  String get senha => _senha;

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
}
