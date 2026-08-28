## Adapta-Nokto-Agy

A customized dark theme for Linux desktop environments, tailored for Cinnamon with custom window accents, refined contrast and background transparency.
Cinnamon, Metacity, GTK2, GTK3.22 and GTK4 themes are included.

## Credits & Fork

This project is a fork of [adapta-gtk-theme-cinnamon-spices](https://github.com/slak44/adapta-gtk-theme-cinnamon-spices).

Based on:
- [slak44's fork of Adapta](https://github.com/slak44/adapta-gtk-theme-cinnamon-spices)
- [smurphos' fork of Adapta](https://github.com/smurphos/adapta-gtk-theme-cinnamon-spices/tree/spice-build), `spice-build` branch
- [Tista's original Adapta repo](https://github.com/adapta-project/adapta-gtk-theme), `master` branch
- [senatoreg's fork of Adapta](https://github.com/senatoreg/adapta-gtk-theme/), `master` branch
- Misc fixes committed directly to the Adapta CSS in [cinnamon-spices-themes](https://github.com/linuxmint/cinnamon-spices-themes)

## License

This theme is distributed under the terms of the [GPLv2.0 license](https://github.com/smurphos/adapta-gtk-theme/blob/master/COPYING).

Assets in svg format are distributed under the terms of the [CC BY-SA 4.0 license](https://github.com/smurphos/adapta-gtk-theme/blob/master/LICENSE_CC_BY_SA4).

Cinnamon thumbnail includes a depiction of icons from Sam Hewitt's [Paper Icons](https://snwh.org/paper) licensed under CC-SA-4.0.

Wallpaper in screenshots is from [Adapta Backgrounds](https://github.com/adapta-project/adapta-backgrounds) licensed under [CC BY-SA 4.0 license](https://github.com/adapta-project/adapta-backgrounds/blob/master/LICENSE_CC_BY_SA4).

## Customizations in Adapta-Nokto-Agy

- **Window Titlebar & Controls**: Custom hover colors on window control buttons (Minimize: sky blue `#3498db`, Maximize: indigo/purple `#9b59b6`, Close: soft red `#e74c3c`).
- **Start Menu & Panel**: Softer background dark shades with subtle transparency and enhanced blur integration.
- **System Buttons**: Customized styling and alignment for Lock, Logout and Shutdown actions.

## Installation

### Option 1: Archive tar.gz (Recommended)
Download the `Adapta-Nokto-Agy.tar.gz` archive to your `Downloads` directory, extract it and copy the theme folder to `~/.themes`:

```bash
cd ~/Downloads
tar -xzf Adapta-Nokto-Agy.tar.gz
mkdir -p ~/.themes
cp -r Adapta-Nokto-Agy ~/.themes/
```

### Option 2: Git Clone
```bash
git clone https://github.com/qaqamzmz/Adapta-Nokto-Agy.git ~/.themes/Adapta-Nokto-Agy
```

Select **Adapta-Nokto-Agy** as your Desktop, Controls, and Window Borders in the Cinnamon Themes settings module (`cinnamon-settings themes`).

To allow the GTK2, GTK3 and Metacity themes to apply to GUI apps running as root:

```bash
sudo mkdir -p /usr/local/share/themes
sudo ln -s ~/.themes/Adapta-Nokto-Agy /usr/local/share/themes/
```

## Compatibility

This theme is compatible with Cinnamon versions:
- `3.2.x` to `6.6.x`+
- GTK `3.20.x`+ and GTK `4.0`
