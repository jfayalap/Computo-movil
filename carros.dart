import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaAutos(),
    );
  }
}

// MODELO
class Auto {
  final String marca;
  final String modelo;
  final int anio;
  final double precio;
  final int kilometraje;
  final String motor;
  final String garantia;

  Auto({
    required this.marca,
    required this.modelo,
    required this.anio,
    required this.precio,
    required this.kilometraje,
    required this.motor,
    required this.garantia,
  });
}

// DATOS
final List<Auto> autos = [
  Auto(
    marca: 'Toyota',
    modelo: 'Corolla',
    anio: 2020,
    precio: 280000,
    kilometraje: 45000,
    motor: '1.8L',
    garantia: '6 meses',
  ),
  Auto(
    marca: 'Nissan',
    modelo: 'Sentra',
    anio: 2019,
    precio: 250000,
    kilometraje: 52000,
    motor: '2.0L',
    garantia: '3 meses',
  ),
  Auto( 
    marca: 'Honda',
    modelo: 'Civic',
    anio: 2021,
    precio: 320000, 
    kilometraje: 30000, 
    motor: '2.0L', 
    garantia: '1 año', 
    ), 
    Auto( 
      marca: 'Mazda', 
      modelo: 'Mazda 3', 
      anio: 2018, 
      precio: 230000, 
      kilometraje: 60000, 
      motor: '2.0L', 
      garantia: '3 meses', 
      ),
];

// LISTA
class ListaAutos extends StatelessWidget {
  const ListaAutos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Autos Seminuevos')),
      body: ListView.builder(
        itemCount: autos.length,
        itemBuilder: (context, index) {
          final auto = autos[index];

          return ListTile(
            title: Text('${auto.marca} ${auto.modelo}'),
            subtitle: Text('Año: ${auto.anio} • \$${auto.precio}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalleAuto(auto: auto),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// DETALLE
class DetalleAuto extends StatelessWidget {
  final Auto auto;

  const DetalleAuto({super.key, required this.auto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${auto.marca} ${auto.modelo}')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Marca: ${auto.marca}'),
            Text('Modelo: ${auto.modelo}'),
            Text('Año: ${auto.anio}'),
            Text('Precio: \$${auto.precio}'),
          ],
        ),
      ),
    );
  }
}
