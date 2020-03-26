class Usuario {
  String login;
  String nome;
  String email;
  String token;
  List<String> roles;

  Usuario({this.login, this.nome, this.email, this.token, this.roles});

  Usuario.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    nome = json['nome'];
    email = json['email'];
    token = json['token'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['token'] = this.token;
    data['roles'] = this.roles;
    return data;
  }
}
