import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieHomeScreen(),
    );
  }
}

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  _MovieHomeScreenState createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  final List<String> categories = [
    "All",
    "Action",
    "Comedy",
    "Romance",
    "Fantasy"
  ];
  String selectedCategory = "All";
  String selectedTab = "Movies";
  String selectedGenre = "All"; // Track the selected genre

  final List<Map<String, String>> trendingMovies = [
    {
      "title": "Olympus Has Fallen",
      "rating": "5.0",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/bf/Olympus_Has_Fallen_poster.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4"
    },
    {
      "title": "Olympus Has Fallen",
      "rating": "5.0",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/bf/Olympus_Has_Fallen_poster.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4"
    },
    {
      "title": "The Matrix",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Inception",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Dark Knight",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Interstellar",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Avengers",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/f/f9/TheAvengers2012Poster.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Titanic",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/19/Titanic_%28Official_Film_Poster%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Forrest Gump",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lion King",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg",
      "category": "Animation",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Jurassic Park",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/e7/Jurassic_Park_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Shawshank Redemption",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Pulp Fiction",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Godfather",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Fight Club",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Fellowship of the Ring",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
      "category": "Fantasy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Harry Potter and the Sorcerer's Stone",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/7/7a/Harry_Potter_and_the_Philosopher%27s_Stone_banner.jpg",
      "category": "Fantasy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hangover",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b9/Hangoverposter09.jpg",
      "category": "Comedy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Toy Story",
      "rating": "4.7",
      "image": "https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg",
      "category": "Animation",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Conjuring",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1f/Conjuring_poster.jpg",
      "category": "Horror",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Silence of the Lambs",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg",
      "category": "Thriller",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Social Network",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/7/7a/Social_network_film_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Revenant",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b6/The_Revenant_2015_film_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Grand Budapest Hotel",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/a6/The_Grand_Budapest_Hotel_Poster.jpg",
      "category": "Comedy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Wolf of Wall Street",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1f/WallStreet2013poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Departed",
      "rating": "4.8",
      "image": "https://upload.wikimedia.org/wikipedia/en/5/50/Departed234.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Big Short",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/e3/The_Big_Short_teaser_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Martian",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/cd/The_Martian_film_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Imitation Game",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5e/The_Imitation_Game_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Theory of Everything",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b8/The_Theory_of_Everything_%282014%29.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Pursuit of Happyness",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/81/Poster-pursuithappyness.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Fault in Our Stars",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/41/The_Fault_in_Our_Stars_%28Official_Film_Poster%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "La La Land",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Notebook",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/86/Posternotebook.jpg",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Great Gatsby",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/2/26/The_Great_Gatsby_2013_Poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Help",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5e/The_Help_Poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The King's Speech",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5b/The_King%27s_Speech_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Blind Side",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/60/Blind_side_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Secret Life of Walter Mitty",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/cd/The_Secret_Life_of_Walter_Mitty_%282013_film%29_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Jungle Book",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/a4/The_Jungle_Book_%282016%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/10/The_Chronicles_of_Narnia_-_The_Lion%2C_the_Witch_and_the_Wardrobe.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: An Unexpected Journey",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b3/The_Hobbit-_An_Unexpected_Journey.jpeg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: The Desolation of Smaug",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/4f/The_Hobbit_-_The_Desolation_of_Smaug_theatrical_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: The Battle of the Five Armies",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/0/0e/The_Hobbit_-_The_Battle_of_the_Five_Armies.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Two Towers",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/ad/The_Lord_of_the_Rings_-_The_Two_Towers_%282002%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Return of the King",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/9/9d/The_Lord_of_the_Rings_-_The_Return_of_the_King_%282003%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Fellowship of the Ring",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/42/HungerGamesPoster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Catching Fire",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/61/The_Hunger_Games_-_Catching_Fire_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Mockingjay - Part 1",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/63/The_Hunger_Games_-_Mockingjay_Part_1_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Mockingjay - Part 2",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/9/9d/MockingjayPart2Poster3.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Maze Runner",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/be/The_Maze_Runner_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },

    // Add more movies here...
  ];

  final List<Map<String, String>> newReleases = [
    {
      "title": "The Matrix",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Olympus Has Fallen",
      "rating": "5.0",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/bf/Olympus_Has_Fallen_poster.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4"
    },
    {
      "title": "The Matrix",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/c1/The_Matrix_Poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Inception",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/2/2e/Inception_%282010%29_theatrical_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Dark Knight",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1c/The_Dark_Knight_%282008_film%29.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Interstellar",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Avengers",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/f/f9/TheAvengers2012Poster.jpg",
      "category": "Action",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Titanic",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/19/Titanic_%28Official_Film_Poster%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Forrest Gump",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/67/Forrest_Gump_poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lion King",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/3/3d/The_Lion_King_poster.jpg",
      "category": "Animation",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Jurassic Park",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/e7/Jurassic_Park_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Shawshank Redemption",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/81/ShawshankRedemptionMoviePoster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Pulp Fiction",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/3/3b/Pulp_Fiction_%281994%29_poster.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Godfather",
      "rating": "4.9",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1c/Godfather_ver1.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Fight Club",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/f/fc/Fight_Club_poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Fellowship of the Ring",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
      "category": "Fantasy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Harry Potter and the Sorcerer's Stone",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/7/7a/Harry_Potter_and_the_Philosopher%27s_Stone_banner.jpg",
      "category": "Fantasy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hangover",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b9/Hangoverposter09.jpg",
      "category": "Comedy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "Toy Story",
      "rating": "4.7",
      "image": "https://upload.wikimedia.org/wikipedia/en/1/13/Toy_Story.jpg",
      "category": "Animation",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Conjuring",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1f/Conjuring_poster.jpg",
      "category": "Horror",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Silence of the Lambs",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/86/The_Silence_of_the_Lambs_poster.jpg",
      "category": "Thriller",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Social Network",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/7/7a/Social_network_film_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Revenant",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b6/The_Revenant_2015_film_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Grand Budapest Hotel",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/a6/The_Grand_Budapest_Hotel_Poster.jpg",
      "category": "Comedy",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Wolf of Wall Street",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/1f/WallStreet2013poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Departed",
      "rating": "4.8",
      "image": "https://upload.wikimedia.org/wikipedia/en/5/50/Departed234.jpg",
      "category": "Crime",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Big Short",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/e/e3/The_Big_Short_teaser_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Martian",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/cd/The_Martian_film_poster.jpg",
      "category": "Sci-Fi",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Imitation Game",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5e/The_Imitation_Game_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Theory of Everything",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b8/The_Theory_of_Everything_%282014%29.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Pursuit of Happyness",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/81/Poster-pursuithappyness.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Fault in Our Stars",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/41/The_Fault_in_Our_Stars_%28Official_Film_Poster%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "La La Land",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/ab/La_La_Land_%28film%29.png",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Notebook",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/86/Posternotebook.jpg",
      "category": "Romance",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Great Gatsby",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/2/26/The_Great_Gatsby_2013_Poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Help",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5e/The_Help_Poster.jpg",
      "category": "Drama",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The King's Speech",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/5/5b/The_King%27s_Speech_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Blind Side",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/60/Blind_side_poster.jpg",
      "category": "Biography",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Secret Life of Walter Mitty",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/c/cd/The_Secret_Life_of_Walter_Mitty_%282013_film%29_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Jungle Book",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/a4/The_Jungle_Book_%282016%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Chronicles of Narnia: The Lion, the Witch and the Wardrobe",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/1/10/The_Chronicles_of_Narnia_-_The_Lion%2C_the_Witch_and_the_Wardrobe.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: An Unexpected Journey",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/b3/The_Hobbit-_An_Unexpected_Journey.jpeg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: The Desolation of Smaug",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/4f/The_Hobbit_-_The_Desolation_of_Smaug_theatrical_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hobbit: The Battle of the Five Armies",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/0/0e/The_Hobbit_-_The_Battle_of_the_Five_Armies.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Two Towers",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/a/ad/The_Lord_of_the_Rings_-_The_Two_Towers_%282002%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Return of the King",
      "rating": "4.8",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/9/9d/The_Lord_of_the_Rings_-_The_Return_of_the_King_%282003%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Lord of the Rings: The Fellowship of the Ring",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/8/8a/The_Lord_of_the_Rings_The_Fellowship_of_the_Ring_%282001%29.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/4/42/HungerGamesPoster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Catching Fire",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/61/The_Hunger_Games_-_Catching_Fire_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Mockingjay - Part 1",
      "rating": "4.6",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/6/63/The_Hunger_Games_-_Mockingjay_Part_1_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Hunger Games: Mockingjay - Part 2",
      "rating": "4.7",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/9/9d/MockingjayPart2Poster3.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
    {
      "title": "The Maze Runner",
      "rating": "4.5",
      "image":
          "https://upload.wikimedia.org/wikipedia/en/b/be/The_Maze_Runner_poster.jpg",
      "category": "Adventure",
      "video":
          "https://www.sample-videos.com/video123/mp4/480/big_buck_bunny_480p_1mb.mp4",
    },
  ];

  final List<String> genres = [
    "All",
    "Action",
    "Comedy",
    "Drama",
    "Romance",
    "Fantasy",
    "Sci-Fi",
    "Animation",
    "Horror",
    "Thriller",
    "Mystery",
    "Documentary",
    "Crime",
    "Adventure",
    "Family",
    "Biography",
    "History",
  ];

  // Function to filter movies by genre
  List<Map<String, String>> _filterMoviesByGenre(
      List<Map<String, String>> movies, String genre) {
    if (genre == "All") {
      return movies;
    }
    return movies.where((movie) => movie["category"] == genre).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Filter movies based on the selected genre
    final filteredTrendingMovies =
        _filterMoviesByGenre(trendingMovies, selectedGenre);
    final filteredNewReleases =
        _filterMoviesByGenre(newReleases, selectedGenre);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rotting Potato",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Row(
              children: [
                TextButton(
                  onPressed: () => setState(() => selectedTab = "Movies"),
                  child: Text("Movies",
                      style: GoogleFonts.poppins(
                          color: selectedTab == "Movies"
                              ? Colors.red
                              : Colors.black)),
                ),
                TextButton(
                  onPressed: () => setState(() => selectedTab = "sign in"),
                  child: Text("sign in",
                      style: GoogleFonts.poppins(
                          color: selectedTab == "sign in"
                              ? Colors.red
                              : Colors.black)),
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    final savedEmail = prefs.getString('email');
                    final savedPassword = prefs.getString('password');

                    if (savedEmail != null && savedPassword != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(
                            email: savedEmail,
                            password: savedPassword,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text("No user data found. Please sign up.")),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text("Rotting Potato",
                  style:
                      GoogleFonts.poppins(color: Colors.black, fontSize: 24)),
            ),
            ...genres.map((genre) => ListTile(
                  title: Text(genre),
                  onTap: () {
                    setState(() {
                      selectedGenre = genre; // Update the selected genre
                    });
                    Navigator.pop(context); // Close drawer
                  },
                )),
            ListTile(
              title: Text("Subscription",
                  style: GoogleFonts.poppins(color: Colors.black)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubscriptionScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Popular",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredTrendingMovies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (filteredTrendingMovies[index]['video'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoUrl: filteredTrendingMovies[index]['video']!,
                            title: filteredTrendingMovies[index]['title']!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No video available for this movie."),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(filteredTrendingMovies[index]['image']!,
                            height: 150),
                        Text(filteredTrendingMovies[index]['title']!,
                            style: GoogleFonts.poppins(color: Colors.white)),
                        Text(filteredTrendingMovies[index]['rating']!,
                            style: GoogleFonts.poppins(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("New Releases",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredNewReleases.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (filteredNewReleases[index]['video'] != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                            videoUrl: filteredNewReleases[index]['video']!,
                            title: filteredNewReleases[index]['title']!,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("No video available for this movie."),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.network(filteredNewReleases[index]['image']!,
                            height: 150),
                        Text(filteredNewReleases[index]['title']!,
                            style: GoogleFonts.poppins(color: Colors.white)),
                        Text(filteredNewReleases[index]['rating']!,
                            style: GoogleFonts.poppins(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// UserProfileScreen to display user details
class UserProfileScreen extends StatelessWidget {
  final String email;
  final String password;

  const UserProfileScreen({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Favorites"),
              onTap: () {
                // Navigate to favorites screen
              },
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text("Downloads"),
              onTap: () {
                // Navigate to downloads screen
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              onTap: () {
                // Navigate to language settings
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Location"),
              onTap: () {
                // Navigate to location settings
              },
            ),
            ListTile(
              leading: Icon(Icons.subscriptions),
              title: Text("Subscription"),
              onTap: () {
                // Navigate to subscription settings
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.clear),
              title: Text("Clear Cache"),
              onTap: () {
                // Clear cache logic
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Clear History"),
              onTap: () {
                // Clear history logic
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                // Logout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

// SignInScreen widget with authentication
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void toggleForm() {
    setState(() {
      isLogin = !isLogin;
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
    });
  }

  Future<void> _signIn() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('email');
    final savedPassword = prefs.getString('password');

    if (_emailController.text == savedEmail &&
        _passwordController.text == savedPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful!")),
      );
      Navigator.pop(context); // Return to the home screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email or password.")),
      );
    }
  }

  Future<void> _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match.")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', _emailController.text);
    prefs.setString('password', _passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Registration successful!")),
    );
    toggleForm(); // Switch to login form
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isLogin ? "Login Form" : "Signup Form",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Colors.blue,
                  color: Colors.black,
                  isSelected: [isLogin, !isLogin],
                  onPressed: (index) {
                    setState(() {
                      isLogin = index == 0;
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Text("Login"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                      child: Text("Signup"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              if (!isLogin) ...[
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              SizedBox(height: 10),
              if (isLogin)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: isLogin ? _signIn : _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(isLogin ? "Login" : "Signup",
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: toggleForm,
                child: Text(
                  isLogin
                      ? "Not a member? Signup now"
                      : "Already have an account? Login now",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SubscriptionScreen widget with box shadows
class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subscription Plans"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubscriptionCard(
                title: "Basic",
                price: "\$8.99",
                features: ["Feature 1", "Feature 2", "Feature 3"],
                color: Colors.teal,
                icon: Icons.article,
              ),
              const SizedBox(width: 20),
              SubscriptionCard(
                title: "Standard",
                price: "\$13.99",
                features: ["Feature 1", "Feature 2", "Feature 3"],
                color: Colors.blue,
                icon: Icons.handshake,
              ),
              const SizedBox(width: 20),
              SubscriptionCard(
                title: "Premium",
                price: "\$23.99",
                features: ["Feature 1", "Feature 2", "Feature 3"],
                color: Colors.black87,
                icon: Icons.money,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final Color color;
  final IconData icon;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(3, 6),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            price,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          ...features
              .map((feature) => Text(feature, textAlign: TextAlign.center)),
          const SizedBox(height: 20),
          CircleAvatar(
            backgroundColor: color,
            radius: 20,
            child: Icon(icon, color: const Color.fromARGB(255, 247, 242, 242)),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              title,
              style: const TextStyle(
                  color: Color.fromARGB(255, 248, 246, 246),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerScreen(
      {super.key, required this.videoUrl, required this.title});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
