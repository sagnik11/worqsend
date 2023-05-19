import "dart:math";

import 'package:WorqSend_app/gen/strings.g.dart';

String generateRandomAlias() {
  final random = Random();
  final descrip = t.aliasGenerator.descrip;
  final animal = t.aliasGenerator.animal;

  // The combination of both is locale dependent too.
  return t.aliasGenerator.combination(
    adjective: descrip[random.nextInt(descrip.length)],
    fruit: animal[random.nextInt(animal.length)],
  );
}
