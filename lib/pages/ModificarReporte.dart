import 'package:flutter/material.dart';
import 'package:proyecto_final_ihc/pages/Application.dart';

class ModificarReporte extends StatefulWidget {
  @override
  _ModificarReporteState createState() => _ModificarReporteState();
}

class _ModificarReporteState extends State<ModificarReporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Modificar Reporte'),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
                icon: Text('publicar'),
                iconSize: 100.0,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Application(
                        //titleController.text,
                        //dateController.text,
                        ),
                  ));
                })
          ]),
      body: Container(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 400,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(360.0),
                                  child: Image.asset(
                                    'assets/images/sophia.jpg',
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                              ),
                              Text(
                                'sophia',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      maxLines: 2,
                      maxLength: 30,
                      decoration:
                          InputDecoration(labelText: 'Titulo del reporte'),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      maxLines: 8,
                      maxLength: 1000,
                      decoration:
                          InputDecoration(labelText: 'Contenido del reporte'),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(Icons.photo),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Agregar Imagen",
                            style: TextStyle(
                              //fontSize: 10,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
