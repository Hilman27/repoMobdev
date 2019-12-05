import 'package:flutter/material.dart';

class ButtonTemplate extends StatelessWidget {
  final labelbutton;
  final onpress;

  const ButtonTemplate({Key key, this.labelbutton, this.onpress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: onpress ??
          () {
            print('button kosong diklik');
          }

      // () {
      //   FocusScope.of(context).requestFocus(new FocusNode());
      //   // actionSubmit();
      //   /* this._setIsLogin();
      //     Navigator.pushReplacementNamed(context, '/home'); */
      // }
      ,
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text(labelbutton, style: TextStyle(color: Colors.white)),
    );
  }
}
