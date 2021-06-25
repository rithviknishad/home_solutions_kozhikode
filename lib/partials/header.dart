import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          SizedBox(width: 100.0),
          Icon(
            Icons.favorite_rounded,
            color: Colors.white,
          ),
          SizedBox(width: 10.0),
          Text(
            'HomeSolutions',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
