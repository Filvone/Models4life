import 'package:flutter/material.dart';
import 'package:models4life/core/app/store/auth/user_data.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.path,
      required this.name,
      required this.price,
      required this.userData,
      required this.icon,
      required this.iconWhaitlist,
      this.onClick,
      this.onClickWhaitlist});
  final String path;
  final String name;
  final String price;
  final UserData userData;
  final IconData icon;
  final IconData iconWhaitlist;
  final VoidCallback? onClick;
  final VoidCallback? onClickWhaitlist;

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
              Text('$price ₽.',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Validex',
                  )),
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: onClick),
              IconButton(
                  icon: Icon(Icons.favorite), onPressed: onClickWhaitlist),
            ],
          )
        ],
      ),
    );
  }
}
