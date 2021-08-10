import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final String imgUrl;

  CategoryItem(this.id, this.title, this.color, this.imgUrl);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                child: Image(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topRight,
                )
                // Image.network(
                //   imgUrl,s
                //   fit: BoxFit.fill,
                //   alignment: Alignment.topRight,
                // ),
                ),
            Container(
              width: 80,
              color: Colors.black45,
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
