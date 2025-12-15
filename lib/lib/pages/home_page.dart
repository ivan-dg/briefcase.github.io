import 'package:briefcase/constants/constants.dart';
import 'package:briefcase/lib/pages/detail_info_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/name_widget.dart';
import '../widgets/text_option_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Función para abrir el enlace
  Future<void> _launchURL(String url) async {
    final Uri toLaunch = Uri.parse(url);
    if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: ColorTween(
          begin: Colors.grey,
          end: Theme.of(context).scaffoldBackgroundColor,
        ),
        builder: (BuildContext context, dynamic value, Widget? child) {
          return Container(
            color: value,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  // navegador o tablet en horizontal
                  return _buildWideLayout(context);
                } else {
                  // tablet en vertical o celular
                  return _buildNarrowLayout(context);
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingH, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const NameWidget(),
              const Gap(30),
              FadeTransition(
                opacity: _animation,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Portfolio of Ivan Gustin',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Text(
                          'Software Engineer',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pasto, Colombia',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SelectableText(
                          'ivandgustin@gmail.com',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const Gap(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _launchURL(
                              'https://www.linkedin.com/in/ivandgu/'),
                          child: Row(
                            children: [
                              Text(
                                '01',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 10,
                                    ),
                              ),
                              const Gap(15),
                              Text(
                                'Linkedin',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Gap(50),
                  TextOptionWidget(
                    title: 'sqwabl',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0xff60308f),
                            colorBackground: Colors.white,
                            textColorCover: Colors.white,
                            title: 'sqwabl',
                            description:
                                '¡Bienvenido a Athlete Arcade! El punto de encuentro donde cada jugador de pickleball se convierte en leyenda. Aquí no solo juegas: compites, mejoras y descubres hasta dónde puedes llegar. Con Athlete Arcade podrás: Crear y liderar torneos que pondrán a prueba tus habilidades, armar o unirte a partidas con jugadores de todos los niveles, ver tus estadísticas y evolución, para que cada punto cuente. Aqui podras revisar tus puntajes y partidos en un solo lugar, explorar perfiles de otros jugadores y conectar con la comunidad, coleccionar medallas y logros cada vez que conquistas la cancha. Prepárate para vivir el pickleball como nunca antes, tu aventura comienza aquí.',
                            coverImage: 'assets/sqwabl_1.png',
                            images: [
                              'assets/sqwabl_2.png',
                              'assets/sqwabl_5.png',
                              'assets/sqwabl_3.png',
                              'assets/sqwabl_4.png',
                              'assets/sqwabl_6.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'athlete',
                    subtitle: 'arcade',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0xff00aa57),
                            colorBackground: Colors.white,
                            textColorCover: Colors.white,
                            title: 'athlete arcade',
                            description:
                                '¡Bienvenido a Athlete Arcade! El punto de encuentro donde cada jugador de pickleball se convierte en leyenda. Aquí no solo juegas: compites, mejoras y descubres hasta dónde puedes llegar. Con Athlete Arcade podrás: Crear y liderar torneos que pondrán a prueba tus habilidades, armar o unirte a partidas con jugadores de todos los niveles, ver tus estadísticas y evolución, para que cada punto cuente. Aqui podras revisar tus puntajes y partidos en un solo lugar, explorar perfiles de otros jugadores y conectar con la comunidad, coleccionar medallas y logros cada vez que conquistas la cancha. Prepárate para vivir el pickleball como nunca antes, tu aventura comienza aquí.',
                            coverImage: 'assets/athl_ar_1.jpg',
                            images: [
                              'assets/athl_ar_5.png',
                              'assets/athl_ar_2.png',
                              'assets/athl_ar_3.png',
                              'assets/athl_ar_4.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'DOC IA',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: const Color(0xFF00CCFF),
                            colorBackground: Colors.white,
                            textColorCover: Colors.black,
                            title: 'DOC IA',
                            description:
                                'Bienvenido a Doctor Virtual, tu asistente de salud impulsado por inteligencia artificial. Este chat ha sido diseñado para responder tus preguntas sobre salud, brindarte información confiable y orientarte en temas médicos de manera rápida y accesible. Nuestro objetivo es proporcionarte asesoramiento basado en conocimientos médicos actualizados, ayudándote a comprender síntomas, condiciones y posibles cuidados. Sin embargo, recuerda que Doctor Virtual no sustituye la opinión de un médico profesional,i presentas una emergencia o necesitas un diagnóstico preciso, es fundamental acudir a un especialista. Escríbenos tu consulta y recibe respuestas inmediatas para aclarar dudas sobre bienestar, prevención de enfermedades y hábitos saludables. ¡Tu salud es nuestra prioridad!',
                            coverImage: 'assets/doctor_ia_1.jpg',
                            images: const [
                              'assets/doctor_ia_2.png',
                              'assets/doctor_ia_3.png',
                              'assets/doctor_ia_4.png',
                            ],
                            openWebpage: () {
                              _launchURL(Constants.webpageDocIA);
                            },
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'PUBS',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.white,
                            colorImagesBack: const Color(0XFFE9FB00),
                            colorBackground: Colors.black,
                            title: 'PUBS',
                            description:
                                '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
                            coverImage: 'assets/bar.webp',
                            images: const [
                              'assets/pubs_1.png',
                              'assets/pubs_2.png',
                              'assets/pubs_3.png',
                              'assets/pubs_4.png',
                            ],
                            openWebpage: () {
                              _launchURL(Constants.webpagePubs);
                            },
                            openAndroid: () {
                              _launchURL(Constants.urlAndroidPubs);
                            },
                            openApple: () {
                              _launchURL(Constants.urlIosPubs);
                            },
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'TRIPPSTER',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF00C535),
                            colorBackground: Colors.white,
                            title: 'TRIPPSTER',
                            description:
                                'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
                            coverImage: 'assets/trippster_6.png',
                            images: [
                              'assets/trippster_1.png',
                              'assets/trippster_3.png',
                              'assets/trippster_5.png',
                              'assets/trippster_4.png',
                              'assets/trippster_2.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'MEPET',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0xFFB9C4FF),
                            colorBackground: Colors.white,
                            title: 'MEPET',
                            description:
                                'Descarga MePet y encuentra todo lo que tu mascota necesita en un solo lugar. Con MePet, podrás: Comprar alimentos, juguetes, medicinas y más. Explorar nuestra sección de adopción para encontrar a tu nuevo mejor amigo podras con MePet poner en adopción a mascotas que necesitan un hogar. MePet facilita el proceso de adopción y ayuda a muchos animalitos a encontrar un hogar amoroso. ¡Descarga nuestra app y compártela con tus amigos para hacer la diferencia! Ayuda a más animales a encontrar un hogar ¡Con MePet, todos ganan! 🐾💖',
                            coverImage: 'assets/mepet_1.png',
                            images: [
                              'assets/mepet_2.png',
                              'assets/mepet_3.png',
                              'assets/mepet_4.png',
                              'assets/mepet_5.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  TextOptionWidget(
                    title: 'CONSULTORIO',
                    subtitle: 'VIRTUAL',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF2A52A3),
                            colorBackground: Color(0XFFF2F2F2),
                            title: 'CONSULTORIO VIRUTAL',
                            description:
                                '¡Bienvenido a Consultorio Virtual, tu asistente personal para gestionar y mejorar tu salud!. Con Consultorio Virtual podrás: Monitorear indicadores clave de salud como peso, presión arterial, ritmo cardíaco y más. Recibir recordatorios y alertas para tomar medicación o realizar chequeos importantes. Visualizar tu evolución con gráficos y estadísticas detalladas. Acceder a consejos personalizados y recomendaciones basadas en tus datos de salud. Compartir tu información con médicos y profesionales de la salud de forma segura. Empieza a tomar el control de tu bienestar hoy mismo. ¡Descarga Consultorio Virtual y lleva un registro completo de tu salud en la palma de tu mano!',
                            coverImage: 'assets/cons_virt_1.jpg',
                            images: [
                              'assets/cons_virt_2.png',
                              'assets/cons_virt_3.png',
                              'assets/cons_virt_5.png',
                              'assets/cons_virt_4.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.075,
                  ),
                  const Gap(50),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(20),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'athlete',
                    subtitle: '     arcade',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0xff00aa57),
                            colorBackground: Colors.white,
                            textColorCover: Colors.white,
                            title: 'athlete arcade',
                            description:
                                '¡Bienvenido a Athlete Arcade! El punto de encuentro donde cada jugador de pickleball se convierte en leyenda. Aquí no solo juegas: compites, mejoras y descubres hasta dónde puedes llegar. Con Athlete Arcade podrás: Crear y liderar torneos que pondrán a prueba tus habilidades, armar o unirte a partidas con jugadores de todos los niveles, ver tus estadísticas y evolución, para que cada punto cuente. Aqui podras revisar tus puntajes y partidos en un solo lugar, explorar perfiles de otros jugadores y conectar con la comunidad, coleccionar medallas y logros cada vez que conquistas la cancha. Prepárate para vivir el pickleball como nunca antes, tu aventura comienza aquí.',
                            coverImage: 'assets/athl_ar_1.jpg',
                            images: [
                              'assets/athl_ar_5.png',
                              'assets/athl_ar_2.png',
                              'assets/athl_ar_3.png',
                              'assets/athl_ar_4.png',
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'DOC IA',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: const Color(0xFF00CCFF),
                            colorBackground: Colors.white,
                            textColorCover: Colors.black,
                            title: 'DOC IA',
                            description:
                                'Bienvenido a Doctor Virtual, tu asistente de salud impulsado por inteligencia artificial. Este chat ha sido diseñado para responder tus preguntas sobre salud, brindarte información confiable y orientarte en temas médicos de manera rápida y accesible. Nuestro objetivo es proporcionarte asesoramiento basado en conocimientos médicos actualizados, ayudándote a comprender síntomas, condiciones y posibles cuidados. Sin embargo, recuerda que Doctor Virtual no sustituye la opinión de un médico profesional,i presentas una emergencia o necesitas un diagnóstico preciso, es fundamental acudir a un especialista. Escríbenos tu consulta y recibe respuestas inmediatas para aclarar dudas sobre bienestar, prevención de enfermedades y hábitos saludables. ¡Tu salud es nuestra prioridad!',
                            coverImage: 'assets/doctor_ia_1.jpg',
                            images: const [
                              'assets/doctor_ia_2.png',
                              'assets/doctor_ia_3.png',
                              'assets/doctor_ia_4.png',
                            ],
                            openWebpage: () {
                              _launchURL(Constants.webpageDocIA);
                            },
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'PUBS',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => DetailInfoPage(
                            textColor: Colors.white,
                            colorImagesBack:
                                Theme.of(context).scaffoldBackgroundColor,
                            colorBackground: Colors.black,
                            title: 'PUBS',
                            description:
                                '¡Descarga Pubs y descubre los mejores lugares de tu ciudad! Con Pubs podrás. Explorar los mejores bares y pubs, ver menús detallados, encontrar eventos y promociones exclusivas, pedir tus canciones favoritas, votar por las canciones que más te gustan (¡las más votadas sonarán en el pub!). Conocer nuevas personas en el lugar donde estés.',
                            coverImage: 'assets/bar.webp',
                            images: const [
                              'assets/pubs_1.png',
                              'assets/pubs_2.png',
                              'assets/pubs_3.png',
                              'assets/pubs_4.png',
                            ],
                            openWebpage: () {
                              _launchURL(Constants.webpagePubs);
                            },
                            openAndroid: () {
                              _launchURL(Constants.urlAndroidPubs);
                            },
                            openApple: () {
                              _launchURL(Constants.urlIosPubs);
                            },
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'TRIPPSTER',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF00C535),
                            colorBackground: Colors.white,
                            title: 'TRIPPSTER',
                            description:
                                'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
                            coverImage: 'assets/trippster_6.png',
                            images: [
                              'assets/trippster_1.png',
                              'assets/trippster_3.png',
                              'assets/trippster_5.png',
                              'assets/trippster_4.png',
                              'assets/trippster_2.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'MEPET',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0xFFB9C4FF),
                            colorBackground: Colors.white,
                            title: 'MEPET',
                            description:
                                'Descarga MePet y encuentra todo lo que tu mascota necesita en un solo lugar. Con MePet, podrás: Comprar alimentos, juguetes, medicinas y más. Explorar nuestra sección de adopción para encontrar a tu nuevo mejor amigo podras con MePet poner en adopción a mascotas que necesitan un hogar. MePet facilita el proceso de adopción y ayuda a muchos animalitos a encontrar un hogar amoroso. ¡Descarga nuestra app y compártela con tus amigos para hacer la diferencia! Ayuda a más animales a encontrar un hogar ¡Con MePet, todos ganan! 🐾💖',
                            coverImage: 'assets/mepet_1.png',
                            images: [
                              'assets/mepet_2.png',
                              'assets/mepet_3.png',
                              'assets/mepet_4.png',
                              'assets/mepet_5.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  TextOptionWidget(
                    alignment: Alignment.topLeft,
                    title: 'CONSULTORIO',
                    subtitle: '     VIRTUAL',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DetailInfoPage(
                            textColor: Colors.black,
                            colorImagesBack: Color(0XFF2A52A3),
                            colorBackground: Color(0XFFF2F2F2),
                            title: 'CONSULTORIO VIRUTAL',
                            description:
                                '¡Bienvenido a Consultorio Virtual, tu asistente personal para gestionar y mejorar tu salud!. Con Consultorio Virtual podrás: Monitorear indicadores clave de salud como peso, presión arterial, ritmo cardíaco y más. Recibir recordatorios y alertas para tomar medicación o realizar chequeos importantes. Visualizar tu evolución con gráficos y estadísticas detalladas. Acceder a consejos personalizados y recomendaciones basadas en tus datos de salud. Compartir tu información con médicos y profesionales de la salud de forma segura. Empieza a tomar el control de tu bienestar hoy mismo. ¡Descarga Consultorio Virtual y lleva un registro completo de tu salud en la palma de tu mano!',
                            coverImage: 'assets/cons_virt_1.jpg',
                            images: [
                              'assets/cons_virt_2.png',
                              'assets/cons_virt_3.png',
                              'assets/cons_virt_5.png',
                              'assets/cons_virt_4.png'
                            ],
                          ),
                        ),
                      );
                    },
                    hFactor: 0.1,
                  ),
                  const Gap(20),
                ],
              ),
            ),
            const Gap(90),
            const NameWidget(),
            const Gap(20),
            FadeTransition(
              opacity: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio of Ivan Gustin',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Software Engineer',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap(20),
                  Text(
                    'Pasto, Colombia',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SelectableText(
                    'ivandgustin@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () =>
                        _launchURL('https://www.linkedin.com/in/ivandgu/'),
                    child: Row(
                      children: [
                        Text(
                          '01',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w100,
                                    fontSize: 10,
                                  ),
                        ),
                        const Gap(10),
                        Text(
                          'Linkedin',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
