import 'package:flutter/material.dart';
import '../data/data_service.dart';

class DrawerApp extends StatelessWidget {
  final VoidCallback logoutCallback;

  const DrawerApp({required this.logoutCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(245, 204, 0, 0.872);

    return Drawer(
      child: Column(
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.asset('assets/saopaulo.png'),
                ),
                accountName: const Text('Usuário'),
                accountEmail: const Text('usuario@gmail.com'),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Início'),
            subtitle: const Text('Tela de Início'),
            onTap: () {
              dataService.tableStateNotifier.value = {
                'status': TableStatus.idle,
              };
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}