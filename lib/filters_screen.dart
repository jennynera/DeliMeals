import 'package:flutter/material.dart';
import 'package:meals_app/drawer.dart';


class FilterScreen  extends StatefulWidget {
 static const routeName='/filters';
 final Function savefilter;
 final Map<String,bool>currentfilters;
 FilterScreen(this.currentfilters,this.savefilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool gultenfree= false;
  bool vegetarian=false;
  bool vegan=false;
  bool lactoseFree=false;
  @override
  initState(){
    gultenfree=widget.currentfilters['gluten'];
    lactoseFree=widget.currentfilters['lactose'];
    vegetarian=widget.currentfilters['vegetarian'];
    vegan=widget.currentfilters['vegan'];
   super.initState();
  }
   
   Widget buildSwitchListTile(
     String title,
      String description,
      bool currentValue,
      Function updateValue
      ) {

     return SwitchListTile(
              title:Text(title),
              value: currentValue,
               subtitle:Text(
                 description), 
               onChanged:updateValue,
                              
      );
   }
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Filters'),
        actions: [
        TextButton(child: Text('Apply'),
        style:TextButton.styleFrom(primary: Colors.white),
        onPressed:() {
          final selectedfilter={
            'gluten':gultenfree,
            'lactose':lactoseFree,
            'vegan':vegan,
            'vegetarian':vegetarian,

          };
          widget.savefilter(selectedfilter);})
        ], ),
        drawer: MainDrawer(),

      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection',
          style: Theme.of(context).textTheme.title),

        ),
        Expanded(child: ListView(
          children: [
            buildSwitchListTile('Gulten-Free',
            'Only include gluten-free meals',
             gultenfree, 
             (newValue){
               setState(() {
                gultenfree=newValue;
                              });

            }),
           buildSwitchListTile('Vegetarian',
            'Only include Vegetarian meals',
             vegetarian, 
             (newValue){
               setState(() {
                vegetarian=newValue;
                              });
            

            }),
            buildSwitchListTile('Vegan',
            'Only include Vegan meals',
             vegan, 
             (newValue){
               setState(() {
                vegan=newValue;
                              }); }),

             buildSwitchListTile('Lactose-Free',
            'Only include Lactose-free meals',
             lactoseFree, 
             (newValue){
               setState(() {
                lactoseFree=newValue;
                              }); }),

            
          ],
        ))

      ],)
    );
      

  }
}