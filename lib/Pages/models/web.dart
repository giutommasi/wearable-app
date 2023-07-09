class Category {
  final String name, url;
  final List<String> websites;

  Category({required this.name, required this.websites, required this.url});
}

List<Category> categories = [
  Category(
    url: 'assets/healthFood.jpg',
    name: 'Food',
    websites: [
      'https://health.gov/myhealthfinder/pregnancy/nutrition-and-physical-activity/eat-healthy-during-pregnancy-quick-tips',
      'https://health.gov/myhealthfinder/pregnancy/nutrition-and-physical-activity/eat-healthy-while-breastfeeding-quick-tips',
      'https://health.gov/myhealthfinder/topics/everyday-healthy-living/nutrition/get-enough-folic-acid',
      'https://www.nhs.uk/pregnancy/keeping-well/have-a-healthy-diet/',
      'https://www.nhs.uk/pregnancy/keeping-well/vegetarian-or-vegan-and-pregnant/',
      'https://www.nhs.uk/pregnancy/keeping-well/foods-to-avoid/',
      'https://www.nhs.uk/pregnancy/keeping-well/vitamins-supplements-and-nutrition/',
      'https://www.nhs.uk/pregnancy/keeping-well/drinking-alcohol-while-pregnant/',
      'https://www.healthline.com/nutrition/13-foods-to-eat-when-pregnant',
      'https://www.tommys.org/pregnancy-information/im-pregnant/eating-well-pregnancy',
      'https://www.pregnancybirthbaby.org.au/healthy-diet-during-pregnancy',
      'https://www.pregnancybirthbaby.org.au/having-a-healthy-pregnancy',
      'https://www.pregnancybirthbaby.org.au/caffeine-during-pregnancy',
      'https://www.pregnancybirthbaby.org.au/foods-to-avoid-when-pregnant',
      'https://www.pregnancybirthbaby.org.au/vitamins-and-supplements-during-pregnancy',
      'https://www.mayoclinic.org/healthy-lifestyle/pregnancy-week-by-week/in-depth/pregnancy-nutrition/art-20045082',
      'https://www.webmd.com/baby/eating-right-when-pregnant',
    ],
  ),
  Category(
    url: 'assets/fitness.jpg',
    name: 'Fitness',
    websites: [
      'https://www.nhs.uk/pregnancy/keeping-well/exercise/',
      'https://health.gov/myhealthfinder/pregnancy/nutrition-and-physical-activity/stay-active-during-pregnancy-quick-tips',
      'https://www.fitnesswebsite3.com',
      'https://www.tommys.org/pregnancy-information/im-pregnant/being-healthy/exercise',
      'https://www.tommys.org/pregnancy-information/im-pregnant/being-healthy/weight-management',
      'https://www.pregnancybirthbaby.org.au/exercising-during-pregnancy',
      'https://www.pregnancybirthbaby.org.au/pelvic-floor-exercises',
      'https://www.pregnancybirthbaby.org.au/playing-sport-during-pregnancy',
      'https://www.pregnancybirthbaby.org.au/yoga-and-pilates-during-pregnancy',
      'https://www.marchofdimes.org/find-support/topics/pregnancy/exercise-during-pregnancy',
      'https://www.acog.org/womens-health/faqs/exercise-during-pregnancy',
      'https://www.mayoclinic.org/healthy-lifestyle/pregnancy-week-by-week/in-depth/pregnancy-and-exercise/art-20046896',
      'https://www.tommys.org/pregnancy-information/im-pregnant/being-healthy/exercise/types-exercise-pregnancy',
      'https://americanpregnancy.org/healthy-pregnancy/is-it-safe/exercise-during-pregnancy/',
      'https://www.hopkinsmedicine.org/health/conditions-and-diseases/staying-healthy-during-pregnancy/3-myths-about-exercise-and-pregnancy',
      'https://www.pregnancybirthbaby.org.au/exercising-during-pregnancy',
    ],
  ),
  Category(
    url: 'assets/sleep.jpg',
    name: 'General',
    websites: [
      'https://www.nhs.uk/pregnancy/keeping-well/mental-health/',
      'https://www.nhs.uk/pregnancy/keeping-well/depression/',
      'https://www.nhs.uk/pregnancy/keeping-well/sex/',
      'https://www.nhs.uk/pregnancy/keeping-well/travelling/',
      'https://www.nhs.uk/pregnancy/keeping-well/your-health-at-work/',
      'https://www.nhs.uk/pregnancy/keeping-well/stop-smoking/',
      'https://www.nhs.uk/pregnancy/keeping-well/illegal-drugs/',
      'https://www.nhs.uk/pregnancy/keeping-well/infections-that-may-affect-your-baby/',
      'https://www.nhs.uk/pregnancy/keeping-well/pregnancy-and-covid-19/',
      'https://www.nhs.uk/pregnancy/keeping-well/medicines/',
      'https://www.nhs.uk/pregnancy/keeping-well/vaccinations/',
      'https://www.nhs.uk/pregnancy/keeping-well/pregnancy-breastfeeding-fertility-and-covid-19-vaccination/',
      'https://www.nhs.uk/pregnancy/keeping-well/whooping-cough-vaccination/',
      'https://www.nhs.uk/pregnancy/keeping-well/your-babys-movements/',
      'https://www.nhs.uk/pregnancy/keeping-well/reducing-the-risk-of-stillbirth/',
      'https://www.verywellfamily.com/tips-for-a-healthy-pregnancy-2753102',
      'https://raisingchildren.net.au/pregnancy/week-by-week/about-pregnancy/pregnancy-overview',
    ],
  ),
];

Map<String, String> selectedWebsites = {};

void _selectWebsites() {
  DateTime now = DateTime.now();

  for (var category in categories) {
    int categoryIndex = now.day % category.websites.length;
    selectedWebsites[category.name] = category.websites[categoryIndex];
  }
}
