class Consulta {
  String _nomeMed;
  String _nomeUsu;
  String _idMed;
  String _idUsu;
  String _horario;
  String _endereco;
  String _cidade;
 
 String get nomeMed => _nomeMed;

 set nomeMed(String value) => _nomeMed = value;

 String get nomeUsu => _nomeUsu;

 set nomeUsu(String value) => _nomeUsu = value;

 String get idMed => _idMed;

 set idMed(String value) => _idMed = value;

 String get idUsu => _idUsu;

 set idUsu(String value) => _idUsu = value;

 String get horario => _horario;

 set horario(String value) => _horario = value;

 String get endereco => _endereco;

 set endereco(String value) => _endereco = value;

 String get cidade => _cidade;

 set cidade(String value) => _cidade = value;


  Consulta();

  Map<String, dynamic> toMap(){
      Map<String, dynamic> map = {
        "nomemed" : this.nomeMed,
        "nomeusu" : this.nomeUsu,
        "idmed" : this.idMed,
        "idusu" : this.idUsu,
        "horario": this.horario,
        "endereco" : this.endereco,
        "cidade" : this.cidade,
     
    };
    return map;
  }
  
 
  }

