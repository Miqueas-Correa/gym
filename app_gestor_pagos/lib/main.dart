import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//  async permite que main() ejecute código de manera asíncrona, lo que significa
//que la app no se congela mientras se carga el archivo .env.

//  await dotenv.load(); le dice a Dart que espere a que dotenv.load() termine
//antes de continuar con runApp(MyApp());.

// Si main() no fuera async, no podríamos usar await, y la app intentaría
//ejecutarse antes de que las variables de entorno se carguen, lo que podría
//causar errores.
main() async {
  // await dotenv.load();
  runApp(
    // MultiProvider(
    // providers: [
    // ChangeNotifierProvider(create: (_) => ThemeProvider()),
    // ChangeNotifierProvider(create: (_) => FishesProvider()),
    // ChangeNotifierProvider(create: (_) => LoadingProvider()),
    // ChangeNotifierProvider(create: (_) => CrocodilesProvider()),
    // ChangeNotifierProvider(
    //   create: (context) => AnimalsProvider(
    //     catsProvider: CatsProvider(),
    //     dogsProviders: DogsProviders(),
    //     fishesProvider: context.read<FishesProvider>(),
    //     crocodilesProvider: context.read<CrocodilesProvider>(),
    //   ),
    // ),
    // ],
    // child:
    const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestor de Pagos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> loadEnv() async {
  try {
    await dotenv.load(fileName: "assets/config.env");
    print("ENV cargado correctamente");
    print("API_KEY: ${dotenv.env['API_KEY']}");
  } catch (e) {
    print("Error cargando ENV: $e");
  }
}
