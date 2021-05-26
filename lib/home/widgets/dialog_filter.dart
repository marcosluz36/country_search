import 'package:diacritic/diacritic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DialogFilter extends StatefulWidget {
  final Function onSubmit;

  const DialogFilter({
    this.onSubmit,
    Key key
  }) : super(key: key);

  @override
  _DialogFilterState createState() => _DialogFilterState();
}

class _DialogFilterState extends State<DialogFilter> {
  String _dropdownValue = 'Nome';
  String _inputValue = "";
  Map<String, String> valueTranslation = {
    "Nome": "name",
    "Região":"region",
    "Sigla": "initials",
    "Moeda": "currency",
  };

  void _setFilter () {
    widget.onSubmit([valueTranslation[_dropdownValue], _inputValue]);
    Navigator.pop(context, true);
  }

  void _resetFilter () {
    widget.onSubmit(["none"]);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeInSine,
      elevation: 2.0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        height: 280.0,
        padding: EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,10),
              blurRadius: 10
            ),
          ]
        ),
        child: Column(
          children: [
            Text(
              "Filtrar",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10.0),
            Divider(color: Colors.black45),
            SizedBox(height: 25.0),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: DropdownButtonFormField<String>(
                    value: _dropdownValue,
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                      });
                    },
                    items: <String>["Nome", "Região", "Sigla", "Moeda"].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(child: SizedBox()),
                Expanded(flex: 7,
                  child: TextField(
                    onChanged: (String value) {
                      setState(() {
                        _inputValue = removeDiacritics(value.toLowerCase());
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Filtro",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                      )
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color(0xfff6f6f6),
                    minimumSize: Size(110.0, 50.0),
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xff868686)
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0
                    )
                  ),
                  child: Text(
                    "Limpar filtro",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: _resetFilter
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(110.0, 50.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0
                        )
                    ),
                    child: Text(
                      "Pesquisar",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: _inputValue.isNotEmpty ? _setFilter : null
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
