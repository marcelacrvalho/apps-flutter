import 'package:autoa/helpers/navigator.dart';
import 'package:autoa/helpers/widgets/clip.dart';
import 'package:autoa/ui/inicial.dart';
import 'package:autoa/ui/principal.dart';
import 'package:flutter/material.dart';

class CustomizedDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: CustomizedOvalClipper(),
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          width: 400.0,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.3),
                  _listTile(
                    title: Text(
                      'VOLTAR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    clickNavigator: () => _onClick(context, Principal()),
                    leading: Icon(Icons.home, color: Colors.white),
                  ),
                  _listTile(
                    title: Text(
                      'PROCURAR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    clickNavigator: () =>
                        _onClick(context, Principal()), //ENTRAR EM CONTATO
                    leading: Icon(Icons.search, color: Colors.white),
                  ),
                  _listTile(
                    title: Text(
                      'CONTATO',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    clickNavigator: () =>
                        _onClick(context, Principal()), // PROCURAR UM CARRO
                    leading: Icon(Icons.mail, color: Colors.white),
                  ),
                  _listTile(
                    title: Text(
                      'SAIR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    clickNavigator: () => _logout(context),
                    leading: Icon(Icons.exit_to_app, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTile({@required leading, @required title, clickNavigator}) {
    return ListTile(
      onTap: clickNavigator,
      leading: leading,
      title: title,
    );
  }

  void _onClick(context, proximaPagina) {
    navigator(context, proximaPagina);
  }

  void _logout(context) {
    navigatorPop(context);
    navigatorReplacement(context, Inicial());
  }
}
