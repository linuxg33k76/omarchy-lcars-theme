# Stardate

An Omarchy top-bar widget. It shows today's date as a Next Generation stardate, one decimal place, for example `STARDATE 43843.4`. The clock keeps the day and the time. This widget sits on the right side of the bar, drawn in the bar's active color.

Stardate 0 is 1 January 2323, and one year is 1000 units. A real date is read 340 years ahead so the number lands in that era.

## Install

Install the LCARS theme first, so the plugin files are on disk:

```bash
omarchy theme install https://github.com/linuxg33k76/omarchy-lcars-theme.git
```

Copy the plugin into Omarchy's plugin directory, then enable it on the right side of the top bar:

```bash
mkdir -p ~/.config/omarchy/plugins
cp -a ~/.config/omarchy/themes/lcars/plugins/samurai.stardate ~/.config/omarchy/plugins/
omarchy-shell shell rescanPlugins
omarchy plugin enable samurai.stardate --section right --index 0
```

From a local checkout, the copy source is the repo path instead:

```bash
cp -a ~/code/omarchy-lcars-theme/plugins/samurai.stardate ~/.config/omarchy/plugins/
omarchy-shell shell rescanPlugins
omarchy plugin enable samurai.stardate --section right --index 0
```

The theme hook `hooks/lcars-branding` does this same copy, and places the widget on the right, whenever LCARS is applied.

## Remove

```bash
omarchy plugin disable samurai.stardate
omarchy plugin remove samurai.stardate --yes
```
