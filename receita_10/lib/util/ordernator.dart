abstract class Decider {
  bool needsToSwap(dynamic current, dynamic next);
}

class Ordenator {
  List newOrdenator(List objects, Function callBack) {
    List orderedObjects = List.of(objects);
    bool changed;

    do {
      changed = false;

      for (int i = 0; i < orderedObjects.length - 1; i++) {
        var current = orderedObjects[i];
        var next = orderedObjects[i + 1];

        if (callBack(current, next)) {
          var temp = orderedObjects[i];
          orderedObjects[i] = orderedObjects[i + 1];
          orderedObjects[i + 1] = temp;
          changed = true;
        }
      }
    } while (changed);

    return orderedObjects;
  }

  List orderBy(List objects, Decider decider) {
    List orderedObjects = List.of(objects);
    bool swapped;

    do {
      swapped = false;

      for (int i = 0; i < orderedObjects.length - 1; i++) {
        var current = orderedObjects[i];
        var next = orderedObjects[i + 1];

        if (decider.needsToSwap(current, next)) {
          var temp = orderedObjects[i];
          orderedObjects[i] = orderedObjects[i + 1];
          orderedObjects[i + 1] = temp;
          swapped = true;
        }
      }
    } while (swapped);

    return orderedObjects;
  }

  List orderByBeerNameAscending(List beers) {
    List orderedBeers = List.of(beers);
    bool swapped;

    do {
      swapped = false;

      for (int i = 0; i < orderedBeers.length - 1; i++) {
        var current = orderedBeers[i];
        var next = orderedBeers[i + 1];

        if (current["name"].compareTo(next["name"]) > 0) {
          var temp = orderedBeers[i];
          orderedBeers[i] = orderedBeers[i + 1];
          orderedBeers[i + 1] = temp;
          swapped = true;
        }
      }
    } while (swapped);

    return orderedBeers;
  }

  List orderByBeerNameDescending(List beers) {
    List orderedBeers = List.of(beers);
    bool swapped;

    do {
      swapped = false;

      for (int i = 0; i < orderedBeers.length - 1; i++) {
        var current = orderedBeers[i];
        var next = orderedBeers[i + 1];

        if (current["name"].compareTo(next["name"]) < 0) {
          var temp = orderedBeers[i];
          orderedBeers[i] = orderedBeers[i + 1];
          orderedBeers[i + 1] = temp;
          swapped = true;
        }
      }
    } while (swapped);

    return orderedBeers;
  }

  List orderByBeerStyleAscending(List beers) {
    List orderedBeers = List.of(beers);
    bool swapped;

    do {
      swapped = false;

      for (int i = 0; i < orderedBeers.length - 1; i++) {
        var current = orderedBeers[i];
        var next = orderedBeers[i + 1];

        if (current["style"].compareTo(next["style"]) > 0) {
          var temp = orderedBeers[i];
          orderedBeers[i] = orderedBeers[i + 1];
          orderedBeers[i + 1] = temp;
          swapped = true;
        }
      }
    } while (swapped);

    return orderedBeers;
  }

  List ordenarCervejasPorEstiloDecrescente(List cervejas) {
    List cervejasOrdenadas = List.of(cervejas);

    bool trocouAoMenosUm;

    do {
      trocouAoMenosUm = false;

      for (int i = 0; i < cervejasOrdenadas.length - 1; i++) {
        var atual = cervejasOrdenadas[i];

        var proximo = cervejasOrdenadas[i + 1];

        if (atual["style"].compareTo(proximo["style"]) > 0) {
          var aux = cervejasOrdenadas[i];

          cervejasOrdenadas[i] = cervejasOrdenadas[i + 1];

          cervejasOrdenadas[i + 1] = aux;

          trocouAoMenosUm = true;
        }
      }
    } while (trocouAoMenosUm);

    return cervejasOrdenadas;
  }
}