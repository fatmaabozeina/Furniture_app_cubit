import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyans_creative_task/bloc/cubit.dart';
import 'package:lyans_creative_task/bloc/states.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'home_main_menu_button.dart';
import 'item_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchBar searchBar;
  // building app bar using backage
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFF5EEE1),
      iconTheme: IconThemeData(color: Color(0xFF297F87)),
      title: new Text(
        'My Home Page',
        style: TextStyle(color: Color(0xFF297F87)),
      ),
      actions: [searchBar.getSearchAction(context)],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchBar = SearchBar(
        setState: setState,
        inBar: false,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  FurnitureCubit cubit = FurnitureCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit
        ..getChairs()
        ..getDinningRooms()
        ..getBedrooms()
        ..getSofas(),
      child: BlocConsumer<FurnitureCubit, FurnitureStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // if (state is FChangeCategoryButtonState) {

            // }
            return Scaffold(
                backgroundColor: Color(0xFFF5EEE1),
                appBar: searchBar.build(context),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        height: 100,
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: Color(0xFFC2FFF9),
                          ),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'drawer header',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(
                            'setting',
                            style: TextStyle(fontSize: 20),
                          ),
                          leading: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    Container(
                      height: 40,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.categoryNames.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                width: 10,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return CategoryButton(
                              buttonAction: () {
                                if (index == 0) {
                                  cubit.getChairs();
                                } else if (index == 1) {
                                  cubit.getDinningRooms();
                                } else if (index == 2) {
                                  cubit.getSofas();
                                } else if (index == 3) {
                                  cubit.getBedrooms();
                                }

                                cubit.changeCategoryButton(index);
                              },
                              fillColor: cubit.currentIndex == index
                                  ? cubit.baseColor
                                  : cubit.labelColor,
                              labelColor: cubit.currentIndex == index
                                  ? cubit.labelColor
                                  : cubit.baseColor,
                              label: cubit.categoryNames[index],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: cubit.aItems.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          child: ItemCard(image: cubit.aItems[index].image),
                        ),
                      ),
                    ),
                  ]),
                ));
          }),
    );
  }
}
