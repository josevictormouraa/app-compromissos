import 'package:flutter/foundation.dart';
import 'package:app_compromissos/models/compromissos.dart';

class CompromissosProvider extends ChangeNotifier {
  List<Compromissos> _compromissos = showCompromissos;

  List<Compromissos> get compromissos => _compromissos;

  addCompromissos(String titulo, String descricao) {
    _compromissos.add(Compromissos(
      id: _compromissos.length,
      titulo: titulo,
      descricao: descricao,
      modificarHora: DateTime.now(),
    ));
    notifyListeners();
  }

  editCompromissos(int index, String titulo, String descricao) {
    _compromissos[index] = Compromissos(
      id: _compromissos[index].id,
      titulo: titulo,
      descricao: descricao,
      modificarHora: DateTime.now(),
    );
    notifyListeners();
  }

  deleteCompromissos(int index) {
    _compromissos.removeAt(index);
    notifyListeners();
  }

  filterCompromissos(String searchText) {
    _compromissos = showCompromissos
        .where((compromisso) =>
            compromisso.titulo.toLowerCase().contains(searchText.toLowerCase()) ||
            compromisso.descricao.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    notifyListeners();
  }

  sortCompromissosByModifiedTime(bool classificado) {
    if (classificado) {
      _compromissos.sort((a, b) => a.modificarHora.compareTo(b.modificarHora));
    } else {
      _compromissos.sort((b, a) => a.modificarHora.compareTo(b.modificarHora));
    }
    classificado = !classificado;
    notifyListeners();
  }
}
