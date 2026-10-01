import 'package:flutter/material.dart';

/// Idioma manual de la app. `null` significa auto-detección por navegador.
final ValueNotifier<Locale?> appLocale = ValueNotifier<Locale?>(null);

class L10n {
  static const Map<String, Map<String, String>> _s = {
    'portfolioTitle': {
      'es': 'Portafolio de Ivan Gustin',
      'en': 'Portfolio of Ivan Gustin',
    },
    'role': {
      'es': 'Ingeniero de Software',
      'en': 'Software Engineer',
    },
    'location': {
      'es': 'Pasto, Colombia',
      'en': 'Pasto, Colombia',
    },
    'linkedinLabel': {
      'es': 'LinkedIn ↗',
      'en': 'LinkedIn ↗',
    },
    'whatsappLabel': {
      'es': 'WhatsApp ↗',
      'en': 'WhatsApp ↗',
    },
    'appStoreTop': {
      'es': 'Descargar en el',
      'en': 'Download on the',
    },
    'appStoreBottom': {
      'es': 'App Store',
      'en': 'App Store',
    },
    'googlePlayTop': {
      'es': 'Consíguelo en',
      'en': 'Get it on',
    },
    'googlePlayBottom': {
      'es': 'Google Play',
      'en': 'Google Play',
    },
    'webTop': {
      'es': 'Abrir',
      'en': 'Open',
    },
    'webBottom': {
      'es': 'Página web',
      'en': 'Webpage',
    },
    'sqwablDescription': {
      'es':
          'Sqwabl: El fin del caos en tus planes grupales ¿Cansado de cientos de mensajes para no llegar a nada? Sqwabl es la solución definitiva para transformar la indecisión en acción. Olvídate de los chats infinitos y las conversaciones circulares; nuestra app simplifica la toma de decisiones grupales mediante encuestas visuales y rápidas que te permiten concretar planes en segundos. Desde elegir el próximo destino de vacaciones hasta decidir qué cenar hoy, Sqwabl centraliza las opciones y los votos en un solo lugar. Además, con nuestras listas compartidas, puedes organizar ideas futuras y gestionar eventos sin estrés. Es la herramienta de productividad social diseñada para que pases menos tiempo debatiendo y más tiempo disfrutando. ¡Descarga Sqwabl y haz que ponerse de acuerdo sea la parte más fácil de tu día!',
      'en':
          'Sqwabl: the end of chaos in group plans. Tired of hundreds of messages that lead nowhere? Sqwabl is the definitive solution that turns indecision into action. Forget endless chats and circular conversations; our app simplifies group decision making with quick visual polls that let you lock in plans in seconds. From choosing your next vacation destination to deciding what is for dinner, Sqwabl keeps options and votes in one place. And with shared lists, you can organize future ideas and manage events stress free. It is the social productivity tool designed so you spend less time debating and more time enjoying. Download Sqwabl and make agreeing the easiest part of your day!',
    },
    'athleteArcadeDescription': {
      'es':
          '¡Bienvenido a Athlete Arcade! El punto de encuentro donde cada jugador de pickleball se convierte en leyenda. Aquí no solo juegas: compites, mejoras y descubres hasta dónde puedes llegar. Con Athlete Arcade podrás: Crear y liderar torneos que pondrán a prueba tus habilidades, armar o unirte a partidas con jugadores de todos los niveles, ver tus estadísticas y evolución, para que cada punto cuente. Aqui podras revisar tus puntajes y partidos en un solo lugar, explorar perfiles de otros jugadores y conectar con la comunidad, coleccionar medallas y logros cada vez que conquistas la cancha. Prepárate para vivir el pickleball como nunca antes, tu aventura comienza aquí.',
      'en':
          'Welcome to Athlete Arcade! The meeting point where every pickleball player becomes a legend. Here you do not just play: you compete, improve and discover how far you can go. With Athlete Arcade you can: create and lead tournaments that test your skills, start or join matches with players of all levels, and track your stats and progress so every point counts. Here you can review your scores and matches in one place, explore other player profiles and connect with the community, and collect medals and achievements every time you conquer the court. Get ready to live pickleball like never before, your adventure starts here.',
    },
    'docIaDescription': {
      'es':
          'Bienvenido a Doctor Virtual, tu asistente de salud impulsado por inteligencia artificial. Este chat ha sido diseñado para responder tus preguntas sobre salud, brindarte información confiable y orientarte en temas médicos de manera rápida y accesible. Nuestro objetivo es proporcionarte asesoramiento basado en conocimientos médicos actualizados, ayudándote a comprender síntomas, condiciones y posibles cuidados. Sin embargo, recuerda que Doctor Virtual no sustituye la opinión de un médico profesional,i presentas una emergencia o necesitas un diagnóstico preciso, es fundamental acudir a un especialista. Escríbenos tu consulta y recibe respuestas inmediatas para aclarar dudas sobre bienestar, prevención de enfermedades y hábitos saludables. ¡Tu salud es nuestra prioridad!',
      'en':
          'Welcome to Doctor Virtual, your AI powered health assistant. This chat is designed to answer your health questions, give you reliable information and guide you through medical topics quickly and easily. Our goal is to give you advice based on current medical knowledge, helping you understand symptoms, conditions and possible care. Keep in mind, however, that Doctor Virtual does not replace the opinion of a professional doctor; if you have an emergency or need an accurate diagnosis, seeing a specialist is essential. Send us your question and get immediate answers to clear up doubts about wellness, disease prevention and healthy habits. Your health is our priority!',
    },
    'pubsDescription': {
      'es':
          '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
      'en':
          'Download Pubs and discover the best places in your city! With Pubs you can: explore the best bars and pubs, see detailed menus, find exclusive events and promotions, request your favorite songs, vote for the songs you like the most (the most voted ones play in the pub!). And meet new people wherever you are.',
    },
    'trippsterDescription': {
      'es':
          'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
      'en':
          'Welcome to TRIPPSTER, where you connect with travelers from all over the world and share authentic experiences with them. Discover the Traveling Soul: Who We Are at Trippster. At Trippster, we are passionate explorers and experts at making your travel dreams come true. With years of experience in the industry, we are proud to offer unique personalized experiences that go beyond the conventional. Our commitment is to turn every trip into an unforgettable adventure, delivering exceptional service and discovering extraordinary destinations. Welcome to Trippster, where every trip is a story waiting to be told!',
    },
    'mepetDescription': {
      'es':
          'Descarga MePet y encuentra todo lo que tu mascota necesita en un solo lugar. Con MePet, podrás: Comprar alimentos, juguetes, medicinas y más. Explorar nuestra sección de adopción para encontrar a tu nuevo mejor amigo podras con MePet poner en adopción a mascotas que necesitan un hogar. MePet facilita el proceso de adopción y ayuda a muchos animalitos a encontrar un hogar amoroso. ¡Descarga nuestra app y compártela con tus amigos para hacer la diferencia! Ayuda a más animales a encontrar un hogar ¡Con MePet, todos ganan! 🐾💖',
      'en':
          'Download MePet and find everything your pet needs in one place. With MePet, you can buy food, toys, medicines and more. Explore our adoption section to find your new best friend; you can also put pets that need a home up for adoption. MePet makes the adoption process easier and helps many little animals find a loving home. Download our app and share it with your friends to make a difference! Help more animals find a home. With MePet, everyone wins! 🐾💖',
    },
    'consultorioDescription': {
      'es':
          '¡Bienvenido a Consultorio Virtual, tu asistente personal para gestionar y mejorar tu salud!. Con Consultorio Virtual podrás: Monitorear indicadores clave de salud como peso, presión arterial, ritmo cardíaco y más. Recibir recordatorios y alertas para tomar medicación o realizar chequeos importantes. Visualizar tu evolución con gráficos y estadísticas detalladas. Acceder a consejos personalizados y recomendaciones basadas en tus datos de salud. Compartir tu información con médicos y profesionales de la salud de forma segura. Empieza a tomar el control de tu bienestar hoy mismo. ¡Descarga Consultorio Virtual y lleva un registro completo de tu salud en la palma de tu mano!',
      'en':
          'Welcome to Consultorio Virtual, your personal assistant to manage and improve your health! With Consultorio Virtual you can: monitor key health indicators like weight, blood pressure, heart rate and more. Receive reminders and alerts to take medication or get important checkups. Track your progress with detailed charts and statistics. Access personalized tips and recommendations based on your health data. Share your information with doctors and health professionals securely. Start taking control of your wellbeing today. Download Consultorio Virtual and keep a complete health record in the palm of your hand!',
    },
  };

  static String of(BuildContext context, String key) {
    final String? code = Localizations.maybeLocaleOf(context)?.languageCode;
    final Map<String, String>? entry = _s[key];
    if (entry == null) {
      return key;
    }
    return entry[code] ?? entry['es']!;
  }
}
