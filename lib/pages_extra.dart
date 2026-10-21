import 'package:flutter/material.dart';
import 'main.dart';

// Underline tab row shared by pages
class TabRow1 extends StatelessWidget {
  final List<String> tabs;
  final int index;
  final ValueChanged<int> onChanged;
  const TabRow1(this.tabs, this.index, this.onChanged, {super.key});
  @override
  Widget build(BuildContext context) => Row(children: [
        for (var i = 0; i < tabs.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: index == i ? kPrimary : const Color(0xFFE5E7F5), width: 2))),
                child: Text(tabs[i], textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700, color: index == i ? kPrimary : kGrey)),
              ),
            ),
          ),
      ]);
}

// ---------- Course details ----------
class CourseDetailsPage extends StatefulWidget {
  final Subject s;
  const CourseDetailsPage(this.s, {super.key});
  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    const lessons = [('Basic Concepts', '10 min', true), ('Algebra Introduction', '15 min', true), ('Geometry Basics', '12 min', false), ('Trigonometry', '14 min', false)];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Course Details', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)), centerTitle: true, backgroundColor: Colors.white),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(gradient: grad(const [Color(0xFF3B34C9), Color(0xFF5B5BF0)]), borderRadius: BorderRadius.circular(20)),
          child: const Row(children: [
            CircleAvatar(radius: 30, backgroundColor: Colors.white24, child: Text('π', style: TextStyle(fontSize: 30, color: Colors.white))),
            SizedBox(width: 14),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Introduction to Mathematics', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
                Text('12 lessons • 60% complete', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ),
          ]),
        ),
        const SizedBox(height: 16),
        const Row(children: [
          CircleAvatar(radius: 22, backgroundColor: Color(0xFFE0E3FF), child: Icon(Icons.person, color: kPrimary)),
          SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Mr. Rahim', style: TextStyle(fontWeight: FontWeight.w700, color: kDark)),
            Text('Mathematics Teacher', style: TextStyle(color: kGrey, fontSize: 12)),
          ]),
        ]),
        const SizedBox(height: 10),
        const Row(children: [
          Icon(Icons.star_rounded, color: Colors.amber, size: 20),
          Text(' 4.8 ', style: TextStyle(fontWeight: FontWeight.w700)),
          Text('(124 reviews)', style: TextStyle(color: kGrey, fontSize: 12)),
        ]),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: cardDeco(),
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Your Progress', style: TextStyle(fontWeight: FontWeight.w700)), Text('60%', style: TextStyle(color: kPrimary, fontWeight: FontWeight.w700))]),
            SizedBox(height: 8),
            LinearProgressIndicator(value: .6, color: kPrimary, backgroundColor: Color(0xFFE5E7F5), minHeight: 6, borderRadius: BorderRadius.all(Radius.circular(6))),
          ]),
        ),
        const SizedBox(height: 14),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Continue Learning', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            style: ElevatedButton.styleFrom(backgroundColor: kPrimary, foregroundColor: Colors.white, shape: const StadiumBorder()),
          ),
        ),
        const SizedBox(height: 10),
        TabRow1(const ['Lessons', 'About', 'Reviews'], tab, (i) => setState(() => tab = i)),
        const SizedBox(height: 12),
        if (tab == 0)
          for (var i = 0; i < lessons.length; i++)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(radius: 16, backgroundColor: i < 2 ? kPrimary : const Color(0xFFE5E7F5), child: Text('${i + 1}', style: TextStyle(color: i < 2 ? Colors.white : kGrey, fontWeight: FontWeight.w700))),
              title: Text(lessons[i].$1, style: const TextStyle(fontWeight: FontWeight.w700, color: kDark)),
              subtitle: Text(lessons[i].$2, style: const TextStyle(color: kGrey, fontSize: 12)),
              trailing: lessons[i].$3 ? const Icon(Icons.check_circle, color: Color(0xFF10B981)) : const Icon(Icons.radio_button_unchecked, color: kGrey),
            ),
        if (tab == 1)
          const Text('This course builds your problem solving skills step by step, from number systems to algebra, geometry and trigonometry, with short lessons and practice sets.', style: TextStyle(color: kGrey, height: 1.6)),
        if (tab == 2)
          for (final r in const [('Ayesha', 'Clear explanations and great practice questions.'), ('Tanvir', 'Short lessons that are easy to follow.')])
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(backgroundColor: Color(0xFFE0E3FF), child: Icon(Icons.person, color: kPrimary)),
              title: Text(r.$1, style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(r.$2),
              trailing: const Icon(Icons.star_rounded, color: Colors.amber),
            ),
      ]),
    );
  }
}

