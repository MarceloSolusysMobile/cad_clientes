import 'dart:html';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Cadastro de Clientes'),
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
  final nomeTextController = TextEditingController();
  final idadeTextController = TextEditingController();
  final enderecoTextController = TextEditingController();
  final avatarTextController = TextEditingController();
  List<Cliente> clientesList = [
    Cliente(
        nome: 'Joao',
        idade: '12',
        endereco: 'rua a',
        avatar: 'https://picsum.photos/id/237/200'),
    Cliente(
        nome: 'Maria',
        idade: '12',
        endereco: 'rua a',
        avatar: 'https://picsum.photos/id/235/200/'),
  ];

  _clearCamposCad() {
    nomeTextController.text = '';
    idadeTextController.text = '';
    enderecoTextController.text = '';
    avatarTextController.text = '';
  }

  _deleteCliente(int index) {
    setState(() {
      clientesList.removeAt(index);
    });
  }

  _addCliente() {
    setState(() {
      clientesList.add(Cliente(
          nome: nomeTextController.text,
          idade: idadeTextController.text,
          endereco: enderecoTextController.text,
          avatar: avatarTextController.text));
      _clearCamposCad();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: nomeTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Entre com o nome'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: idadeTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Entre com a idade'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: enderecoTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entre com o endereço'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: avatarTextController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Entre com a url da imagem'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Lista de Clientes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: clientesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Image.network(clientesList[index].avatar!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nome: ${clientesList[index].nome} '),
                              Text('Idade: ${clientesList[index].idade}'),
                              Text('Endereço: ${clientesList[index].endereco}')
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _deleteCliente(index);
                          },
                          tooltip: 'Deletar cliente',
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCliente();
        },
        tooltip: 'Salvar',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Cliente {
  String? nome;
  String? idade;
  String? endereco;
  String? avatar;

  Cliente({this.nome, this.idade, this.endereco, this.avatar});
}
