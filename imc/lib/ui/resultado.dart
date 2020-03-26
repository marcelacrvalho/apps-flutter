import 'package:flutter/material.dart';
import 'package:imc/helpers/constantes.dart';
import 'package:imc/helpers/container.dart';

class Resultado extends StatelessWidget {
  final String imc;
  final String imcResultado;
  final String info;

  Resultado(this.imc, this.imcResultado, this.info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _appBody(),
    );
  }

  Widget _appBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _textoInfo(),
              ),
            ),
            Expanded(
              flex: 10,
              child: CustomizedContainer(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        imcResultado,
                        style: TextStyle(color: Colors.green, fontSize: 22.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        imc,
                        style: TXTDESTAQUE,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        info,
                        textAlign: TextAlign.center,
                        style: TXTLABEL,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textoInfo() {
    return Text(
      'SEU RESULTADO',
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }
}
