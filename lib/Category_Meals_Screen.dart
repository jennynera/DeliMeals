
import 'meal_item.dart';
import 'package:flutter/material.dart';
import 'models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
 
final List<Meal>availablemeal;
CategoryMealsScreen(this.availablemeal);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
   String categoryTitle;
   List <Meal>displayedMeals;
   var loadedinitdata=false;


 
 @override
   void didChangeDependencies() {
     if(loadedinitdata==false){}
     final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
     categoryTitle= routeArgs['title'];
    final categoryid= routeArgs['id'];
    displayedMeals = widget.availablemeal.where((meal){
      return meal.categories.contains(categoryid);
    }).toList();
    loadedinitdata=true;
    


     super.didChangeDependencies();
   }
 
  void removeMeal(String mealId){
  setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar:AppBar(title:Text(categoryTitle) ,),
          body: ListView.builder(itemBuilder: (ctx,index){
            return MealItem(
              id:displayedMeals [index].id,
            title:displayedMeals [index].title,
            imageUrl:displayedMeals[index].imageUrl,
            duration:displayedMeals[index].duration,
            complexity:displayedMeals[index].complexity,
            affordability:displayedMeals[index].affordability,
           // removeItem: removeMeal,
            ) ;
                     },itemCount:displayedMeals.length
          )
    );
  }
}