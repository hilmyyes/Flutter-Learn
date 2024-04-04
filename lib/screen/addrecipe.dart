// ignore_for_file: prefer_const_constructors, override_on_non_overriding_member, non_constant_identifier_names, sort_child_properties_last, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../class/recipe.dart';

// ignore: use_key_in_widget_constructors
class AddRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddRecipeState();
  }
}

class _AddRecipeState extends State<AddRecipe> {
  final TextEditingController _recipe_name_cont = TextEditingController();
  final TextEditingController _recipe_desc_cont = TextEditingController();
  final TextEditingController _recipe_photo_cont = TextEditingController();
  int _charleft = 0;
  String _recipe_category = "Traditional";

  @override
  void initState() {
    super.initState();
    _recipe_name_cont.text = "your food name";
    _recipe_desc_cont.text = "Recipe of ...";
    _recipe_photo_cont.text = "https://static.vecteezy.com/system/resources/previews/004/141/669/non_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg";
    _charleft = 200 - _recipe_desc_cont.text.length;
  }

  Color getButtonColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                  controller: _recipe_name_cont,
                  onChanged: (v) {
                    print(_recipe_name_cont.text);
                    print(v);
                  }),
            ),
            TextField(
              controller: _recipe_desc_cont,
              onChanged: (v) {
                setState(() {
                  _charleft = 200 - v.length;
                });
              },
              keyboardType: TextInputType.multiline,
            ),
            Text("char left : " + _charleft.toString()),
            DropdownButton(
                value: _recipe_category,
                items: const [
                  DropdownMenuItem(
                    child: Text("Traditional"),
                    value: "Traditional",
                  ),
                  DropdownMenuItem(
                    child: Text("Japanese"),
                    value: "Japanese",
                  ),
                ],
                onChanged: (v) {
                  setState(() {
                    _recipe_category = v!;
                  });
                }),
            TextField(
              controller: _recipe_photo_cont,
              onSubmitted: (v) {
                setState(() {});
              },
            ),
            Image.network(_recipe_photo_cont.text),
            ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(5),
                  backgroundColor:
                      MaterialStateProperty.resolveWith(getButtonColor),
                ),
                onPressed: () {
                  recipes.add(Recipe(
                    id: recipes.length + 1,
                    name: _recipe_name_cont.text,
                    desc: _recipe_desc_cont.text,
                    photo: _recipe_photo_cont.text,
                    category: _recipe_category,
                  ));
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text('Add Recipe'),
                            content: Text('Recipe successfully added'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ));
                },
                child: Text('SUBMIT')),
          ],
        ),
      ),
    );
  }
}
