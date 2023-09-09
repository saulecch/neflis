import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neflis/add.dart';
import 'package:neflis/categories.dart';
import 'package:neflis/estrenos.dart';
import 'package:neflis/firebase_options.dart';
import 'package:neflis/read.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: Image.asset('assets/logos_netflix-icon.png'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Tv Shows'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Movies'),
                ),
                const AddPeliculas(
                  'Shrek',
                  'https://filmartgallery.com/cdn/shop/products/Shrek-Vintage-Movie-Poster-Original-1-Sheet-27x41.jpg?v=1665732097',
                  false,
                  'Infantiles',
                  ['Infantiles', 'Comedias'],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GetPelicula('55tLU5MvyUoTEFgnVa4n'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Titles(title: 'Estrenos',),
                const Estrenos(),
                const Titles(title: 'Top 10 Guatemala',),
                const CategoriesList(category: 'Top 10 Guatemala'),
                const Titles(title: 'Accion',),
                const CategoriesList(category: 'Accion'),
                const Titles(title: 'Suspenso',),
                const CategoriesList(category: 'Suspenso'),
                const Titles(title: 'Infantiles',),
                const CategoriesList(category: 'Infantiles'),
                // const SizedBox(height: 900, child: MoviesList()),
              ],
            ),
          )),
    );
  }
}

class Titles extends StatelessWidget {
  final String title;
  const Titles({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}

class Previews extends StatelessWidget {
  final String image;
  const Previews({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: CircleAvatar(
        radius: 51,
        foregroundImage: NetworkImage(image),
      ),
    );
  }
}
