import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class ListaPage extends StatelessWidget {
  const ListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dados'),
      ),
      body: const Center(
        child: Text('Esta é a página de lista.'),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/lista': (context) => const ListaPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu nome',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu cpf',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu telefone',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: null, 
              child: const Text("Salvar dados"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print('Navigator encontrado, navegando para /lista');
                }
                Navigator.pushNamed(context, '/lista');
              },
              child: const Text("Ir para lista"),
            ),
          ],
        ),
      ),
    );
  }
}