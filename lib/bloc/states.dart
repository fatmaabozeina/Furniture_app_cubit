abstract class FurnitureStates {}

class FurnitureInitialState extends FurnitureStates {}

class FChangeCategoryButtonState extends FurnitureStates {}

class FBuildAppBarState extends FurnitureStates {}

class FInitAppBarState extends FurnitureStates {}

class FGetChairsDataSuccefulState extends FurnitureStates {}

class FGetChairsDataErrorState extends FurnitureStates {
  FGetChairsDataErrorState(error);
}

class FGetSofasDataSuccefulState extends FurnitureStates {}

class FGetSofasDataErrorState extends FurnitureStates {
  FGetSofasDataErrorState(error);
}

class FGetDoorsDataSuccefulState extends FurnitureStates {}

class FGetDoorsDataErrorState extends FurnitureStates {
  FGetDoorsDataErrorState(error);
}

class FGetBedRoomsDataSuccefulState extends FurnitureStates {}

class FGetBedRoomsDataErrorState extends FurnitureStates {
  FGetBedRoomsDataErrorState(error);
}
