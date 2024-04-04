import 'package:flutter/material.dart';
import '../class/recipe.dart';

class Basket extends StatefulWidget {
  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  List<Recipe> _basketRecipes = List.from(recipes);

  void _removeRecipe(int recipeId) {
    setState(() {
      _basketRecipes.removeWhere((recipe) => recipe.id == recipeId);
    });
  }

  List<Widget> widRecipes(BuildContext context) {
    List<Widget> temp = [];
    for (int i = 0; i < _basketRecipes.length; i++) {
      Widget w = Container(
        margin: EdgeInsets.all(15),
        child: Card(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  _basketRecipes[i].name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Image.network(_basketRecipes[i].photo),
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  _basketRecipes[i].desc,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  "Category: " + _basketRecipes[i].category,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold,color: Colors.green),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final confirmation = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Remove Receipt'),
                      content:
                          Text('Are you sure you want to remove this receipt?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text('Remove'),
                        ),
                      ],
                    ),
                  );
                  if (confirmation == true){
                    _removeRecipe(_basketRecipes[i].id);
                  }
                },
                child: Text('Remove',style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ),
      );
      temp.add(w);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Your basket "),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: widRecipes(context),
            ),
            Divider(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
