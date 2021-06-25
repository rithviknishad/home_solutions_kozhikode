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
          ),
          SizedBox(width: 250),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeaderNav(selected: true, text: "Home"),
              HeaderNav(selected: false, text: "Products"),
              HeaderNav(selected: true, text: "About Us"),
              HeaderNav(selected: true, text: "Contact Us"),
            ],
          ),
          SizedBox(width: 250),
          Row(
            children: [
              Text('Sign Up', style: TextStyle(fontSize: 13.0)),
              SizedBox(width: 10.0),
              Container(height: 20.0, width: 1.0, color: Colors.white),
              SizedBox(width: 10.0),
              Text('Log In', style: TextStyle(fontSize: 13.0)),
            ],
          )
        ],
      ),
    );
  }
}

class HeaderNav extends StatefulWidget {
  final String text;
  final bool selected;

  const HeaderNav({
    required this.selected,
    required this.text,
  });

  @override
  _HeaderNavState createState() => _HeaderNavState();
}

class _HeaderNavState extends State<HeaderNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 13.0, color: Colors.white),
          ),
          if (widget.selected) ...[
            SizedBox(height: 5.0),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 2.0,
            ),
          ],
        ],
      ),
    );
  }
}
