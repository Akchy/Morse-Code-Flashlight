class MorseCode {
  String _characterGenerator(String charator) {
    switch (charator) {
      case '.-':
        return 'A';
      case '_...':
        return 'B';
      case '_._.':
        return 'C';
      case '_..':
        return 'D';
      case '.':
        return 'E';
      case '.._.':
        return 'F';
      case '__.':
        return 'G';
      case '....':
        return 'H';
      case '..':
        return 'I';
      case '.___':
        return 'J';
      case '_._':
        return 'K';
      case '._..':
        return 'L';
      case '__':
        return 'M';
      case '-.':
        return 'N';
      case '___':
        return 'O';
      case '.__.':
        return 'P';
      case '__._':
        return 'Q';
      case '.-.':
        return 'R';
      case '...':
        return 'S';
      case '-':
        return 'T';
      case '.._':
        return 'U';
      case '..._':
        return 'V';
      case '.__':
        return 'W';
      case '_.._':
        return 'X';
      case '_.__':
        return 'Y';
      case '__..':
        return 'Z';
      case '._._._':
        return '.';
      case '__..__':
        return ',';
      case '..__..':
        return '?';
      case '.____':
        return '1';
      case '..___':
        return '2';
      case '...__':
        return '3';
      case '...._':
        return '4';
      case '.....':
        return '5';
      case '_....':
        return '6';
      case '__...':
        return '7';
      case '___..':
        return '8';
      case '____.':
        return '9';
      case '_____':
        return '0';
      default:
        return ' ';
    }
  }

  String _morseCodeGenerator(String charator) {
    charator = charator.toLowerCase();
    String morseCode = '';
    switch (charator) {
      case 'a':
        morseCode = '._';
        break;
      case 'b':
        morseCode = '_...';
        break;
      case 'c':
        morseCode = '_._.';
        break;
      case 'd':
        morseCode = '_..';
        break;
      case 'e':
        morseCode = '.';
        break;
      case 'f':
        morseCode = '.._.';
        break;
      case 'g':
        morseCode = '__.';
        break;
      case 'h':
        morseCode = '....';
        break;
      case 'i':
        morseCode = '..';
        break;
      case 'j':
        morseCode = '.___';
        break;
      case 'k':
        morseCode = '_._';
        break;
      case 'l':
        morseCode = '._..';
        break;
      case 'm':
        morseCode = '__';
        break;
      case 'n':
        morseCode = '_.';
        break;
      case 'o':
        morseCode = '___';
        break;
      case 'p':
        morseCode = '.__.';
        break;
      case 'q':
        morseCode = '__._';
        break;
      case 'r':
        morseCode = '._.';
        break;
      case 's':
        morseCode = '...';
        break;
      case 't':
        morseCode = '_';
        break;
      case 'u':
        morseCode = '.._';
        break;
      case 'v':
        morseCode = '..._';
        break;
      case 'w':
        morseCode = '.__';
        break;
      case 'x':
        morseCode = '_.._';
        break;
      case 'y':
        morseCode = '_.__';
        break;
      case 'z':
        morseCode = '__..';
        break;
      case '.':
        morseCode = '._._._';
        break;
      case ',':
        morseCode = '__..__';
        break;
      case '?':
        morseCode = '..__..';
        break;
      default:
        {
          if (charator.codeUnitAt(0) >= 48 && charator.codeUnitAt(0) <= 57) {
            if (charator.codeUnitAt(0) - 48 < 6) {
              int i;
              for (i = 0; i < charator.codeUnitAt(0) - 48; i++) {
                morseCode = morseCode + '.';
              }
              for (; i < 5; i++) {
                morseCode = morseCode + '_';
              }
            } else {
              int i;
              for (i = 5; i < charator.codeUnitAt(0) - 48; i++) {
                morseCode = morseCode + '_';
              }
              for (; i < 10; i++) {
                morseCode = morseCode + '.';
              }
            }
          } else {
            morseCode = ' ';
          }
        }
        break;
    }
    return morseCode;
  }

  String encode(String str) {
    String morse = '';
    str.split('').forEach((ch) {
      morse = morse + _morseCodeGenerator(ch) + ' ';
    });
    return morse;
  }

  String decode(String str) {
    String morse = '';
    str.split('').forEach((ch) {
      morse = morse + _characterGenerator(ch) + ' ';
    });
    return morse;
  }

  void modCodeFlasher(String mosCode) {
    String charator;
    for (int i = 0; i < mosCode.length; i++) {
      charator = mosCode.substring(i, i + 1);
      if (charator == '.') {
      } else if (charator == '_') {
      } else if (charator == ' ') {}
    }
  }
}
