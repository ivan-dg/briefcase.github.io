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
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri toLaunch = Uri.parse(url);
    if (!await launchUrl(toLaunch, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  void _openDetail(DetailInfoPage page) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  List<Widget> _projectRows() {
    return [
      TextOptionWidget(
        index: 1,
        title: 'sqwabl',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'sqwabl',
            description:
                'Sqwabl: El fin del caos en tus planes grupales ¿Cansado de cientos de mensajes para no llegar a nada? Sqwabl es la solución definitiva para transformar la indecisión en acción. Olvídate de los chats infinitos y las conversaciones circulares; nuestra app simplifica la toma de decisiones grupales mediante encuestas visuales y rápidas que te permiten concretar planes en segundos. Desde elegir el próximo destino de vacaciones hasta decidir qué cenar hoy, Sqwabl centraliza las opciones y los votos en un solo lugar. Además, con nuestras listas compartidas, puedes organizar ideas futuras y gestionar eventos sin estrés. Es la herramienta de productividad social diseñada para que pases menos tiempo debatiendo y más tiempo disfrutando. ¡Descarga Sqwabl y haz que ponerse de acuerdo sea la parte más fácil de tu día!',
            coverImage: 'assets/sqwabl_1.png',
            images: const [
              'assets/sqwabl_2.png',
              'assets/sqwabl_5.png',
              'assets/sqwabl_3.png',
              'assets/sqwabl_4.png',
              'assets/sqwabl_6.png',
            ],
            openWebpage: () => _launchURL(Constants.urlSqwablWeb),
          ),
        ),
      ),
      TextOptionWidget(
        index: 2,
        title: 'athlete arcade',
        onTap: () => _openDetail(
          const DetailInfoPage(
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
      ),
      TextOptionWidget(
        index: 3,
        title: 'DOC IA',
        onTap: () => _openDetail(
          DetailInfoPage(
            title: 'DOC IA',
            description:
                'Bienvenido a Doctor Virtual, tu asistente de salud impulsado por inteligencia artificial. Este chat ha sido diseñado para responder tus preguntas sobre salud, brindarte información confiable y orientarte en temas médicos de manera rápida y accesible. Nuestro objetivo es proporcionarte asesoramiento basado en conocimientos médicos actualizados, ayudándote a comprender síntomas, condiciones y posibles cuidados. Sin embargo, recuerda que Doctor Virtual no sustituye la opinión de un médico profesional,i presentas una emergencia o necesitas un diagnóstico preciso, es fundamental acudir a un especialista. Escríbenos tu consulta y recibe respuestas inmediatas para aclarar dudas sobre bienestar, prevención de enfermedades y hábitos saludables. ¡Tu salud es nuestra prioridad!',
            coverImage: 'assets/doctor_ia_1.jpg',
            images: const [
              'assets/doctor_ia_2.png',
              'assets/doctor_ia_3.png',
              'assets/doctor_ia_4.png',
            ],
            openWebpage: () => _launchURL(Constants.webpageDocIA),
          ),
        ),
      ),
      TextOptionWidget(
        index: 4,
        title: 'PUBS',
        onTap: () => _openDetail(
          DetailInfoPage(
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
            openWebpage: () => _launchURL(Constants.webpagePubs),
            openAndroid: () => _launchURL(Constants.urlAndroidPubs),
            openApple: () => _launchURL(Constants.urlIosPubs),
          ),
        ),
      ),
      TextOptionWidget(
        index: 5,
        title: 'TRIPPSTER',
        onTap: () => _openDetail(
          const DetailInfoPage(
            title: 'TRIPPSTER',
            description:
                'Bievenido a TRIPPSTER, en Trippster podrás conectar con viajeros de todo el mundo y compartir con ellos experiencias auténticas. Descubre el Alma Viajera: Quiénes Somos en Trippster, En Trippster, somos apasionados exploradores y expertos en hacer realidad tus sueños de viaje. Con años de experiencia en el sector, nos enorgullece ofrecer experiencias únicas y personalizadas que van más allá de lo convencional. Nuestro compromiso es convertir cada viaje en una aventura inolvidable, brindando un servicio excepcional y descubriendo destinos extraordinarios, ¡Bienvenido a Trippster, donde cada viaje es una historia por contar!',
            coverImage: 'assets/trippster_6.png',
            images: [
              'assets/trippster_1.png',
              'assets/trippster_3.png',
              'assets/trippster_5.png',
              'assets/trippster_4.png',
              'assets/trippster_2.png',
            ],
          ),
        ),
      ),
      TextOptionWidget(
        index: 6,
        title: 'MEPET',
        onTap: () => _openDetail(
          const DetailInfoPage(
            title: 'MEPET',
            description:
                'Descarga MePet y encuentra todo lo que tu mascota necesita en un solo lugar. Con MePet, podrás: Comprar alimentos, juguetes, medicinas y más. Explorar nuestra sección de adopción para encontrar a tu nuevo mejor amigo podras con MePet poner en adopción a mascotas que necesitan un hogar. MePet facilita el proceso de adopción y ayuda a muchos animalitos a encontrar un hogar amoroso. ¡Descarga nuestra app y compártela con tus amigos para hacer la diferencia! Ayuda a más animales a encontrar un hogar ¡Con MePet, todos ganan! 🐾💖',
            coverImage: 'assets/mepet_1.png',
            images: [
              'assets/mepet_2.png',
              'assets/mepet_3.png',
              'assets/mepet_4.png',
              'assets/mepet_5.png',
            ],
          ),
        ),
      ),
      TextOptionWidget(
        index: 7,
        title: 'CONSULTORIO VIRTUAL',
        onTap: () => _openDetail(
          const DetailInfoPage(
            title: 'CONSULTORIO VIRTUAL',
            description:
                '¡Bienvenido a Consultorio Virtual, tu asistente personal para gestionar y mejorar tu salud!. Con Consultorio Virtual podrás: Monitorear indicadores clave de salud como peso, presión arterial, ritmo cardíaco y más. Recibir recordatorios y alertas para tomar medicación o realizar chequeos importantes. Visualizar tu evolución con gráficos y estadísticas detalladas. Acceder a consejos personalizados y recomendaciones basadas en tus datos de salud. Compartir tu información con médicos y profesionales de la salud de forma segura. Empieza a tomar el control de tu bienestar hoy mismo. ¡Descarga Consultorio Virtual y lleva un registro completo de tu salud en la palma de tu mano!',
            coverImage: 'assets/cons_virt_1.jpg',
            images: [
              'assets/cons_virt_2.png',
              'assets/cons_virt_3.png',
              'assets/cons_virt_5.png',
              'assets/cons_virt_4.png',
            ],
          ),
        ),
      ),
    ];
  }

  Widget _metaColumn(BuildContext context) {
    final mono = Theme.of(context).textTheme.bodySmall!;
    return FadeTransition(
      opacity: _animation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Portfolio of Ivan Gustin', style: mono),
          const Gap(4),
          Text('Software Engineer', style: mono),
          const Gap(24),
          Text('Pasto, Colombia', style: mono),
          const Gap(4),
          SelectableText(
            'ivandgustin@gmail.com',
            style: mono.copyWith(
              color: Constants.ink,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(24),
          _MonoLink(
            label: 'LinkedIn ↗',
            onTap: () => _launchURL('https://www.linkedin.com/in/ivandgu/'),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingH, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const NameWidget(),
              const Gap(40),
              _metaColumn(context),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                left: 40, top: 60, bottom: 60, right: Constants.paddingH),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _projectRows(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._projectRows(),
            const Gap(90),
            const NameWidget(),
            const Gap(28),
            _metaColumn(context),
          ],
        ),
      ),
    );
  }
}

class _MonoLink extends StatefulWidget {
  const _MonoLink({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  State<_MonoLink> createState() => _MonoLinkState();
}

class _MonoLinkState extends State<_MonoLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: Constants.animFast,
          curve: Curves.easeOutCubic,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: _hovered ? Constants.accent : Constants.ink,
              ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
