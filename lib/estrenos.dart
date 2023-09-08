import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neflis/main.dart';

class Estrenos extends StatefulWidget {
  const Estrenos({super.key});

  @override
  State<Estrenos> createState() => _EstrenosState();
}

class _EstrenosState extends State<Estrenos> {
  final Stream<QuerySnapshot> _moviesStream =
      FirebaseFirestore.instance.collection('peliculas').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _moviesStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        // return ListView(
        //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
        //   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        //     return ListTile(
        //       title: Text(data['nombre'] ?? 'Sin nombre'),
        //       subtitle: Text(data['categoriaPrincipal'] ?? 'Sin categoría'),
        //     );
        //   }).toList(),
        // );

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Previews(image: data['imagen'].toString());
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
