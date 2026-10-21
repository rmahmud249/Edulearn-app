import 'package:flutter/material.dart';

void main() => runApp(const EduLearnApp());

const kPrimary = Color(0xFF4F46E5);
const kDark = Color(0xFF1E1B4B);
const kBg = Color(0xFFF5F6FF);
const kGrey = Color(0xFF8A8FA8);

class Subject {
  final String name, teacher;
  final int lessons;
  final IconData icon;
  final List<Color> colors;
  const Subject(this.name, this.teacher, this.lessons, this.icon, this.colors);
}

const subjects = [
  Subject('Mathematics', 'Mr. Rahim', 12, Icons.calculate_rounded, [
    Color(0xFF4F46E5),
    Color(0xFF6D5CF0),
  ]),
  Subject('Science', 'Ms. Sara', 10, Icons.science_rounded, [
    Color(0xFF10B981),
    Color(0xFF2DD4BF),
  ]),
  Subject('English', 'Mr. Karim', 8, Icons.menu_book_rounded, [
    Color(0xFFF59E0B),
    Color(0xFFFB923C),
  ]),
  Subject('Computer', 'Ms. Nadia', 15, Icons.laptop_mac_rounded, [
    Color(0xFFEC4899),
    Color(0xFFF472B6),
  ]),
];

class EduLearnApp extends StatelessWidget {
  const EduLearnApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'EduLearn',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: kPrimary,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Roboto',
    ),
    home: const SplashPage(),
  );
}

// ---------- Shared widgets ----------
BoxDecoration cardDeco([Color c = Colors.white]) => BoxDecoration(
  color: c,
  borderRadius: BorderRadius.circular(18),
  boxShadow: [
    BoxShadow(
      color: kPrimary.withOpacity(.07),
      blurRadius: 14,
      offset: const Offset(0, 4),
    ),
  ],
);

LinearGradient grad(List<Color> c) => LinearGradient(
  colors: c,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

class IconBox extends StatelessWidget {
  final IconData icon;
  final List<Color> colors;
  final double size;
  const IconBox(this.icon, this.colors, {super.key, this.size = 48});
  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      gradient: grad(colors),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Icon(icon, color: Colors.white, size: size * .5),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryButton(this.text, this.onTap, {super.key});
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: 54,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    ),
  );
}

class Banner1 extends StatelessWidget {
  final String title, sub, button;
  final IconData icon;
  final VoidCallback? onTap;
  const Banner1(
    this.title,
    this.sub,
    this.icon, {
    super.key,
    this.button = '',
    this.onTap,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: grad(const [Color(0xFF3B34C9), Color(0xFF5B5BF0)]),
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                sub,
                style: TextStyle(
                  color: Colors.white.withOpacity(.85),
                  fontSize: 13,
                ),
              ),
              if (button.isNotEmpty) ...[
                const SizedBox(height: 14),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: kPrimary,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    '$button  →',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        Icon(icon, size: 86, color: Colors.amber),
      ],
    ),
  );
}

class SectionTitle extends StatelessWidget {
  final String text;
  final bool viewAll;
  const SectionTitle(this.text, {super.key, this.viewAll = true});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: kDark,
          ),
        ),
        if (viewAll)
          const Text(
            'View all →',
            style: TextStyle(
              color: kPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    ),
  );
}

// ---------- Splash ----------
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MainShell()),
        );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: kBg,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              gradient: grad(const [Color(0xFF3B34C9), Color(0xFF6D5CF0)]),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.school_rounded,
              color: Colors.white,
              size: 60,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'EduLearn',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w900,
              color: kDark,
            ),
          ),
          const Text(
            'Your Learning Partner',
            style: TextStyle(color: kGrey, fontSize: 16),
          ),
          const SizedBox(height: 40),
          const SizedBox(
            width: 120,
            child: LinearProgressIndicator(
              color: kPrimary,
              minHeight: 4,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
          ),
        ],
      ),
    ),
  );
}

// ---------- Shell with bottom nav ----------
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const SubjectsPage(),
      const QuizListPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: index, children: pages),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 16),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: kPrimary,
          unselectedItemColor: kGrey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              activeIcon: Icon(Icons.menu_book_rounded),
              label: 'Subjects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined),
              activeIcon: Icon(Icons.emoji_events),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

