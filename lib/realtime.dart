import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
    State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final Stream<QuerySnapshot> _moviesStream = FirebaseFirestore.instance.collection('peliculas').snapshots();

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

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['nombre'] ?? 'Sin nombre'),
              subtitle: Text(data['categoriaPrincipal'] ?? 'Sin categoría'),
            );
          }).toList(),
        );
      },
    );
  }
}