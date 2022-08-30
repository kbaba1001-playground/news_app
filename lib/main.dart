import 'package:flutter/material.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final articleProvider = FutureProvider<List<Article>>((ref) async {
  return ref.read(apiProvider).getArticle();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(articleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("SPOOKY"),
      ),
      body: _data.when(
        data: (_data) {
          return ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) =>
                customListTile(_data[index], context),
          );
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// class _HomePageState extends State<HomePage> {
//   ApiService client = ApiService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "SPOOKY",
//           style: GoogleFonts.creepster(
//             fontSize: 40.0,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: FutureBuilder(
//         future: client.getArticle(),
//         builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
//           if (snapshot.hasData) {
//             List<Article>? articles = snapshot.data;
//             return ListView.builder(
//               itemCount: articles?.length,
//               itemBuilder: (context, index) =>
//                   customListTile(articles![index], context),
//             );
//           }
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