void openSubject(BuildContext c, Subject s) =>
    Navigator.push(c, MaterialPageRoute(builder: (_) => SubjectDetailPage(s)));

// ---------- Home ----------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      Row(
        children: [
          const Icon(Icons.school_rounded, color: kPrimary, size: 30),
          const SizedBox(width: 8),
          const Text(
            'EduLearn',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: kPrimary,
            ),
          ),
          const Spacer(),
          const Icon(Icons.notifications_none_rounded, color: kDark),
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFE0E3FF),
            child: Icon(Icons.person, color: kPrimary),
          ),
        ],
      ),

      // Search bar
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: cardDeco(),
        child: const Row(
          children: [
            Icon(Icons.search, color: kGrey),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Search courses, subjects, or lessons...',
                style: TextStyle(color: kGrey, fontSize: 13),
              ),
            ),
          ],
        ),
      ),

      // Learning banner
      const SizedBox(height: 16),
      Banner1(
        'Small Steps\nBig Dreams',
        'Keep learning,\nkeep growing!',
        Icons.auto_stories_rounded,
        button: 'Start Learning',
        onTap: () => openSubject(context, subjects[0]),
      ),

      // Quick subjects
      const SectionTitle('Quick Subjects'),
      GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
        children: [for (final s in subjects) SubjectTile(s)],
      ),

      // Continue learning
      const SectionTitle('Continue Learning'),
      ContinueCard(subjects[0]),
    ],
  );
}

class SubjectTile extends StatelessWidget {
  final Subject s;
  const SubjectTile(this.s, {super.key});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => openSubject(context, s),
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: grad(s.colors),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(s.icon, color: Colors.white, size: 28),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${s.lessons} lessons',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.85),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward_ios, size: 11, color: kPrimary),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class ContinueCard extends StatelessWidget {
  final Subject s;
  const ContinueCard(this.s, {super.key});
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => openSubject(context, s),
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: cardDeco(),
      child: Row(
        children: [
          IconBox(s.icon, s.colors, size: 56),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Introduction to Mathematics',
                  style: TextStyle(fontWeight: FontWeight.w700, color: kDark),
                ),
                Text(
                  s.teacher,
                  style: const TextStyle(color: kGrey, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Expanded(
                      child: LinearProgressIndicator(
                        value: .6,
                        color: kPrimary,
                        backgroundColor: Color(0xFFE5E7F5),
                        minHeight: 6,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '60%',
                      style: TextStyle(fontSize: 12, color: kGrey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: kPrimary),
        ],
      ),
    ),
  );
}

// ---------- Subjects ----------
class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});
  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Subjects',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: kDark,
            ),
          ),
          Icon(Icons.search, color: kDark),
        ],
      ),
      const SizedBox(height: 14),
      const Banner1(
        'Explore Your Favorite Subjects',
        'Choose a subject and start your learning journey today!',
        Icons.local_library_rounded,
      ),
      const SizedBox(height: 16),
      for (final s in subjects)
        GestureDetector(
          onTap: () => openSubject(context, s),
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: cardDeco(),
            child: Row(
              children: [
                IconBox(s.icon, s.colors, size: 52),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: kDark,
                        ),
                      ),
                      Text(
                        '${s.lessons} lessons',
                        style: const TextStyle(color: kGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: kPrimary),
              ],
            ),
          ),
        ),
      Container(
        padding: const EdgeInsets.all(14),
        decoration: cardDeco(const Color(0xFFFFF7E8)),
        child: const Row(
          children: [
            Icon(Icons.workspace_premium, color: Colors.amber, size: 34),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Unlock More Subjects\nGet premium access to more subjects and advanced courses.',
                style: TextStyle(fontSize: 12, color: kDark),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

// ---------- Subject detail ----------
enum LState { done, progress, locked }

class SubjectDetailPage extends StatelessWidget {
  final Subject s;
  const SubjectDetailPage(this.s, {super.key});
  @override
  Widget build(BuildContext context) {
    const lessons = [
      ('Basic Arithmetic', '10 min', LState.done),
      ('Fractions', '12 min', LState.done),
      ('Decimals', '15 min', LState.progress),
      ('Algebra Basics', '15 min', LState.locked),
      ('Geometry', '12 min', LState.locked),
    ];
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: kBg,
        title: Text(
          s.name,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: cardDeco(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconBox(s.icon, s.colors, size: 56),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Introduction to Mathematics',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                              color: kDark,
                            ),
                          ),
                          Text(
                            '${s.teacher} • ${s.lessons} lessons',
                            style: const TextStyle(color: kGrey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const LinearProgressIndicator(
                  value: .6,
                  color: kPrimary,
                  backgroundColor: Color(0xFFE5E7F5),
                  minHeight: 6,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                const SizedBox(height: 4),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '60% completed',
                    style: TextStyle(fontSize: 11, color: kGrey),
                  ),
                ),
              ],
            ),
          ),
          const SectionTitle('Lessons', viewAll: false),
          for (var i = 0; i < lessons.length; i++)
            GestureDetector(
              onTap: lessons[i].$3 == LState.locked
                  ? null
                  : () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LessonPage(lessons[i].$1, s.name),
                      ),
                    ),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(14),
                decoration: cardDeco(),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: lessons[i].$3 == LState.locked
                          ? const Color(0xFFE5E7F5)
                          : kPrimary,
                      child: Text(
                        '${i + 1}',
                        style: TextStyle(
                          color: lessons[i].$3 == LState.locked
                              ? kGrey
                              : Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lessons[i].$1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: kDark,
                            ),
                          ),
                          Text(
                            lessons[i].$2,
                            style: const TextStyle(color: kGrey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    switch (lessons[i].$3) {
                      LState.done => const Icon(
                        Icons.check_circle,
                        color: Color(0xFF10B981),
                      ),
                      LState.progress => const Icon(
                        Icons.play_circle_fill,
                        color: kPrimary,
                      ),
                      LState.locked => const Icon(
                        Icons.lock_outline,
                        color: kGrey,
                      ),
                    },
                  ],
                ),
              ),
            ),
          const SizedBox(height: 10),
          PrimaryButton('Continue Learning', () {}),
        ],
      ),
    );
  }
}

