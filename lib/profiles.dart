final List<Profile> demoProfiles = [
  new Profile(
    photos: [
      "assets/PER1.jpg",
      "assets/PER2.jpg",
      "assets/PER3.jpg",
    ],
    name: "Vancance",
    bio:
        "J'ai gagné des places pour un voyage de mon choix. Est ce que je choisi le Pérou ?",
  ),
  new Profile(
    photos: [
      "assets/SNK1.jpg",
      "assets/SNK2.jpg",
      "assets/SNK3.jpg",
    ],
    name: "Chaussure",
    bio: "Que pensez-vous de ce modele ?",
  ),
  new Profile(
    photos: [
      "assets/TER1.jpg",
      "assets/TER2.jpg",
    ],
    name: "Avant / Après",
    bio: "Je viens de refaire ma terrasse, vous en pensez quoi ?",
  ),
  new Profile(
    photos: [
      "assets/VG1.jpg",
      "assets/VG2.jpg",
      "assets/VG3.jpg",
    ],
    name: "Peinture",
    bio: "J'ai commencé la peinture il y a 2 mois. C'est bien ?",
  ),
  new Profile(
    photos: [
      "assets/JEAN1.jpg",
      "assets/JEAN2.jpg",
    ],
    name: "MOI",
    bio: "note moi sur 5",
  ),
];

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}
