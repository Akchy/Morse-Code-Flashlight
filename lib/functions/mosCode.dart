import 'package:flutter/cupertino.dart';

class MosCode {
  String charatorGenerator(String charator) {
    switch (charator) {
      case ".-":
        return "A";
      case "_...":
        return "B";
      case "_._.":
        return "C";
      case "_..":
        return "D";
      case ".":
        return "E";
      case ".._.":
        return "F";
      case "__.":
        return "G";
      case "....":
        return "H";
      case "..":
        return "I";
      case ".___":
        return "J";
      case "_._":
        return "K";
      case "._..":
        return "L";
      case "__":
        return "M";
      case "-.":
        return "N";
      case "___":
        return "O";
      case ".__.":
        return "P";
      case "__._":
        return "Q";
      case ".-.":
        return "R";
      case "...":
        return "S";
      case "-":
        return "T";
      case ".._":
        return "U";
      case "..._":
        return "V";
      case ".__":
        return "W";
      case "_.._":
        return "X";
      case "_.__":
        return "Y";
      case "__..":
        return "Z";
      case "._._._":
        return ".";
      case "__..__":
        return ",";
      case "..__..":
        return "?";
      case ".____":
        return "1";
      case "..___":
        return "2";
      case "...__":
        return "3";
      case "...._":
        return "4";
      case ".....":
        return "5";
      case "_....":
        return "6";
      case "__...":
        return "7";
      case "___..":
        return "8";
      case "____.":
        return "9";
      case "_____":
        return "0";
      default:
        return " ";
    }
    return " ";
  }

  String mosCodeGenerator(String charator) {
    charator = charator.toLowerCase();
    String mosCode = "";
    switch (charator) {
      case 'a':
        mosCode = "._";
        break;
      case 'b':
        mosCode = "_...";
        break;
      case 'c':
        mosCode = "_._.";
        break;
      case 'd':
        mosCode = "_..";
        break;
      case 'e':
        mosCode = ".";
        break;
      case 'f':
        mosCode = ".._.";
        break;
      case 'g':
        mosCode = "__.";
        break;
      case 'h':
        mosCode = "....";
        break;
      case 'i':
        mosCode = "..";
        break;
      case 'j':
        mosCode = ".___";
        break;
      case 'k':
        mosCode = "_._";
        break;
      case 'l':
        mosCode = "._..";
        break;
      case 'm':
        mosCode = "__";
        break;
      case 'n':
        mosCode = "_.";
        break;
      case 'o':
        mosCode = "___";
        break;
      case 'p':
        mosCode = ".__.";
        break;
      case 'q':
        mosCode = "__._";
        break;
      case 'r':
        mosCode = "._.";
        break;
      case 's':
        mosCode = "...";
        break;
      case 't':
        mosCode = "_";
        break;
      case 'u':
        mosCode = ".._";
        break;
      case 'v':
        mosCode = "..._";
        break;
      case 'w':
        mosCode = ".__";
        break;
      case 'x':
        mosCode = "_.._";
        break;
      case 'y':
        mosCode = "_.__";
        break;
      case 'z':
        mosCode = "__..";
        break;
      case '.':
        mosCode = "._._._";
        break;
      case ',':
        mosCode = "__..__";
        break;
      case '?':
        mosCode = "..__..";
        break;
      default:
        {
          if (charator.codeUnitAt(0) >= 48 && charator.codeUnitAt(0) <= 57) {
            if (charator.codeUnitAt(0) - 48 < 6) {
              int i;
              for (i = 0; i < charator.codeUnitAt(0) - 48; i++) {
                mosCode = mosCode + ".";
              }
              for (; i < 5; i++) {
                mosCode = mosCode + "_";
              }
            } else {
              int i;
              for (i = 5; i < charator.codeUnitAt(0) - 48; i++) {
                mosCode = mosCode + "_";
              }
              for (; i < 10; i++) {
                mosCode = mosCode + ".";
              }
            }
          } else {
            mosCode = " ";
          }
        }
        break;
    }
    return mosCode;
  }

  void modCodeFlasher(String mosCode) {
    String charator;
    for (int i = 0; i < mosCode.length; i++) {
      charator = mosCode.substring(i, i + 1);
      if (charator == ".") {
      } else if (charator == '_') {
      } else if (charator == " ") {}
    }
  }
}