// ---------- Lesson ----------
class LessonPage extends StatelessWidget {
  final String title, subject;
  const LessonPage(this.title, this.subject, {super.key});
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 260,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
            decoration: BoxDecoration(
              gradient: grad(const [Color(0xFF3B34C9), Color(0xFF5B5BF0)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Spacer(),
                    const Icon(Icons.share, color: Colors.white),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  '$subject  •  10 min',
                  style: TextStyle(color: Colors.white.withOpacity(.85)),
                ),
              ],
            ),
          ),
          const TabBar(
            labelColor: kPrimary,
            unselectedLabelColor: kGrey,
            indicatorColor: kPrimary,
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Video'),
              Tab(text: 'Notes'),
              Tab(text: 'Quiz'),
            ],
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About this lesson',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kDark,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Learn about natural numbers, whole numbers, integers, rational numbers and real numbers. This lesson will help you understand the foundation of number systems.',
                    style: TextStyle(color: kGrey, height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: PrimaryButton('Start Lesson', () {}),
          ),
        ],
      ),
    ),
  );
}

// ---------- Quiz list ----------
class QuizListPage extends StatefulWidget {
  const QuizListPage({super.key});
  @override
  State<QuizListPage> createState() => _QuizListPageState();
}

class _QuizListPageState extends State<QuizListPage> {
  int chip = 0;
  @override
  Widget build(BuildContext context) {
    const chips = ['All', 'Mathematics', 'Science', 'English'];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Quiz',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: kDark,
          ),
        ),
        const SizedBox(height: 14),
        const Banner1(
          'Test Your Knowledge',
          'Take quizzes, earn points and improve your skills!',
          Icons.emoji_events_rounded,
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < chips.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(chips[i]),
                    selected: chip == i,
                    onSelected: (_) => setState(() => chip = i),
                    selectedColor: kPrimary,
                    labelStyle: TextStyle(
                      color: chip == i ? Colors.white : kGrey,
                    ),
                    showCheckmark: false,
                    shape: const StadiumBorder(),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        for (final s in subjects)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: cardDeco(),
            child: Row(
              children: [
                IconBox(s.icon, s.colors, size: 46),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${s.name} Quiz',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: kDark,
                        ),
                      ),
                      const Text(
                        '10 Questions • 10 min',
                        style: TextStyle(color: kGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizAttemptPage()),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimary,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Start'),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// ---------- Quiz attempt ----------
class QuizAttemptPage extends StatefulWidget {
  const QuizAttemptPage({super.key});
  @override
  State<QuizAttemptPage> createState() => _QuizAttemptPageState();
}

class _QuizAttemptPageState extends State<QuizAttemptPage> {
  final qs = const [
    ('What is the value of 5²?', ['10', '15', '20', '25'], 3),
    ('What is the value of 2 + 3 × 4?', ['20', '14', '12', '10'], 1),
    ('What is the square root of 81?', ['7', '8', '9', '10'], 2),
  ];
  int q = 0, picked = -1, score = 0;

  void next() {
    if (picked == -1) return;
    if (picked == qs[q].$3) score++;
    if (q == qs.length - 1) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Quiz Complete 🎉'),
          content: Text('You scored $score / ${qs.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        q++;
        picked = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cur = qs[q];
    return Scaffold(
      backgroundColor: kBg,
      appBar: AppBar(
        backgroundColor: kBg,
        title: Text(
          '${q + 1}/${qs.length}',
          style: const TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (q + 1) / qs.length,
              color: kPrimary,
              backgroundColor: const Color(0xFFE5E7F5),
              minHeight: 6,
              borderRadius: BorderRadius.circular(6),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Mathematics',
                style: TextStyle(color: kPrimary, fontSize: 12),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              cur.$1,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: kDark,
              ),
            ),
            const SizedBox(height: 20),
            for (var i = 0; i < 4; i++)
              GestureDetector(
                onTap: () => setState(() => picked = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: picked == i ? const Color(0xFFD1FAE5) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: picked == i
                          ? const Color(0xFF10B981)
                          : const Color(0xFFE5E7F5),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: picked == i
                            ? const Color(0xFF10B981)
                            : const Color(0xFFE5E7F5),
                        child: Text(
                          'ABCD'[i],
                          style: TextStyle(
                            fontSize: 12,
                            color: picked == i ? Colors.white : kGrey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          cur.$2[i],
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: kDark,
                          ),
                        ),
                      ),
                      if (picked == i)
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF10B981),
                        ),
                    ],
                  ),
                ),
              ),
            const Spacer(),
            PrimaryButton(q == qs.length - 1 ? 'Finish' : 'Next', next),
          ],
        ),
      ),
    );
  }
}

