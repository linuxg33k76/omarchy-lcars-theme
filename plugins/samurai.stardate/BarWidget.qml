import QtQuick
import qs.Ui

// TNG stardate for the bar. Stardate 0 is 1 January 2323 and a year is 1000
// units, which is the scale used on The Next Generation. A real calendar date
// is read 340 years ahead so the number lands in that era instead of coming
// out negative. One decimal, the way the shows write it (41153.7).
BarWidget {
  id: root
  moduleName: "samurai.stardate"

  function stardateValue(date) {
    var shifted = new Date(date.getFullYear() + 340, date.getMonth(), date.getDate(),
                           date.getHours(), date.getMinutes(), date.getSeconds())
    var year = shifted.getFullYear()
    var start = new Date(year, 0, 1).getTime()
    var next = new Date(year + 1, 0, 1).getTime()
    var fraction = (shifted.getTime() - start) / (next - start)
    return (year - 2323) * 1000 + fraction * 1000
  }

  function formatStardate(value) {
    return value.toFixed(1)
  }

  readonly property string numberText: formatStardate(stardateValue(ticker.now))
  readonly property string displayText: root.vertical
    ? verticalLines(numberText)
    : "STARDATE " + numberText

  function verticalLines(number) {
    var parts = number.split(".")
    var whole = parts[0]
    var lines = []
    for (var i = 0; i < whole.length; i += 2)
      lines.push(whole.substring(i, i + 2))
    lines.push("." + parts[1])
    return lines.join("\n")
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  Timer {
    id: ticker
    property date now: new Date()
    interval: 30000
    repeat: true
    running: true
    triggeredOnStart: true
    onTriggered: now = new Date()
  }

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.displayText
    labelVisible: true
    hasVisualContent: root.displayText !== ""
    horizontalMargin: root.vertical ? 2 : 6
    verticalPadding: 8.75
    tooltipText: "Stardate"
    pressFeedbackButtons: Qt.NoButton
  }
}
