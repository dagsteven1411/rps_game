import 'dart:math';
import 'dart:io';

main(List<String> args) {
  bool restart = true;

  do {
    String menu = """
    Bienvenue dans le jeu du pierre, papier, ciseau
    Choisissez le nombre de manche: 
  """;
    print(menu);
    int manches = 0;
    int mancheMax = 3;
    mancheMax = int.parse(stdin.readLineSync().toString());
    final random = Random();

    Map<String, String> rules = {
      "pierre": "ciseau",
      "papier": "pierre",
      "ciseau": "papier"
    };
    int user = 0;
    int comp = 0;
    List<String> options = ["pierre", "papier", "ciseau"];
    while (manches < mancheMax) {
      String compChoice = options[random.nextInt(options.length)];
      print(
          "\nEntrez votre choix, 'piere', 'papier' ou 'ciseau' \nEntrez 'sortie' pour quitter");
      String? userChoice = stdin.readLineSync().toString().toLowerCase();

      if (userChoice == "sortie") {
        break;
      }
      if (!options.contains(userChoice)) {
        print("Choix incorrect");
        continue;
      } else if (compChoice == userChoice) {
        print("Egalité");
        continue;
      } else if (rules[compChoice] == userChoice) {
        print("L'IA gagne cette manche: $compChoice vs $userChoice");
        comp += 1;
        manches++;
      } else if (rules[userChoice] == compChoice) {
        print("Vous gagné cette manche: $userChoice vs $compChoice");
        user += 1;
        manches++;
      }
    }
    if (manches == mancheMax) {
      print("Nombre de manches écoules");
    }
    if (user > comp) {
      print("Victoire $user points contre $comp points");
    } else if (comp > user) {
      print("Défaite $user points contre $comp points ");
    } else if (comp == user) {
      print("Egalité $user partout ");
    }

    print("\nVoulez-vous recommencer ? \n Entrer 'oui' ou 'non'");
    String? reset = stdin.readLineSync().toString();
    if (reset == 'oui') {
      restart = true;
    } else {
      restart = false;
    }
  } while (restart == true);
}
