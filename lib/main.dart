import 'package:flutter/material.dart';
import 'package:cadastro/database/database.dart';
import 'package:drift/drift.dart' as drift;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Carros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final database = AppDatabase();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Carros'),
      ),
      body: StreamBuilder(
        stream: database.watchAllCars(),
        builder: (context, AsyncSnapshot<List<Car>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          final cars = snapshot.data ?? [];

          if (cars.isEmpty) {
            return const Center(child: Text('Nenhum carro cadastrado'));
          }

          return ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) {
              final car = cars[index];
              return ListTile(
                title: Text('${car.marca} ${car.modelo}'),
                subtitle: Text('${car.ano} - ${car.cor}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _showCarFormDialog(context, car),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteCar(car.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCarFormDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _deleteCar(int id) async {
    await database.deleteCar(id);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Carro excluído com sucesso')),
      );
    }
  }

  Future<void> _showCarFormDialog(BuildContext context, [Car? car]) async {
    final modeloController = TextEditingController(text: car?.modelo);
    final marcaController = TextEditingController(text: car?.marca);
    final anoController = TextEditingController(text: car?.ano?.toString());
    final corController = TextEditingController(text: car?.cor);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(car == null ? 'Novo Carro' : 'Editar Carro'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: marcaController,
                decoration: const InputDecoration(labelText: 'Marca'),
              ),
              TextField(
                controller: modeloController,
                decoration: const InputDecoration(labelText: 'Modelo'),
              ),
              TextField(
                controller: anoController,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: corController,
                decoration: const InputDecoration(labelText: 'Cor'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              if (car == null) {
                await database.insertCar(
                  CarsCompanion(
                    marca: drift.Value(marcaController.text),
                    modelo: drift.Value(modeloController.text),
                    ano: drift.Value(int.tryParse(anoController.text) ?? 0),
                    cor: drift.Value(corController.text),
                  ),
                );
              } else {
                await database.updateCar(
                  Car(
                    id: car.id,
                    marca: marcaController.text,
                    modelo: modeloController.text,
                    ano: int.tryParse(anoController.text) ?? 0,
                    cor: corController.text,
                  ),
                );
              }
              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      car == null
                          ? 'Carro cadastrado com sucesso'
                          : 'Carro atualizado com sucesso',
                    ),
                  ),
                );
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    database.close();
    super.dispose();
  }
}