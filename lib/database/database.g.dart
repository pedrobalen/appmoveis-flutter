// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CarsTable extends Cars with TableInfo<$CarsTable, Car> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _modeloMeta = const VerificationMeta('modelo');
  @override
  late final GeneratedColumn<String> modelo = GeneratedColumn<String>(
    'modelo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marcaMeta = const VerificationMeta('marca');
  @override
  late final GeneratedColumn<String> marca = GeneratedColumn<String>(
    'marca',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _anoMeta = const VerificationMeta('ano');
  @override
  late final GeneratedColumn<int> ano = GeneratedColumn<int>(
    'ano',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _corMeta = const VerificationMeta('cor');
  @override
  late final GeneratedColumn<String> cor = GeneratedColumn<String>(
    'cor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, modelo, marca, ano, cor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cars';
  @override
  VerificationContext validateIntegrity(
    Insertable<Car> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('modelo')) {
      context.handle(
        _modeloMeta,
        modelo.isAcceptableOrUnknown(data['modelo']!, _modeloMeta),
      );
    } else if (isInserting) {
      context.missing(_modeloMeta);
    }
    if (data.containsKey('marca')) {
      context.handle(
        _marcaMeta,
        marca.isAcceptableOrUnknown(data['marca']!, _marcaMeta),
      );
    } else if (isInserting) {
      context.missing(_marcaMeta);
    }
    if (data.containsKey('ano')) {
      context.handle(
        _anoMeta,
        ano.isAcceptableOrUnknown(data['ano']!, _anoMeta),
      );
    } else if (isInserting) {
      context.missing(_anoMeta);
    }
    if (data.containsKey('cor')) {
      context.handle(
        _corMeta,
        cor.isAcceptableOrUnknown(data['cor']!, _corMeta),
      );
    } else if (isInserting) {
      context.missing(_corMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Car map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Car(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      modelo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}modelo'],
          )!,
      marca:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}marca'],
          )!,
      ano:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}ano'],
          )!,
      cor:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}cor'],
          )!,
    );
  }

  @override
  $CarsTable createAlias(String alias) {
    return $CarsTable(attachedDatabase, alias);
  }
}

