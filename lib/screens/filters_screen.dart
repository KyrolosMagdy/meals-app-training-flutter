import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);

  static const routeName = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, bool value, Function onChange, String subTitle) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (value) => onChange(value),
      subtitle: Text(subTitle, style: const TextStyle(color: Colors.black45)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(
                Icons.save,
              ),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  _glutenFree,
                  (bool value) {
                    setState(() {
                      _glutenFree = value;
                    });
                  },
                  'Only include gluten-free meals',
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  _lactoseFree,
                  (bool value) {
                    setState(() {
                      _lactoseFree = value;
                    });
                  },
                  'Only include lactose-free meals',
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  _vegetarian,
                  (bool value) {
                    setState(() {
                      _vegetarian = value;
                    });
                  },
                  'Only include vegetarian meals',
                ),
                _buildSwitchListTile(
                  'Vegan',
                  _vegan,
                  (bool value) {
                    setState(() {
                      _vegan = value;
                    });
                  },
                  'Only include vegan meals',
                ),
              ],
            ))
          ],
        ));
  }
}
