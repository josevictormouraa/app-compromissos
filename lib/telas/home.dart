
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_compromissos/constants/cores.dart';
import 'package:app_compromissos/models/compromissos.dart';
import 'package:app_compromissos/telas/editar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Compromissos> filtrarCompromissos = [];
  bool classificado = false;

  @override
  void initState() {
    super.initState();
    filtrarCompromissos = mostraCompromissos;
  }

  List<Compromissos> sortNotesByModifiedTime(List<Compromissos> compromissos) {
    if (classificado) {
      compromissos.sort((a, b) => a.modificarHora.compareTo(b.modificarHora));
    } else {
      compromissos.sort((b, a) => a.modificarHora.compareTo(b.modificarHora));
    }

    classificado = !classificado;

    return compromissos;
  }

  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  void onSearchTextChanged(String searchText) {
    setState(() {
      filtrarCompromissos = mostraCompromissos
          .where((compromissos) =>
              compromissos.conteudo.toLowerCase().contains(searchText.toLowerCase()) ||
              compromissos.titulo.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  void deleteNote(int index) {
    setState(() {
      Compromissos compromiso = filtrarCompromissos[index];
      mostraCompromissos.remove(compromiso);
      filtrarCompromissos.removeAt(index);
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
                  'Compromissos',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        filtrarCompromissos = sortNotesByModifiedTime(filtrarCompromissos);
                      }
                    );
                  },
                    padding: const EdgeInsets.all(0),
                    icon: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      child: const Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    )
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
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.only(top: 30),
              itemCount: filtrarCompromissos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  color: getRandomColor(),
                  elevation: 3,
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
                                  mostraCompromissos.indexOf(filtrarCompromissos[index]);

                              mostraCompromissos[originalIndex] = Compromissos(
                                id: mostraCompromissos[originalIndex].id,
                                titulo: result[0],
                                conteudo: result[1],
                                modificarHora: DateTime.now()
                              );
                                  
                              filtrarCompromissos[index] = Compromissos(
                                id: filtrarCompromissos[index].id,
                                titulo: result[0],
                                conteudo: result[1],
                                modificarHora: DateTime.now()
                              );
                            }
                          );
                        }
                      },
                      title: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: '${filtrarCompromissos[index].titulo} \n',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                height: 1.5
                              ),
                            children: [
                              TextSpan(
                                text: filtrarCompromissos[index].conteudo,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  height: 1.5
                                ),
                              )
                            ]
                          ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Editado: ${DateFormat('dd/MM/yyyy HH:mm').format(filtrarCompromissos[index].modificarHora)}',
                          style: TextStyle(
                            fontSize: 10,
                            fontStyle: FontStyle.italic,
                            color: Colors.grey.shade800
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          final result = await confirmDialog(context);
                          if (result != null && result) {
                            deleteNote(index);
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
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
              mostraCompromissos.add(Compromissos(
                  id: mostraCompromissos.length,
                  titulo: result[0],
                  conteudo: result[1],
                  modificarHora: DateTime.now()
                )
              );
              filtrarCompromissos = mostraCompromissos;
            });
          }
        },
        elevation: 10,
        backgroundColor: Colors.grey.shade800,
        child: const Icon(
          Icons.add,
          size: 38,
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
              'Tem certezar que deseja execluir esse compromisso ?',
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
                          backgroundColor: Colors.green),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'sim',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const SizedBox(
                        width: 60,
                        child: Text(
                          'Nao',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ),
                ]
              ),
          );
        }
       );
  }
}