class Car extends DataClass implements Insertable<Car> {
  final int id;
  final String modelo;
  final String marca;
  final int ano;
  final String cor;
  const Car({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.ano,
    required this.cor,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['modelo'] = Variable<String>(modelo);
    map['marca'] = Variable<String>(marca);
    map['ano'] = Variable<int>(ano);
    map['cor'] = Variable<String>(cor);
    return map;
  }

  CarsCompanion toCompanion(bool nullToAbsent) {
    return CarsCompanion(
      id: Value(id),
      modelo: Value(modelo),
      marca: Value(marca),
      ano: Value(ano),
      cor: Value(cor),
    );
  }

  factory Car.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Car(
      id: serializer.fromJson<int>(json['id']),
      modelo: serializer.fromJson<String>(json['modelo']),
      marca: serializer.fromJson<String>(json['marca']),
      ano: serializer.fromJson<int>(json['ano']),
      cor: serializer.fromJson<String>(json['cor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'modelo': serializer.toJson<String>(modelo),
      'marca': serializer.toJson<String>(marca),
      'ano': serializer.toJson<int>(ano),
      'cor': serializer.toJson<String>(cor),
    };
  }

  Car copyWith({
    int? id,
    String? modelo,
    String? marca,
    int? ano,
    String? cor,
  }) => Car(
    id: id ?? this.id,
    modelo: modelo ?? this.modelo,
    marca: marca ?? this.marca,
    ano: ano ?? this.ano,
    cor: cor ?? this.cor,
  );
  Car copyWithCompanion(CarsCompanion data) {
    return Car(
      id: data.id.present ? data.id.value : this.id,
      modelo: data.modelo.present ? data.modelo.value : this.modelo,
      marca: data.marca.present ? data.marca.value : this.marca,
      ano: data.ano.present ? data.ano.value : this.ano,
      cor: data.cor.present ? data.cor.value : this.cor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Car(')
          ..write('id: $id, ')
          ..write('modelo: $modelo, ')
          ..write('marca: $marca, ')
          ..write('ano: $ano, ')
          ..write('cor: $cor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, modelo, marca, ano, cor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Car &&
          other.id == this.id &&
          other.modelo == this.modelo &&
          other.marca == this.marca &&
          other.ano == this.ano &&
          other.cor == this.cor);
}

class CarsCompanion extends UpdateCompanion<Car> {
  final Value<int> id;
  final Value<String> modelo;
  final Value<String> marca;
  final Value<int> ano;
  final Value<String> cor;
  const CarsCompanion({
    this.id = const Value.absent(),
    this.modelo = const Value.absent(),
    this.marca = const Value.absent(),
    this.ano = const Value.absent(),
    this.cor = const Value.absent(),
  });
  CarsCompanion.insert({
    this.id = const Value.absent(),
    required String modelo,
    required String marca,
    required int ano,
    required String cor,
  }) : modelo = Value(modelo),
       marca = Value(marca),
       ano = Value(ano),
       cor = Value(cor);
  static Insertable<Car> custom({
    Expression<int>? id,
    Expression<String>? modelo,
    Expression<String>? marca,
    Expression<int>? ano,
    Expression<String>? cor,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (modelo != null) 'modelo': modelo,
      if (marca != null) 'marca': marca,
      if (ano != null) 'ano': ano,
      if (cor != null) 'cor': cor,
    });
  }

  CarsCompanion copyWith({
    Value<int>? id,
    Value<String>? modelo,
    Value<String>? marca,
    Value<int>? ano,
    Value<String>? cor,
  }) {
    return CarsCompanion(
      id: id ?? this.id,
      modelo: modelo ?? this.modelo,
      marca: marca ?? this.marca,
      ano: ano ?? this.ano,
      cor: cor ?? this.cor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (modelo.present) {
      map['modelo'] = Variable<String>(modelo.value);
    }
    if (marca.present) {
      map['marca'] = Variable<String>(marca.value);
    }
    if (ano.present) {
      map['ano'] = Variable<int>(ano.value);
    }
    if (cor.present) {
      map['cor'] = Variable<String>(cor.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarsCompanion(')
          ..write('id: $id, ')
          ..write('modelo: $modelo, ')
          ..write('marca: $marca, ')
          ..write('ano: $ano, ')
          ..write('cor: $cor')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CarsTable cars = $CarsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cars];
}

typedef $$CarsTableCreateCompanionBuilder =
    CarsCompanion Function({
      Value<int> id,
      required String modelo,
      required String marca,
      required int ano,
      required String cor,
    });
typedef $$CarsTableUpdateCompanionBuilder =
    CarsCompanion Function({
      Value<int> id,
      Value<String> modelo,
      Value<String> marca,
      Value<int> ano,
      Value<String> cor,
    });

class $$CarsTableFilterComposer extends Composer<_$AppDatabase, $CarsTable> {
  $$CarsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cor => $composableBuilder(
    column: $table.cor,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CarsTableOrderingComposer extends Composer<_$AppDatabase, $CarsTable> {
  $$CarsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get modelo => $composableBuilder(
    column: $table.modelo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get marca => $composableBuilder(
    column: $table.marca,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cor => $composableBuilder(
    column: $table.cor,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CarsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CarsTable> {
  $$CarsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get modelo =>
      $composableBuilder(column: $table.modelo, builder: (column) => column);

  GeneratedColumn<String> get marca =>
      $composableBuilder(column: $table.marca, builder: (column) => column);

  GeneratedColumn<int> get ano =>
      $composableBuilder(column: $table.ano, builder: (column) => column);

  GeneratedColumn<String> get cor =>
      $composableBuilder(column: $table.cor, builder: (column) => column);
}

class $$CarsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CarsTable,
          Car,
          $$CarsTableFilterComposer,
          $$CarsTableOrderingComposer,
          $$CarsTableAnnotationComposer,
          $$CarsTableCreateCompanionBuilder,
          $$CarsTableUpdateCompanionBuilder,
          (Car, BaseReferences<_$AppDatabase, $CarsTable, Car>),
          Car,
          PrefetchHooks Function()
        > {
  $$CarsTableTableManager(_$AppDatabase db, $CarsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CarsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CarsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CarsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> modelo = const Value.absent(),
                Value<String> marca = const Value.absent(),
                Value<int> ano = const Value.absent(),
                Value<String> cor = const Value.absent(),
              }) => CarsCompanion(
                id: id,
                modelo: modelo,
                marca: marca,
                ano: ano,
                cor: cor,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String modelo,
                required String marca,
                required int ano,
                required String cor,
              }) => CarsCompanion.insert(
                id: id,
                modelo: modelo,
                marca: marca,
                ano: ano,
                cor: cor,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CarsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CarsTable,
      Car,
      $$CarsTableFilterComposer,
      $$CarsTableOrderingComposer,
      $$CarsTableAnnotationComposer,
      $$CarsTableCreateCompanionBuilder,
      $$CarsTableUpdateCompanionBuilder,
      (Car, BaseReferences<_$AppDatabase, $CarsTable, Car>),
      Car,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CarsTableTableManager get cars => $$CarsTableTableManager(_db, _db.cars);
}
