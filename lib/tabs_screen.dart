import 'package:flutter/material.dart';
import 'package:meals_app/drawer.dart';
import 'categories_screen.dart';
import 'favorities_screen.dart';
import 'drawer.dart';
import 'models/meal.dart';

class TabsScreen  extends StatefulWidget {
  final List <Meal>favoritemeal;
  TabsScreen(this.favoritemeal);

  @override
   TabsScreenState createState() =>  TabsScreenState();
}

class  TabsScreenState extends State <TabsScreen> {
 
  List<Map<String, Object>>_pages;

   int SelectedPagesIndex = 0;
  @override
   initState(){
   _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritiesScreen(widget.favoritemeal),
      'title': 'Your Favorite',
    },
  ];

}
  
   void selectpage(int index){
     setState(() {
        SelectedPagesIndex=index;    
          });

   }
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      drawer:MainDrawer() ,
      appBar: AppBar(
        title: Text(_pages[SelectedPagesIndex]['title']) ),
      body:_pages[SelectedPagesIndex]['page'],
      bottomNavigationBar:BottomNavigationBar(
        onTap:selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: SelectedPagesIndex,
         items: [
           BottomNavigationBarItem(
             backgroundColor: Theme.of(context).primaryColor,
             icon: Icon(Icons.category),
             title: Text('Categories')
          ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor, 
              icon:Icon(Icons.favorite),
              title:Text ('Favorite') )

         ] ) ,
    );
  }
}