import 'package:flutter/material.dart';
import 'package:models4life/core/app/store/auth/user_data.dart';

class WhaitlistListCartItem extends StatelessWidget {
  const WhaitlistListCartItem({
    super.key,
    required this.path,
    required this.name,
    required this.price,
    required this.userData,
    required this.icon,
    this.onClick,
  });
  final String path;
  final String name;
  final String price;
  final UserData userData;
  final IconData icon;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              child: Image.asset(
                path,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Validex',
                  )),
              Text('$price ₽.', style: TextStyle(fontSize: 20)),
              IconButton(onPressed: onClick, icon: Icon(Icons.cancel_rounded))
            ],
          )
        ],
      ),
    );
  }
}
