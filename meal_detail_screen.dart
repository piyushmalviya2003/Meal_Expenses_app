import 'package:flutter/material.dart';
import './dummy__data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

Widget buildSectionTitle ( BuildContext context, String text){
  return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(text,
                style: Theme.of(context).textTheme.titleMedium,
              ), 
          );
  }

  Widget buildContainer( Widget child ){ 
    return  Container(
            decoration: BoxDecoration(
               color: Colors.white
            border: Border.all(color: Colors.grey),
            borderRadius : BorderRadius.circular(10),
          ),
          margin : EdgeInsets.all(10),
          Padding:EdgeInsets.all(10),
          height:180,
          width: 300,
          child: child ,
  );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    var selectedMeal;
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectMeal.title}'),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(selectMeal.imageUrl,
            fit: BoxFit.cover,
            ),
          ),
            buildSectionTitle( context, ' INgredients'),
        buildContainer(ListView.builder(
            itemBuilder: (
            ctx, index)=> Card(
            color : Theme.of(context).accentColor,
            child : Padding ( 
              padding :EdgeInsets.symmetric(
              vertical : 5,
            horizontal: 10,
            ), 
            child : Text (selectedMeal.ingredients[index]))
          ),
          itemCount : selectedMeal.ingredients.length,
          ),
      ),
      buildSectionTitle( context , 'steps'),
    
      buildContainer(
        ListView.builder(
        itemBuilder: (ctx ,index ) => Column(children: [ ListTile(
          leading : CircleAvatar(child: Text('# ${( index +1)}'),
          ),
          title : Text(
            selectedMeal.step[index],
          ),
        ),
        Divider()
        ],
        ),
        itemCount: selectedMeal.steps.length,
      ),
      ),
        ],
      ),
    );
  }
}