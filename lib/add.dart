import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPeliculas extends StatelessWidget {
  final String nombre;
  final String imagen;
  final bool portada;
  final String categoriaPrincipal;
  final List<String> categoriasSecundarias;

  const AddPeliculas(this.nombre, this.imagen, this.portada,
      this.categoriaPrincipal, this.categoriasSecundarias,
      {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference peliculas =
        FirebaseFirestore.instance.collection('peliculas');

    Future<void> addMovie() {
      return peliculas
          .add({
            'nombre': nombre,
            'imagen': imagen,
            'portada': portada,
            'categoriaPrincipal': categoriaPrincipal,
            'categoriasSecundarias': categoriasSecundarias,
          })
          .then((value) => print("Movie Added"))
          .catchError((error) => print("Failed to add movie: $error"));
    }

    return TextButton(
      onPressed: addMovie,
      child: const Text(
        "Add Movie",
      ),
    );
  }
}
