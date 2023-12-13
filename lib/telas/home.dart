// ignore: unused_import
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_compromissos/models/compromissos.dart';
import 'package:app_compromissos/telas/editar.dart';

class HomeTelaState extends StatefulWidget {
  const HomeTelaState({Key? key}) : super(key: key);

  @override
  State<HomeTelaState> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTelaState> {
  List<Compromissos> filtrarCompromissos = [];
  bool classificado = false;

  @override
  void initState() {
    super.initState();
    filtrarCompromissos = showCompromissos;
  }

  List<Compromissos> sortCompromissosByModifiedTime(List<Compromissos> compromissos) {
    if (classificado) {
      compromissos.sort((a, b) => a.modificarHora.compareTo(b.modificarHora));
    } else {
      compromissos.sort((b, a) => a.modificarHora.compareTo(b.modificarHora));
    }

    classificado = !classificado;

    return compromissos;
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filtrarCompromissos = showCompromissos
          .where((compromissos) =>
              compromissos.descricao.toLowerCase().contains(searchText.toLowerCase()) ||
              compromissos.titulo.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteCompromissos(int index) {
    setState(() {
      Compromissos compromiso = filtrarCompromissos[index];

      // Use a função removeWhere para garantir que a condição seja aplicada a ambas as listas
      showCompromissos.removeWhere((comp) => comp.id == compromiso.id);
      filtrarCompromissos.removeWhere((comp) => comp.id == compromiso.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'MyCompromissos',
                  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      filtrarCompromissos = sortCompromissosByModifiedTime(filtrarCompromissos);
                    });
                  },
                  padding: const EdgeInsets.all(0),
                  icon: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.sort,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: onSearchTextChanged,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                hintText: "Procurar compromissos...",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                fillColor: Colors.grey.shade800,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Color.fromARGB(0, 208, 36, 36)),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: filtrarCompromissos.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    elevation: 3,
                    color: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EditScreen(compromissos: filtrarCompromissos[index]),
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              int originalIndex =
                                  showCompromissos.indexOf(filtrarCompromissos[index]);

                              showCompromissos[originalIndex] = Compromissos(
                                id: showCompromissos[originalIndex].id,
                                titulo: result[0],
                                descricao: result[1],
                                modificarHora: DateTime.now(),
                              );

                              filtrarCompromissos[index] = Compromissos(
                                id: filtrarCompromissos[index].id,
                                titulo: result[0],
                                descricao: result[1],
                                modificarHora: DateTime.now(),
                              );
                            });
                          }
                        },
                        title: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: '${filtrarCompromissos[index].titulo} \n',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(
                                text: filtrarCompromissos[index].descricao,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              )
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Criado: ${DateFormat('dd/MM/yyyy HH:mm').format(filtrarCompromissos[index].modificarHora)}',
                            style: const TextStyle(
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color:  Color.fromARGB(255, 198, 196, 196),
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await confirmDialog(context);
                            if (result != null && result) {
                              deleteCompromissos(index);
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const EditScreen(),
            ),
          );

          if (result != null) {
            setState(() {
              showCompromissos.add(Compromissos(
                id: showCompromissos.length,
                titulo: result[0],
                descricao: result[1],
                modificarHora: DateTime.now(),
              ));
              filtrarCompromissos = showCompromissos;
            });
          }
        },
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: const Icon(
          Icons.add,
          size: 38,
          color: Colors.blue
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          icon: const Icon(
            Icons.info,
            color: Colors.grey,
          ),
          title: const Text(
            'Tem certeza que deseja excluir esse compromisso?',
            style: TextStyle(color: Colors.white),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: const SizedBox(
                  width: 60,
                  child: Text(
                    'Sim',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const SizedBox(
                  width: 60,
                  child: Text(
                    'Não',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
