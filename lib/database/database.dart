import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Cars extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get modelo => text()();
  TextColumn get marca => text()();
  IntColumn get ano => integer()();
  TextColumn get cor => text()();
}

@DriftDatabase(tables: [Cars])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<Car>> watchAllCars() => select(cars).watch();
  
  Future<Car> getCar(int id) =>
      (select(cars)..where((car) => car.id.equals(id))).getSingle();
  
  Future<int> insertCar(CarsCompanion car) => into(cars).insert(car);
  
  Future<bool> updateCar(Car car) => update(cars).replace(car);
  
  Future<int> deleteCar(int id) =>
      (delete(cars)..where((car) => car.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'cars.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
} 