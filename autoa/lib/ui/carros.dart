import 'package:autoa/api/carro.api.dart';
import 'package:autoa/helpers/constantes.dart';
import 'package:autoa/helpers/navigator.dart';
import 'package:autoa/helpers/widgets/drawer.dart';
import 'package:autoa/model/carro.dart';
import 'package:autoa/ui/detalhes.dart';
import 'package:flutter/material.dart';

class Carros extends StatelessWidget {
  final String tipo;

  Carros(this.tipo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 1.0,
        title: Text(
          'CARROS $tipo'.toUpperCase(), // COLOCAR TIPO CARRO ESCOLHIDO
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
      ),
      drawer: CustomizedDrawer(),
      body: _body(),
    );
  }

  _body() {
    Future<List<Carro>> carros = CarroApi.getCarro(tipo);
    return FutureBuilder(
      future: carros,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<Carro> carros = snapshot.data;
        return _listaCarros(carros);
      },
    );
  }

  Widget _listaCarros(carros) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 3),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Carro c = carros[index];
          return _layoutCarro(c, context);
        });
  }

  Widget _layoutCarro(carroAtual, context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => navigator(context, Detalhes(carroAtual)),
      child: Card(
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(carroAtual.urlFoto, fit: BoxFit.cover),
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      'R\$ 30.000',
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                carroAtual.nome,
                style: ESTILOMEDIO,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