// ---------- Progress ----------
class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});
  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    const values = [.6, .3, .8, .45];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Progress', style: TextStyle(fontWeight: FontWeight.w800)), backgroundColor: Colors.white),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: const Color(0xFFF1F2FB), borderRadius: BorderRadius.circular(24)),
          child: Row(children: [
            for (var i = 0; i < 3; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => tab = i),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(color: tab == i ? kPrimary : Colors.transparent, borderRadius: BorderRadius.circular(20)),
                    child: Text(['Overview', 'Subjects', 'Achievements'][i], textAlign: TextAlign.center, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: tab == i ? Colors.white : kGrey)),
                  ),
                ),
              ),
          ]),
        ),
        if (tab == 0) ...[
          const SizedBox(height: 28),
          Center(
            child: SizedBox(
              width: 170,
              height: 170,
              child: Stack(alignment: Alignment.center, children: [
                const SizedBox(width: 170, height: 170, child: CircularProgressIndicator(value: .75, strokeWidth: 14, color: Color(0xFF14B8A6), backgroundColor: Color(0xFFE5F5F2), strokeCap: StrokeCap.round)),
                const Column(mainAxisSize: MainAxisSize.min, children: [
                  Text('75%', style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: kDark)),
                  Text('Overall Progress', style: TextStyle(color: kGrey, fontSize: 11)),
                ]),
              ]),
            ),
          ),
          const SizedBox(height: 14),
          const Center(child: Text('"Progress, not perfection."', style: TextStyle(color: kGrey, fontStyle: FontStyle.italic))),
        ],
        if (tab == 2)
          for (final a in const [('First Quiz', Icons.flag), ('5 Day Streak', Icons.local_fire_department), ('Top Scorer', Icons.emoji_events)])
            Container(
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(14),
              decoration: cardDeco(),
              child: Row(children: [Icon(a.$2, color: Colors.amber, size: 30), const SizedBox(width: 14), Text(a.$1, style: const TextStyle(fontWeight: FontWeight.w700, color: kDark))]),
            ),
        if (tab != 2) ...[
          const SectionTitle('Subject Progress', viewAll: false),
          for (var i = 0; i < subjects.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(children: [
                IconBox(subjects[i].icon, subjects[i].colors, size: 36),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(subjects[i].name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(value: values[i], color: subjects[i].colors[0], backgroundColor: const Color(0xFFE5E7F5), minHeight: 6, borderRadius: BorderRadius.circular(6)),
                  ]),
                ),
                const SizedBox(width: 10),
                Text('${(values[i] * 100).round()}%', style: const TextStyle(color: kGrey, fontSize: 12)),
              ]),
            ),
        ],
      ]),
    );
  }
}

// ---------- Quiz result ----------
class QuizResultPage extends StatelessWidget {
  final int score, total;
  const QuizResultPage(this.score, this.total, {super.key});
  @override
  Widget build(BuildContext context) {
    final pct = score / total;
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.emoji_events_rounded, color: Colors.amber, size: 72),
            const SizedBox(height: 10),
            Text(pct >= .5 ? 'Great job!' : 'Keep going!', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: kDark)),
            const SizedBox(height: 24),
            SizedBox(
              width: 150,
              height: 150,
              child: Stack(alignment: Alignment.center, children: [
                SizedBox(width: 150, height: 150, child: CircularProgressIndicator(value: pct, strokeWidth: 12, color: kPrimary, backgroundColor: const Color(0xFFE0E3FF), strokeCap: StrokeCap.round)),
                Text('$score/$total', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: kDark)),
              ]),
            ),
            const SizedBox(height: 16),
            Text('+${score * 10} points earned', style: const TextStyle(color: kGrey)),
            const SizedBox(height: 36),
            PrimaryButton('Back to Quizzes', () => Navigator.popUntil(context, (r) => r.isFirst)),
          ]),
        ),
      ),
    );
  }
}