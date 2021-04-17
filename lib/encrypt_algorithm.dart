class PlayFairEncrypt {
  List<List<String>> keyEncryptionArray = [[], [], [], [], []];
  List<String> UniqueCharactersHolder = [];
  String ch = "ABCDEFGHIKLMNOPQRSTUVWXYZ";
  String encrypted = "";

  // This method creates the array using the encryption key and
  // populates the keyEncryptionArray with thosse unique elemenets of alphabet
  makeArray(String keyword) {
    keyword = keyword.toUpperCase().replaceAll("J", "I");
    bool present, terminate = false;
    int val = 0;
    int uniqueLen = 0;
    for (int i = 0; i < keyword.length; i++) {
      present = false;
      uniqueLen = 0;
      if (keyword[i] != " ") {
        present = false;
        uniqueLen = 0;
        for (int k = 0; k < 26; k++) {
          if (UniqueCharactersHolder.length - 1 >= k) {
            break;
          }
          uniqueLen++;
        }

        for (int j = 0; j < UniqueCharactersHolder.length; j++) {
          if (UniqueCharactersHolder.contains(keyword[i])) {
            present = true;
          }
        }
        if (!present) {
          UniqueCharactersHolder.add(keyword[i]);
          val++;
        }
      }
      ch = ch.replaceFirst(keyword[i].toUpperCase(), "");
    }
    for (int i = 0; i < ch.length; i++) {
      UniqueCharactersHolder.add(ch[i]);
      val++;
    }
    val = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        keyEncryptionArray[i].add(UniqueCharactersHolder[val]);
        val++;
        print("${keyEncryptionArray[i][j]}\t");
      }
      print("\n");
    }
  }

  String manageMessage(String msg) {
    int val = 0;
    int len = msg.length - 2;
    String newText = "";
    String intermediate = "";
    while (len >= 0) {
      intermediate = msg.substring(val, val + 2);
      if (intermediate[0] == intermediate[1]) {
        newText = intermediate[0] + "z" + intermediate[1];
        msg = msg.replaceFirst(intermediate, newText);
        len++;
      }
      len -= 2;
      val += 2;
    }
    if (msg.length % 2 != 0) {
      msg = msg + "z";
    }
    return msg.toUpperCase().replaceAll("J", "I").replaceAll(" ", "");
  }

  doPlayFair(String msg) {
    int val = 0;
    while (val < msg.length) {
      searchAndEncrypt(
        msg.substring(val, val + 2),
      );
      val += 2;
    }
  }

  searchAndEncrypt(String doubleCHaracter) {
    String ch1 = doubleCHaracter[0];
    String ch2 = doubleCHaracter[1];
    int row1 = 0, col1 = 0, row2 = 0, col2 = 0;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        if (keyEncryptionArray[i][j] == ch1) {
          row1 = i;
          col1 = j;
        } else if (keyEncryptionArray[i][j] == ch2) {
          row2 = i;
          col2 = j;
        }
      }
    }
    if (row1 == row2) {
      col1 = col1 + 1;
      col2 = col2 + 1;
      if (col1 > 4) col1 = 0;
      if (col2 > 4) col2 = 0;
      encrypted +=
          (keyEncryptionArray[row1][col1] + keyEncryptionArray[row1][col2]);
    } else if (col1 == col2) {
      row1 = row1 + 1;
      row2 = row2 + 1;
      if (row1 > 4) row1 = 0;
      if (row2 > 4) row2 = 0;
      encrypted +=
          (keyEncryptionArray[row1][col1] + keyEncryptionArray[row2][col1]);
    } else {
      encrypted +=
          (keyEncryptionArray[row1][col2] + keyEncryptionArray[row2][col1]);
    }
  }

  String get encryptedMessage {
    return encrypted;
  }
}
