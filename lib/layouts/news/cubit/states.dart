abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error ;

  NewsGetBusinessErrorStates(this.error);

}

class NewsSportsLoadingStates extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String error ;

  NewsGetSportsErrorStates(this.error);

}

class NewsScienceLoadingStates extends NewsStates {}

class NewsGetScienceSuccessStates extends NewsStates {}

class NewsGetScienceErrorStates extends NewsStates {
  final String error ;

  NewsGetScienceErrorStates(this.error);

}