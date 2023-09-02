import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPelicula extends StatelessWidget {
  final String documentId;

  const GetPelicula(this.documentId, {super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference peliculas =
        FirebaseFirestore.instance.collection('peliculas');

    return FutureBuilder<DocumentSnapshot>(
      future: peliculas.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Nombre: ${data['nombre']} ${data['imagen']}");
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("${data['imagen']}"),
              ),
            ),
            height: 500,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
