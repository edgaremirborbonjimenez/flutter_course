import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:flutter/material.dart';

class AdminCategoryListItem extends StatelessWidget {
  final Category? category;

  const AdminCategoryListItem(this.category);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: (category != null && category?.image != null)
      //     ? Container(
      //       width: 70,
      //       child: FadeInImage.assetNetwork(
      //           placeholder: 'assets/img/user.png',
      //           image: 'assets/img/user.png',
      //           fit: BoxFit.cover,
      //           fadeInDuration: Duration(seconds: 1),
      //         ),
      //     )
      //     : Container(),
      leading: SizedBox.shrink(),
      title: Text(category?.name ?? ''),
      subtitle: Text(category?.description ?? ''),
      // contentPadding: EdgeInsets.only(left: 10,right: 10,top: 15),
      trailing: Wrap(
        direction: Axis.horizontal,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
        ],
      ),
    );
  }
}
