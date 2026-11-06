# LCARS

An [Omarchy](https://omarchy.org/) theme in the style of the LCARS panels from *Star Trek: The Next Generation*. The palette is Michael Okuda's 2369 set: a black field, atomic tangerine (`#ff9900`), and tanoi text (`#ffcc99`).

The wallpapers use the television elbow frame, with station buttons down the left rail and the ship's name on the bottom bar. The ready room wallpaper is dedicated to Sir Patrick Stewart. Fastfetch gets a gold Starfleet insignia, and the screensaver names the *U.S.S. Enterprise*, NCC-1701-D, at stardate 41153.7.

## Screenshots

Bridge

![Bridge wallpaper, an LCARS elbow frame on black with a short dedication](backgrounds/01-bridge.png)

Main viewer

![Ops wallpaper, the same frame with a registry readout and a side view of the Enterprise](backgrounds/02-ops.png)

Ready room

![Ready room wallpaper, a dedication to Sir Patrick Stewart](backgrounds/03-ready-room.png)

## Install

```bash
omarchy theme install https://github.com/linuxg33k76/omarchy-lcars-theme.git
omarchy hook install theme-set ~/.config/omarchy/themes/lcars/hooks/lcars-branding
omarchy theme set lcars
```

The first command clones the repo as the `lcars` theme and applies the colors, wallpapers, icons, and shell chrome. Cycle the wallpapers with `omarchy theme bg next`.

The hook has to be installed before the theme is applied again. That second `omarchy theme set lcars` is what runs it. After that, every switch to LCARS runs the same hook.

`colors.toml` drives the terminal, the shell, and the window colors. The shell files set the bar, launcher, lock screen, menu, notifications, polkit prompt, popups, and tooltips. Icons follow Yaru-yellow.

`hyprland.lua` adds a thicker border, rounded corners, and an orange shadow. Omarchy does not load `.lua` from a theme installed with `omarchy theme install`, so that file is skipped on the path above. Border color still comes from `colors.toml`. To keep `hyprland.lua`, point the theme directory at your own checkout, then install the hook the same way:

```bash
git clone https://github.com/linuxg33k76/omarchy-lcars-theme.git ~/code/omarchy-lcars-theme
ln -sfn ~/code/omarchy-lcars-theme ~/.config/omarchy/themes/lcars
omarchy hook install theme-set ~/.config/omarchy/themes/lcars/hooks/lcars-branding
omarchy theme set lcars
```

## Theme hook

`hooks/lcars-branding` runs from `omarchy hook install theme-set`. While LCARS is the active theme it:

- Copies `about.txt` to `~/.config/omarchy/branding/about.txt`, which is the fastfetch logo, and `screensaver.txt` to the screensaver branding file.
- Sets fastfetch logo colors 1 through 9 to the LCARS golds. The insignia uses slots 2, 3, and 9. Stock Omarchy only defines slot 1.
- Installs `plugins/samurai.stardate` and places it on the bar immediately to the right of the day and time.

Leaving LCARS for another theme puts the previous logo, screensaver, and fastfetch colors back. The stardate stays on the bar. Take it out of the bar layout if you do not want it on other themes.

The screensaver runs in Alacritty, Ghostty, Foot, or Kitty. Preview it with `omarchy-launch-screensaver force`.

## Stardate

The bar reads today's date 340 years ahead and shows it as a Next Generation stardate, one decimal place, for example `STARDATE 43843.4`. Stardate 0 is 1 January 2323, and one year is 1000 units. The static stardate on the wallpapers and screensaver, 41153.7, is the day Captain Picard takes command in *Encounter at Farpoint*.
