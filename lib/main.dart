import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:neflis/add.dart';
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
                const GetPelicula('v3yAVTnhpBOcoTM6YN9V'),
                // Container(
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: NetworkImage(
                //           'https://es.web.img3.acsta.net/r_1280_720/medias/nmedia/18/89/70/21/20062737.jpg'),
                //     ),
                //   ),
                //   height: 500,
                // ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Previews',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Row(
                      children: [
                        Previews(),
                        Previews(),
                        Previews(),
                        Previews(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Previews extends StatelessWidget {
  const Previews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(3.5),
      child: CircleAvatar(
        radius: 51,
        foregroundImage: NetworkImage(
            'https://es.web.img3.acsta.net/r_1280_720/medias/nmedia/18/89/70/21/20062737.jpg'),
      ),
    );
  }
}
