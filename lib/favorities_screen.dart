import 'package:flutter/material.dart';
import 'models/meal.dart';
import 'meal_item.dart';



class FavoritiesScreen extends StatelessWidget {
  final List<Meal> favouritemeal;
  FavoritiesScreen(this.favouritemeal);

  @override
  Widget build(BuildContext context) {
    if(favouritemeal.isEmpty){
       return Center(
     child:Text(' You  have no favorites yet -start adding some!'));
    }else{
      return ListView.builder(itemBuilder: (ctx,index){
            return MealItem(
              id:favouritemeal [index].id,
            title:favouritemeal [index].title,
            imageUrl:favouritemeal[index].imageUrl,
            duration:favouritemeal[index].duration,
            complexity:favouritemeal[index].complexity,
            affordability:favouritemeal[index].affordability,
            
            ) ;
                     },itemCount:favouritemeal.length
          );

    }
   
    
  }
}