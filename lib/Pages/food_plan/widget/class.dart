class WeeklyMealsSummary {
  List<Meal> weeklyMeals;
  int kcal;
  String day;
  double prot;
  double carbs;
  double fat;

  WeeklyMealsSummary({required this.day, required this.carbs, required this.prot, required this.fat, required this.kcal ,required this.weeklyMeals}) ;
  
}

class Meal {
  final String mealType;
  final List<Food> foods;

  Meal({required this.mealType, required this.foods });


}
class Food {
  final String name, unit;
  final String path;
  final double weight, prot, fat, carbs;
  final int kCal;
  final String? details;

  Food({required this.name, this.details ,required this.weight, required this.unit, required this.path, required this.kCal, required this.prot, required this.fat, required this.carbs, });
}

final List<WeeklyMealsSummary> Week = [
  WeeklyMealsSummary(day: '1', carbs: 420, prot: 143, fat: 65, kcal: 2094, weeklyMeals: weeklyMeals1),
  WeeklyMealsSummary(day: '2',carbs: 379, prot: 104, fat: 76, kcal: 1910, weeklyMeals: weeklyMeals2),
  WeeklyMealsSummary(day: '3',carbs: 445, prot: 184, fat: 82, kcal: 2507, weeklyMeals: weeklyMeals3),
  WeeklyMealsSummary(day: '4',carbs: 368, prot: 125, fat: 72, kcal: 2160, weeklyMeals: weeklyMeals4),
  WeeklyMealsSummary(day: '5',carbs: 460, prot: 163, fat: 71, kcal: 2257, weeklyMeals: weeklyMeals5),
  WeeklyMealsSummary(day: '6', carbs: 263, prot: 141, fat: 45, kcal: 2035, weeklyMeals: weeklyMeals6),
  WeeklyMealsSummary(day: '7',carbs: 229, prot: 116, fat: 68, kcal: 1535, weeklyMeals: weeklyMeals7),
];
final List<Meal> weeklyMeals1 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Muesli',weight: 35, unit: 'g', path: 'assets/muesli.jpg', kCal: 176, prot: 8, fat: 6, carbs: 22),
      Food(name:'Apple',details: 'Red, Yellow, Green...', weight: 100, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 14, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Apple',details: 'Red, Yellow, Green...', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'Pasta', weight: 90, unit:'g',path: 'assets/pasta.jpg', kCal: 204, carbs: 55, fat: 1, prot: 10),
      Food(name:'Tomato Puree', weight: 100, unit:'g',path: 'assets/verdura.png', kCal: 28, carbs: 5, fat: 0, prot: 13),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Chicken Breast', details: 'Grilled',weight: 100,unit: 'g',path: 'assets/pollo.jpg', kCal: 265, prot: 25, carbs: 0, fat: 2),
      Food(name:'Green Radish', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wheat Bread', weight: 25, unit:'g',path: 'assets/pane.jpg', kCal: 140, carbs: 38, fat: 2, prot: 4),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 80, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Beans', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 45, carbs: 8, fat: 0, prot: 5),
      Food(name:'Codfish', weight: 150, unit:'g', path: 'assets/pesce.jpeg', kCal: 130, carbs: 0, fat: 2, prot: 15),
      Food(name:'Zuchinis', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 35, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
];


final List<Meal> weeklyMeals2 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Corn Flakes',weight: 35, unit: 'g', path: 'assets/muesli.jpg', kCal: 165, prot: 6, fat: 8, carbs: 40),
      Food(name:'Orange', weight: 100, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 14, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Orange', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'White Rice', weight: 90, unit:'g',path: 'assets/riso.jpg', kCal: 124, carbs: 60, fat: 3, prot: 8),
      Food(name:'Zuchinis', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Chicken Breast', details: 'Grilled',weight: 100,unit: 'g',path: 'assets/pollo.jpg', kCal: 165, prot: 25, carbs: 0, fat: 2),
      Food(name:'Lettuce', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 126, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 100, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Grape', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 80, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Chickpeas', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 45, carbs: 12, fat: 0, prot: 8),
      Food(name:'European Bass', details: 'Grilled',weight: 150, unit:'g', path: 'assets/pesce.jpeg', kCal: 130, carbs: 0, fat: 2, prot: 15),
      Food(name:'Cherry Tomatoes', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 126, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Grape', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 13, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
];


final List<Meal> weeklyMeals3 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Puffed Rice',weight: 55, unit: 'g', path: 'assets/muesli.jpg', kCal: 165, prot: 12, fat: 8, carbs: 65),
      Food(name:'Kiwi', weight: 100, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 14, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Kiwi', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'Emmer', weight:70, unit:'g',path: 'assets/pasta.jpg', kCal: 124, carbs: 55, fat: 3, prot: 9),
      Food(name:'Potatoes', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 7, fat: 1, prot: 3),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Flounder', details: 'Grilled',weight: 100,unit: 'g',path: 'assets/pesce.jpeg', kCal: 165, prot: 32, carbs: 1, fat: 5),
      Food(name:'Lettuce', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 25, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 12, fat: 1, prot: 2),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Pomegranate', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 80, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Lentils', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 45, carbs: 11, fat: 0, prot: 12),
      Food(name:'Whole Eggs',weight: 150, unit:'g', path: 'assets/uova.jpg', kCal: 200, carbs: 0, fat: 2, prot: 30),
      Food(name:'Asparagus', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Pomegranate', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 13, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
];


final List<Meal> weeklyMeals4 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Oat Flakes',weight: 55, unit: 'g', path: 'assets/muesli.jpg', kCal: 125, prot: 10, fat: 3, carbs: 10),
      Food(name:'Melon', weight: 150, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 12, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Melon',details: 'Red, Yellow, Green...', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'Polenta', weight:100, unit:'g',path: 'assets/pasta.jpg', kCal: 124, carbs: 65, fat: 6, prot: 12),
      Food(name:'Zuchinis', weight: 100,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 0, fat: 1, prot: 3),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Cuttlefish', details: 'Grilled',weight: 130,unit: 'g',path: 'assets/pesce.jpeg', kCal: 150, prot: 21, carbs: 0, fat: 9),
      Food(name:'Celery', weight: 100,unit: 'g',path: 'assets/verdura.png', kCal: 23, carbs: 6, fat: 1, prot: 3),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 75, carbs: 0, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 12)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Fava Beans', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 120, carbs: 12, fat: 2, prot: 5),
      Food(name:'Ricotta',weight: 150, unit:'g', path: 'assets/uova.jpg', kCal: 130, carbs: 25, fat: 7, prot: 62),
      Food(name:'Turnips', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 13, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
];

final List<Meal> weeklyMeals5 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Muesli',weight: 35, unit: 'g', path: 'assets/muesli.jpg', kCal: 174, prot: 5, fat: 3, carbs: 25),
      Food(name:'Orange', weight: 150, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 12, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Orange',details: 'Red, Yellow, Green...', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  43, carbs: 18, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'Pasta', weight:90, unit:'g',path: 'assets/pasta.jpg', kCal: 254, carbs: 75, fat: 7, prot: 125),
      Food(name:'Eggplant', weight: 100,unit: 'g', path: 'assets/verdura.png',kCal: 27, carbs: 7, fat: 1, prot: 3),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Chicken Breast', details: 'Grilled',weight: 130,unit: 'g',path: 'assets/pesce.jpeg', kCal: 400, prot: 63, carbs: 0, fat: 7),
      Food(name:'Green Radish', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 25, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 12, fat: 1, prot: 2),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 75, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Beans', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 145, carbs: 12, fat: 2, prot: 15),
      Food(name:'Codfish',weight: 120, unit:'g', path: 'assets/pesce.jpeg', kCal: 330, carbs: 25, fat: 7, prot: 34),
      Food(name:'Zuchinis', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Pear', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 13, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
];

final List<Meal> weeklyMeals6 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Corn Flakes',weight: 55, unit: 'g', path: 'assets/muesli.jpg', kCal: 135, prot: 8, fat: 8, carbs: 35),
      Food(name:'Kiwi', weight: 100, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 14, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Kiwi', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'White Rice', weight:90, unit:'g',path: 'assets/pasta.jpg', kCal: 276, carbs: 75, fat: 2, prot: 9),
      Food(name:'Carrots', weight: 100,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 8, fat: 0, prot: 0),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Veal Fillet', details: 'Grilled',weight: 100,unit: 'g',path: 'assets/pesce.jpeg', kCal: 340, prot: 42, carbs: 0, fat: 8),
      Food(name:'Red Radish', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 21, carbs: 7, fat: 0, prot: 0),
      Food(name:'Wholemeal Bread', weight: 25, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 12, fat: 1, prot: 2),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Banana', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 75, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Chickpeas', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 105, carbs: 6, fat: 0, prot: 19),
      Food(name:'Fillet Bream',weight: 150, unit:'g', path: 'assets/pesce.jpeg', kCal: 250, carbs: 0, fat: 2, prot: 30),
      Food(name:'Black Olives', weight: 20,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 2, fat: 1, prot: 0),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Rice Crackers', details: 'Alternatively corn', weight: 16, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16),
      Food(name:'Banana', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 75, carbs: 14, fat: 0, prot: 0),
      
    ],),
];


final List<Meal> weeklyMeals7 = [
  Meal(
    mealType: 'Breakfast',
    foods: [
      Food(name: 'Milk', details: 'Semi Skimmed',weight: 250, unit: 'ml', path: 'assets/latte.png', kCal: 106, prot: 8.5, fat: 9, carbs: 12),
      Food(name: 'Puffed Rice',weight: 55, unit: 'g', path: 'assets/muesli.jpg', kCal: 115, prot: 12, fat: 8, carbs: 65),
      Food(name:'Apple', weight: 100, unit: 'g',path: 'assets/frutta.jpg', kCal: 52, carbs: 7, fat: 0, prot: 0),
    ],),
  Meal(
    mealType:'Snack I',
    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice',weight: 120, unit:'g',path: 'assets/yogurt.jpg', kCal: 100, carbs: 8, prot: 10, fat: 7),
      Food(name:'Apple', weight: 100, unit:'g',path: 'assets/frutta.jpg', kCal:  52, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 9)
    ],),
  Meal(
    mealType:'Lunch',
    foods: [
      Food(name:'Barley', weight:70, unit:'g',path: 'assets/pasta.jpg', kCal: 125, carbs: 45, fat: 3, prot: 9),
      Food(name:'Pumpkin', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 7, fat: 0, prot: 1),
      Food(name:'Grain Cheeses', weight: 10, unit:'g',path: 'assets/formaggio.jpg', kCal: 38, carbs: 0, prot: 3, fat: 3 ),
      Food(name:'Lettuce', weight: 70,unit: 'g',path: 'assets/verdura.png', kCal: 19, carbs: 1, fat: 1, prot: 3),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 9),
      Food(name:'Banana', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 75, carbs: 14, fat: 0, prot: 0),
      Food(name:'Olive Oil', details: 'Extra Virgin',weight: 20,unit: 'g',path: 'assets/olio.jpg', kCal: 140, carbs: 0, fat: 15, prot: 0),
    ],),
  Meal(
    mealType:'Snack II',

    foods: [
      Food(name:'Yogurt', details: 'Typology: free choice', weight: 120, unit:'g', path: 'assets/yogurt.jpg', kCal: 101, carbs: 8, prot: 10, fat: 7),
      Food(name:'Pomegranate', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 80, carbs: 14, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn', weight: 8, unit:'g', path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 16)
    ],),
  Meal(
    mealType:'Dinner',
    foods: [
      Food(name:'Lentils', weight: 40,unit: 'g', path: 'assets/legumi.jpg', kCal: 45, carbs: 11, fat: 0, prot: 12),
      Food(name:'Whole Eggs',weight: 150, unit:'g', path: 'assets/uova.jpg', kCal: 131, carbs: 0, fat: 2, prot: 20),
      Food(name:'Asparagus', weight: 200,unit: 'g', path: 'assets/verdura.png',kCal: 19, carbs: 6, fat: 1, prot: 3),
      Food(name:'Wholemeal Bread', weight: 75, unit:'g', path: 'assets/pane.jpg', kCal: 156, carbs: 33, fat: 1, prot: 6),
      Food(name:'Olive Oil', details: 'Extra Virgin', weight: 15,unit: 'g', path: 'assets/olio.jpg', kCal: 130, carbs: 0, fat: 15, prot: 0),

    ],),
    Meal(
    mealType:'Snack III',
    foods: [
      Food(name:'Pomegranate', weight: 100, unit:'g', path: 'assets/frutta.jpg', kCal: 43, carbs: 13, fat: 0, prot: 0),
      Food(name:'Rice Crackers', details: 'Alternatively Corn',weight: 16, unit:'g',path: 'assets/galletta.jpg', kCal: 80, prot: 4, fat: 1, carbs: 9),
    ],),
];
