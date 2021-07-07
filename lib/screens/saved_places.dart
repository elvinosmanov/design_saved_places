import 'package:flutter/material.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({Key? key}) : super(key: key);

  @override
  _SavedPlacesState createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
  final borderRadius = 12.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: customAppBar(),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              children: <Widget>[
                savedPlaces(
                    title: 'Home',
                    subtitle: 'Zarifa Aliyeva Str. 89',
                    iconData: Icons.home,
                    iconColor: Colors.blue),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                  height: 0,
                ),
                savedPlaces(
                    title: 'Work',
                    subtitle: 'Neftchilar Ave. 56',
                    iconData: Icons.work,
                    iconColor: Colors.blue),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Column(
              children: <Widget>[
                customDismissible(
                  key: Key("1"),
                  bgColor: Colors.red,
                  child: savedPlaces(
                      title: 'Gym',
                      subtitle: 'Basti Bagirova Str. 15',
                      iconData: Icons.bookmark_outlined,
                      iconColor: Colors.yellow[700]),
                ),
                customDismissible(
                  key: Key("2"),
                  bgColor: Colors.red,
                  child: savedPlaces(
                      title: 'Restaurant',
                      subtitle: 'Gambarov Str. 72',
                      iconData: Icons.food_bank_rounded,
                      iconColor: Colors.black),
                ),
                customDismissible(
                  key: Key("3"),
                  bgColor: Colors.green,
                  text: "Add",
                  child: savedPlaces(
                      hasLeading: false,
                      title: 'Add Saved Place',
                      subtitle: 'Get to your favorite destination faster',
                      iconData: Icons.food_bank_rounded,
                      iconColor: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Dismissible customDismissible(
      {required Key key, required Widget child, Color? bgColor, String? text}) {
    return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          padding: EdgeInsets.only(right: 18.0),
          color: bgColor,
          alignment: Alignment.centerRight,
          child: Text(
            text ?? "Delete",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
        key: key,
        child: child);
  }

  Container savedPlaces(
      {required String title,
      required String subtitle,
      required IconData iconData,
      required Color? iconColor,
      bool hasLeading = true}) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (hasLeading)
              //Leading Icon
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  iconData,
                  color: iconColor,
                ),
              ),
            //will be padding instead of leading icon
            if (!hasLeading)
              SizedBox(
                width: 12,
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Title
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: hasLeading ? Colors.black : Colors.blue),
                ),
                SizedBox(
                  height: 4.0,
                ),
                //Subtitle
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 11.0,
                  ),
                )
              ],
            )
          ],
        ),
        //Trailing
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16.0,
          ),
        ),
      ],
    ));
  }

  AppBar customAppBar() {
    return AppBar(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius)),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: 22.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Saved Places",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Save your favorite destinations',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
