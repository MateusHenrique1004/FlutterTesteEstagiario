import 'package:flutter/material.dart';
import 'package:next_flutter/api_screen.dart';

class ItemScreen extends StatelessWidget {
  final List<String> items = ['API', 'SGBD', 'Rede', 'Design', 'Linguagem de Programação'];

  final Map<String, String> itemDescriptions = {
    'API': 'Conjunto de regras para comunicação entre softwares.',
    'SGBD': 'Sistema que gerencia bancos de dados.',
    'Rede': 'Infraestrutura que conecta dispositivos.',
    'Design': 'Criação visual para melhor usabilidade.',
    'Linguagem de Programação': 'Instruções para criar software.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Teste em Flutter para Estágio',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              showItemAlertDialog(context, items[index]);
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ApiScreen()),
                  );
                },
                child: Icon(Icons.navigate_next),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showItemAlertDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Descrição'),
          content: Text(itemDescriptions[item] ?? 'Descrição não disponível'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}