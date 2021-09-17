import 'package:flutter/material.dart';
import 'package:meals_app/Category_Meals_Screen.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/meal_detail_screen.dart';
import 'tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,

  };
  List<Meal>availableMeal=DUMMY_MEALS;
  List<Meal>favourite=[];
  
void setFilter (Map <String,bool>filterdata){
  setState(() {
    filters=filterdata;

      
      availableMeal=DUMMY_MEALS.where((meal){
       if(filters['gluten'] && !meal.isGlutenFree){
         return false;
       }
        if(filters['lactose'] && !meal.isLactoseFree){
         return false;
       }
        if(filters['vegan'] && !meal.isVegan){
         return false;
       }
        if(filters['vegetarian'] && !meal.isVegetarian){
         return false;
       }
       return true;

      }).toList();
    });
}
void togglefav(String mealId){
 final existingindex= favourite.indexWhere((meal) =>meal.id==mealId);
 if(existingindex>=0){
setState(() {
  favourite.removeAt(existingindex);
});}
else{
  setState(() {
      favourite.add(DUMMY_MEALS.firstWhere((meal) =>meal.id==mealId));
    });
}
 }
 
 bool isMealFavourite(String id){
   return favourite.any((meal) =>meal.id==id);
 }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor:Colors.amber,
        canvasColor: Color.fromRGBO(255,254,229,1)
      ),
     // home: CategoriesScreen(),
     initialRoute: '/',
      routes:{
        '/':(ctx)=>TabsScreen(favourite),
        '/categories':(ctx)=> CategoryMealsScreen(availableMeal),
        MealDetailScreen.routeName:(ctx)=>MealDetailScreen(togglefav,isMealFavourite),
        FilterScreen.routeName:(ctx)=>FilterScreen(filters,setFilter)

      }
    );
  }
}

