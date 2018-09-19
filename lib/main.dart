import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
        home: new HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
           appBar: AppBar(
             title: new Text("Search Location"),
             actions: <Widget>[
               IconButton(icon:Icon(Icons.search),onPressed: () {
                 showSearch(context:context,delegate:DataSearch());
               }),
             ],
           ),
           drawer: Drawer(),

    );
  }
}

class DataSearch extends SearchDelegate<String>{

final cities= [
  "Noida",
  "Mumbia",
  "Delhi",
  "Goa",
  "Patna",
  "Nagalend",
  "panka",
  "panatna",
  "muna",
  "node",
  "Sasaram",
  "Banglare",
  "pune",
  "kolhapur",
  "New Delhi"
];

final recentcities= [
  "Mumbia",
  "Delhi",
  "Banglare",
  "pune"
];




  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear),onPressed: () {
      query="";
    })];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context,null);
      }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          child: Card(
            color: Colors.blue,
            child: Center(
              child: Text(query),
            ),
          ),
        ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList=query.isEmpty 
    ? recentcities 
    : cities.where((p)=>p.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context,index)=>ListTile(
          onTap: (){
            showResults(context);
          },
          leading:Icon(Icons.location_city),
          title: RichText(
            text:TextSpan(
              text:suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color:Colors.black,fontWeight:FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                  )
                ])
            )
          ),
          itemCount: suggestionList.length,
    );
  }

}