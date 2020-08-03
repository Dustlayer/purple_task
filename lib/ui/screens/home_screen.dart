import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:to_do/ui/strings/strings.dart';
import 'package:to_do/ui/view_models/category_model.dart';
import 'package:to_do/ui/widgets/add_category_button.dart';
import 'package:to_do/ui/widgets/category_card.dart';
import 'package:to_do/ui/widgets/greetings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _appWidth;
  double _appHeight;
  Color _color = Colors.deepPurple;
  int _categoryIndex = 0;

  bool get _isPortrait => _appWidth < _appHeight;

  @override
  Widget build(BuildContext context) {
    // get strings from Strings class
    final s = Provider.of<Strings>(context, listen: false);
    final categoryListProvider =
        Provider.of<CategoryList>(context, listen: false);
    _color = categoryListProvider.categoryList[_categoryIndex].color;
    _appWidth = MediaQuery.of(context).size.width;
    _appHeight = MediaQuery.of(context).size.height;
    print('is rebuilding');
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey[850], _color, _color]),
          ),
          child: Flex(
            direction: _isPortrait ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 8.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.0),
                      Greetings(
                        greetings: s.greetings,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer<CategoryList>(
                        builder: (_, categoryListModel, __) {
                          // set color based on category
                          _color = categoryListModel
                              .categoryList[_categoryIndex].color;
                          return PageView.builder(
                            controller: PageController(
                              // keep the same padding for all sizes
                              viewportFraction: (_appWidth - 80) / _appWidth,
                            ),
                            onPageChanged: (int index) => setState(
                              () {
                                _color =
                                    categoryListModel.categoryList[index].color;
                                _categoryIndex = index;
                              },
                            ),
                            itemCount: categoryListModel.categoryList.length,
                            itemBuilder: (context, index) => CategoryCard(
                              editTooltip: s.edit,
                              name:
                                  '${categoryListModel.categoryList[index].name}',
//                              color:
//                                  categoryListModel.categoryList[index].color,
//                              icon: categoryListModel.categoryList[index].icon,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: AddCategoryButton(
                        opacity: 1.0,
                        text: s.addCategory,
                        onPressed: () => print('add category pressed'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
