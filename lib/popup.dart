import "package:flutter/material.dart";

void ShowInfo(BuildContext context) {
  showDialog(
    context: context,
    builder: (conta) {
      return AlertDialog(
        title: Text(
          "Group Members ",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 25,
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.pop(conta),
              child: Text(
                "Ok",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  backgroundColor: Theme.of(context).primaryColor,
                  color: Colors.white,
                ),
              ))
        ],
        backgroundColor: Theme.of(context).primaryColor,
        // shape: CircleBorder(),
        contentPadding: EdgeInsets.all(20),
        titlePadding: EdgeInsets.all(10),
        content: Text(
          ''' 
            Group Members name and ID 
        1. Elshaday Brhanu        ATR/7483/10
        2. Samuael Adnew          ATR/0631/10
        3. Mekdes Genetu          ATR/6370/10
        4. Belayhun Arage         ATR/0950/10
        5. Natnael Bahiru         ATR/5572/10
        6. Fantahun Fekadu        ATR/0643/10
           ''',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        ),
      );
    },
    barrierDismissible: true,
  );
}