// ---------- Profile ----------
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    const stats = [
      ('12', 'Courses', Icons.menu_book_rounded),
      ('4', 'Quizzes', Icons.emoji_events),
      ('320', 'Points', Icons.star_rounded),
    ];
    const items = [
      (Icons.menu_book_rounded, 'My Courses'),
      (Icons.verified_user, 'My Quizzes'),
      (Icons.emoji_events, 'Achievements'),
      (Icons.settings, 'Settings'),
      (Icons.headset_mic, 'Help & Support'),
    ];
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE0E3FF),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 48, color: kPrimary),
              ),
              SizedBox(height: 10),
              Text(
                'Rasel Mahmud',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: kDark,
                ),
              ),
              Text(
                'rasel@example.com',
                style: TextStyle(color: kGrey, fontSize: 13),
              ),
              SizedBox(height: 8),
              Text(
                '✎ Edit Profile',
                style: TextStyle(
                  color: kPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            for (final s in stats)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: cardDeco(),
                  child: Column(
                    children: [
                      Icon(s.$3, color: kPrimary),
                      Text(
                        s.$1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: kDark,
                        ),
                      ),
                      Text(
                        s.$2,
                        style: const TextStyle(color: kGrey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: cardDeco(),
          child: Column(
            children: [
              for (final it in items)
                ListTile(
                  leading: Icon(it.$1, color: kPrimary),
                  title: Text(
                    it.$2,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  trailing: const Icon(Icons.chevron_right, color: kGrey),
                ),
              const ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
