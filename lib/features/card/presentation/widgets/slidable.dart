import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:share/share.dart';


enum SlidableAction { archive, share, more, delete }

class SlidableWidget<T> extends StatelessWidget {


  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableDrawerActionPane(),
    child: child,
    actionExtentRatio: 0.25,
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Share',
        color: Colors.indigo,
        icon: Icons.share,
        onTap: () {
          final String url = "https://fakestoreapi.com/products";
          final RenderBox box =context.findRenderObject();
          Share.share(url,sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
        },
      ),
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () => onDismissed(SlidableAction.delete),
      ),
    ],
  );
}