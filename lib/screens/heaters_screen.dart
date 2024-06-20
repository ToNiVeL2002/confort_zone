import 'package:confort_zone/providers/auth_provider.dart';
import 'package:confort_zone/providers/devices_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeatersScreen extends StatefulWidget {
  const HeatersScreen({super.key});

  @override
  State<HeatersScreen> createState() => _HeatersScreenState();
}

class _HeatersScreenState extends State<HeatersScreen> {
  final TextEditingController nameFanCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final devicesProvider = context.watch<DevicesProvider>();
    return Scaffold(
      body: Center(
          child: StreamBuilder(
        stream: FirebaseDatabase.instance.ref("calefones").onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data?.snapshot.value == null) {
            return Center(child: Text('No data available'));
          } else {
            // Asumiendo que los datos son un mapa de ventiladores
            Map<dynamic, dynamic> ventiladoresMap =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

            // Filtrar los elementos con id == 1
            List ventiladoresList = ventiladoresMap.entries.where((entry) {
              return entry.value['idGoogle'] ==
                  context.read<AuthProvider>().user!.idGoogle;
            }).map((entry) {
              return {'key': entry.key, 'value': entry.value};
            }).toList();

            if (ventiladoresList.isEmpty) {
              return const Center(
                  child: Text('No tienes calefones, dale click al boton'));
            }
            return ListView.builder(
              itemCount: ventiladoresList.length,
              itemBuilder: (context, index) {
                final ventilador = ventiladoresList[index];
                return ListTile(
                  title: Text(ventilador['key']),
                  subtitle: Text(ventilador['value'].toString()),
                );
              },
            );
          }
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        TextField(controller: nameFanCtrl),
                        TextField(
                          controller: stateCtrl,
                          keyboardType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () async {
                        await devicesProvider.createHeaterInDb(
                          idGoogle: context.read<AuthProvider>().user!.idGoogle,
                          name: nameFanCtrl.text,
                          state: int.parse(stateCtrl.text),
                        );
                        if (!devicesProvider.isCreatingDevice) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("CREAR"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar"))
                  ],
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
