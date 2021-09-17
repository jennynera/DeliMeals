import 'package:flutter/material.dart';
//import './Category_Meals_Screen.dart';
 
 class CategoryItem extends StatelessWidget {
 final String id;
 final String title;
 final Color color;

 CategoryItem(this.id,this.title,this.color);

 void selectedCategory(BuildContext cxt){
   Navigator.of(cxt).pushNamed('/categories',
     arguments: {
     'id':id,
     'title':title
   }
    
   );
 }
   @override
   Widget build(BuildContext context) {
     return InkWell(
          onTap:()=> selectedCategory(context) ,
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
            child: Container(
         padding: const EdgeInsets.all(15),
         child: Text(title,
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 20
         ),),
         decoration: BoxDecoration(
           gradient:LinearGradient(
             colors:[
               color.withOpacity(0.7),
               color,
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight) ,
             borderRadius: BorderRadius.circular(15)
         )
           
         
       ),
     );
   }
 } 