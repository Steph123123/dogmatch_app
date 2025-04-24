class Personality {
  final String name;
  final String description;
  final List<String> compatibleBreeds;
  final String imageUrl;

  const Personality({
    required this.name,
    required this.description,
    required this.compatibleBreeds,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'compatibleBreeds': compatibleBreeds,
      'imageUrl': imageUrl,
    };
  }

  factory Personality.fromJson(Map<String, dynamic> json) {
    return Personality(
      name: json['name'],
      description: json['description'],
      compatibleBreeds: List<String>.from(json['compatibleBreeds'] as List),
      imageUrl: json['imageUrl'],
    );
  }
}

const List<Personality> personalities = [
  Personality(
    name: 'Adventurous',
    description: 'You possess a spirit of exploration and a deep-seated desire to experience new things. Routine feels limiting, and you are constantly seeking opportunities for excitement, whether it’s traveling to uncharted territories, trying extreme sports, or simply discovering hidden gems in your local area. You are energetic, bold, and always up for a challenge. A dog that can keep up with your active lifestyle and is equally curious about the world would be your ideal companion.',
    compatibleBreeds: ['Labrador Retriever', 'Border Collie', 'Jack Russell Terrier', 'Vizsla', 'Siberian Husky', 'Australian Shepherd'],
    imageUrl: 'https://media.istockphoto.com/id/483230196/es/foto/border-collie-a-las-monta%C3%B1as.jpg?s=612x612&w=0&k=20&c=Ka60IrfIq4xdIsb9pU-u420S9tWZkWcddQwyCL-3USs='
  ),
  Personality(
    name: 'Quiet',
    description: 'You find solace in tranquility and appreciate peaceful environments. Loud noises and bustling crowds can be overwhelming. Your ideal leisure time involves activities like reading a good book, enjoying a quiet afternoon with a comforting movie, or engaging in hobbies that require focus and stillness. You value a calm and predictable home life. A dog with a gentle demeanor who doesn’t require constant activity and can be content in a serene setting would be a wonderful match for your lifestyle.',
    compatibleBreeds: ['French Bulldog', 'Shih Tzu', 'Cocker Spaniel', 'Basset Hound', 'English Bulldog'],
    imageUrl: 'https://dogtime.com/wp-content/uploads/sites/12/2024/05/IMG_2118_1fb1a1-e1716281362685.jpeg?w=1024'
  ),
  Personality(
    name: 'Sporty',
    description: 'You find solace in tranquility and appreciate peaceful environments. Loud noises and bustling crowds can be overwhelming. Your ideal leisure time involves activities like reading a good book, enjoying a quiet afternoon with a comforting movie, or engaging in hobbies that require focus and stillness. You value a calm and predictable home life. A dog with a gentle demeanor who doesn’t require constant activity and can be content in a serene setting would be a wonderful match for your lifestyle.',
    compatibleBreeds: ['Weimaraner', 'Border Collie', 'Pointer', 'Boxer', 'Belgian Malinois'],
    imageUrl: 'https://cdn.outsideonline.com/wp-content/uploads/2024/05/PPSport_TrailRun.jpg'
  ),
  Personality(
    name: 'Sociable',
    description: 'You are energized by social interaction and genuinely enjoy the company of others. Making new friends comes naturally to you, and you often find yourself in group settings, whether it’s parties, social clubs, or casual get-togethers. You are likely an excellent communicator and thrive in environments where you can connect with people. For you, the perfect dog would be one that is also friendly and enjoys meeting new people and other animals, a companion that can happily join your social outings.',
    compatibleBreeds: ['Golden Retriever', 'Beagle', 'Basset Hound', 'Pug', 'Schnauzer'],
    imageUrl: 'https://media.istockphoto.com/id/1379585583/photo/group-of-friends-meet-in-the-park-with-their-dogs.jpg?s=612x612&w=0&k=20&c=m1x4WakhiONhqpx2_2fu8Gjgcl95V5QxAXvLSvi8Scw='
  ),
  Personality(
    name: 'Independent',
    description: 'You highly value your personal space and alone time. While you may enjoy socializing, you also need moments of solitude to recharge and pursue your own interests without interruption. You are self-reliant and comfortable making decisions on your own. A suitable dog for you would be one that is also somewhat independent and doesn’t require constant attention or get overly anxious when left alone for reasonable periods. A dog that can entertain itself and respect your need for personal space would be a good fit.',
    compatibleBreeds: ['Chow Chow', 'Shiba Inu', 'Basenji', 'Akita Inu', 'Alaskan Malamute'],
    imageUrl: 'https://www.shutterstock.com/image-photo/portrait-cute-couple-shiba-inu-260nw-2215349043.jpg'
  ),
  Personality(
    name: 'Creative',
    description: 'You have a rich inner world and a strong inclination towards artistic expression. Whether it’s painting, writing, music, or any other form of creative pursuit, you find joy and fulfillment in bringing your ideas to life. You appreciate beauty and originality. A dog that is perhaps intelligent and can be engaged in playful, imaginative activities might resonate with your creative spirit. While not directly artistic, a dog that is observant and enjoys being around you while you work on your projects could be a comforting presence.',
    compatibleBreeds: ['Poodle', 'Afghan Hound', 'Papillon', 'Border Terrier', 'Bedlington Terrier'],
    imageUrl: 'https://www.shutterstock.com/shutterstock/videos/3507066951/thumb/1.jpg?ip=x480'
  ),
  Personality(
    name: 'Introverted',
    description: 'Social interactions can be draining for you, and you primarily recharge your energy by spending time alone. You are often thoughtful and reflective, preferring deeper conversations with a few close friends over superficial interactions in large groups. You appreciate calm and intimate settings. An ideal dog for you might be one that is not overly demanding of attention, enjoys quiet companionship, and can be a comforting presence during your solitary moments. A dog with a calm and gentle temperament would likely suit your needs.',
    compatibleBreeds: ['Greyhound', 'Cavalier King Charles Spaniel', 'Akita Inu', 'Basenji', 'Shiba Inu'],
    imageUrl: 'https://images.pexels.com/photos/20883969/pexels-photo-20883969/free-photo-of-mujer-animal-perro-mascota.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
  ),
  Personality(
    name: 'Protective',
    description: 'You have a natural instinct to care for and defend those you care about. You are loyal, reliable, and often take on the role of a guardian in your relationships. You are likely observant and quick to notice when someone is in need. A dog with similar protective instincts, who is loyal to their family and can offer a sense of security, would align well with your personality. Breeds known for their guarding tendencies, when properly socialized, could be a strong match.',
    compatibleBreeds: ['Rottweiler', 'Doberman', 'Bullmastiff', 'Belgian Malinois', 'German Shepherd'],
    imageUrl: 'https://perroselite.com/wp-content/uploads/Perros-guardianes-para-familias-03.jpg'
  ),
  Personality(
    name: 'Organized',
    description: 'Structure and order are important to you. You appreciate having a system in place and tend to keep your surroundings tidy and well-managed. You likely value punctuality and planning. A dog that is also somewhat predictable in its behavior and can adapt to a consistent routine would likely fit well into your lifestyle. While dogs can be messy, breeds that are intelligent and trainable might be easier to incorporate into an organized household.',
    compatibleBreeds: ['Schnauzer', 'Border Terrier', 'Shetland Sheepdog', 'Pembroke Welsh Corgi', 'Australian Cattle Dog'],
    imageUrl: 'https://media.istockphoto.com/id/1347044263/photo/young-asian-man-stay-at-home-with-his-dog-during-pandemic-isolation.jpg?s=612x612&w=0&k=20&c=iRQaMNPzMER40U6F5V15Mq9q99hX8tjo0Y80rnU8CdU='
  ),
  Personality(
    name: 'Fun-loving',
    description: 'You have a playful and lighthearted approach to life. You enjoy laughter, games, and bringing joy to those around you. You are likely optimistic and don’t take things too seriously. An ideal canine companion for you would be one that shares your enthusiasm for fun and play. A dog that is energetic, enjoys games, and can be a source of amusement would be a perfect partner in your joyful lifestyle.',
    compatibleBreeds: ['Jack Russell Terrier', 'Pug', 'Boston Terrier', 'French Bulldog', 'Cavalier King Charles Spaniel'],
    imageUrl: 'https://emmaobrien.com/wp-content/uploads/2019/04/Maternity-Newborn-Dog-Photographer-008.jpg'
  ),
  Personality(
    name: 'Affectionate',
    description: 'You are warm, loving, and enjoy expressing your feelings openly. Physical touch and displays of affection are important in your relationships. You likely enjoy cuddling and showing care for those you love. For you, the perfect dog would be one that is also affectionate and enjoys physical closeness, a furry friend who will happily snuggle up on the couch and return your loving gestures.',
    compatibleBreeds: ['Labrador Retriever', 'Bichon Frise', 'Samoyed', 'Golden Retriever', 'Pomeranian'],
    imageUrl: 'https://media.istockphoto.com/id/1204163981/photo/guy-and-his-dog-golden-retriever-nature.jpg?s=612x612&w=0&k=20&c=5UvLYuB4PkIWjZQczCzMoIS8evRik8KenhrLhLKGWoU='
  ),
  Personality(
    name: 'Geek/Gamer',
    description: 'You have a strong interest in technology, video games, comic books, science fiction, and other related hobbies. You likely enjoy spending time immersed in these worlds, whether it’s playing the latest games, attending conventions, or engaging in online communities. A dog that is relatively low-maintenance and can be content to sit by your side while you engage in your hobbies would be a good fit. A quiet and adaptable companion would likely thrive in your environment.',
    compatibleBreeds: ['French Bulldog', 'Pug', 'Chihuahua', 'Pomeranian', 'Lhasa Apso'],
    imageUrl: 'https://www.shutterstock.com/shutterstock/videos/3695074183/thumb/1.jpg?ip=x480'
  ),
  Personality(
    name: 'Spiritual',
    description: 'You value inner peace, mindfulness, and a connection to something larger than yourself. You may practice meditation, yoga, or other spiritual activities. You seek meaning and purpose in life. A dog with a calm and gentle presence might complement your spiritual nature, offering a sense of tranquility and companionship without being overly demanding. Breeds known for their calm demeanor could be a good match.',
    compatibleBreeds: ['Saluki', 'Whippet', 'Borzoi', 'Afghan Hound', 'Basenji'],
    imageUrl: 'https://www.dressupyourpup.com/wp-content/uploads/2024/02/borzoi.jpg'
  ),
  Personality(
    name: 'Competitive',
    description: 'You are driven to succeed and enjoy challenges. You likely have a strong desire to win, whether it’s in sports, games, or your career. You are motivated and goal-oriented. An ideal dog for you might be one that is also intelligent and enjoys training and participating in activities where they can excel, such as agility or obedience. A dog with a strong work ethic and a desire to please could be a great partner for your competitive spirit.',
    compatibleBreeds: ['Belgian Malinois', 'Doberman', 'Dalmatian', 'Fox Terrier', 'German Shepherd'],
    imageUrl: 'https://pampermut.com/blog/wp-content/uploads/2020/07/Disen%CC%83o-sin-ti%CC%81tulo-2020-07-03T115219.476.jpg'
  ),
  Personality(
    name: 'Empathetic',
    description: 'You have a deep understanding of and sensitivity to the feelings of others. You are compassionate, caring, and often put the needs of others before your own. You are a good listener and offer strong emotional support. For you, the perfect dog would likely be one that is also known for its empathy and ability to bond deeply with their human companions. Breeds that are known to be good therapy dogs or are particularly attuned to human emotions could be a wonderful match.',
    compatibleBreeds: ['Golden Retriever', 'Labrador', 'Collie', 'Bernese Mountain Dog', 'Labradoodle'],
    imageUrl: 'https://images.ctfassets.net/wcjeikrx8553/1wAqGpWqRCC1qcD3oe0VA4/5a1c40c627c2e03751a1d694b36046f9/Bernese_Mountain_Dog.jpg'
  ),
];