class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Interactive Search Map",
    image: "assets/image/m1.png",
    desc:
        "Search for properties in preferred areas using our intuitive interactive map.",
  ),
  OnboardingContents(
    title: "Interactive Masterplans",
    image: "assets/image/m2.png",
    desc:
        "Get a birds eye view of your next living space, discover all the spaces and each aspect of it.",
  ),
  OnboardingContents(
    title: "360° Virtual Tour",
    image: "assets/image/m3.png",
    desc:
        "Get a birds eye view of your next living space, discover all the spaces and each aspect of it.",
  ),
  OnboardingContents(
    title: "Mortgage Calculator",
    image: "assets/image/m4.png",
    desc: "Use our calculator to find the best rates and terms for you!",
  ),
];
