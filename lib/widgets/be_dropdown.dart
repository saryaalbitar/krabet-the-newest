import 'package:flutter/material.dart';

class BeDropdown extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function callback;
  final String selectedValue;
  const BeDropdown({Key? key, required this.title, required this.items, required this.callback, required this.selectedValue}) : super(key: key);

  @override
  _BeDropdownState createState() => _BeDropdownState();
}

class _BeDropdownState extends State<BeDropdown> {
  String initialValue = "";
  @override
  void initState() {
    // TODO: implement initState
    initialValue = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
            topRight: Radius.circular(5.0), // FLUTTER BUG FIX
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Center(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              focusColor: Colors.white,
              value: initialValue == "" ? widget.items[0] : initialValue,
              elevation: 5,
              alignment: AlignmentDirectional.center,
              style: const TextStyle(color: Colors.white),
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                );
              }).toList(),
              hint: Center(
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  if (value != null) {
                    widget.callback(value);
                    initialValue = value;
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
