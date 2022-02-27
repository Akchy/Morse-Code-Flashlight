class MorseCode {
  String _characterGenerator(String morse) {
    String text = '';
    switch (morse) {
      case '._._._':
        text = '.';
        break;
      case '__..__':
        text = ',';
        break;
      case '..__..':
        text = '?';
        break;
      case '.____':
        text = '1';
        break;
      case '..___':
        text = '2';
        break;
      case '...__':
        text = '3';
        break;
      case '...._':
        text = '4';
        break;
      case '.....':
        text = '5';
        break;
      case '_....':
        text = '6';
        break;
      case '__...':
        text = '7';
        break;
      case '___..':
        text = '8';
        break;
      case '____.':
        text = '9';
        break;
      case '_____':
        text = '0';
        break;
      case '_.._':
        text = 'X';
        break;
      case '_.__':
        text = 'Y';
        break;
      case '__..':
        text = 'Z';
        break;
      case '..._':
        text = 'V';
        break;
      case '.__.':
        text = 'P';
        break;
      case '__._':
        text = 'Q';
        break;
      case '._..':
        text = 'L';
        break;
      case '.___':
        text = 'J';
        break;
      case '....':
        text = 'H';
        break;
      case '.._.':
        text = 'F';
        break;
      case '_...':
        text = 'B';
        break;
      case '_._.':
        text = 'C';
        break;
      case '_..':
        text = 'D';
        break;
      case '__.':
        text = 'G';
        break;
      case '_._':
        text = 'K';
        break;
      case '___':
        text = 'O';
        break;
      case '._.':
        text = 'R';
        break;
      case '...':
        text = 'S';
        break;
      case '.._':
        text = 'U';
        break;
      case '.__':
        text = 'W';
        break;
      case '._':
        text = 'A';
        break;
      case '..':
        text = 'I';
        break;
      case '__':
        text = 'M';
        break;
      case '_.':
        text = 'N';
        break;
      case '.':
        text = 'E';
        break;
      case '_':
        text = 'T';
        break;
      default:
        text = ' ';
    }
    return text;
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
    return _characterGenerator(str) + ' ';
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
