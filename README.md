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

### Accent palette

Three soft accents replace the original Adapta accent colours, applied consistently across
GTK, Metacity and the Cinnamon shell:

| Accent | Normal / Hover | Active / Pressed | Used for |
| --- | --- | --- | --- |
| Sky blue | `#38BDF8` | `#0284C7` | Minimize button, Lock action, active panel window, toggles |
| Soft purple | `#8B5CF6` | `#7C3AED` | Maximize / Restore button, Logout action, tabs, categories |
| Raspberry pink | `#EC4899` | `#DB2777` | Close button, Shutdown action, critical actions |

Dark surface: `rgba(30, 41, 59, 0.97)` — 97% opacity keeps text fully legible while retaining
a hint of transparency. Derived variants: `0.85` (panel, panel corners) and `0.6` (secondary
surfaces).

### What was changed

- **Window titlebar & controls**: accent hover colours on the CSD titlebuttons (GTK 3.0 / 3.22 / 4.0)
  and on the server-side decorations (`metacity-1/*_prelight.svg`), with regenerated white glyph
  assets (dash, square, cross).
- **Start menu & panel**: softer dark surfaces at 97% opacity, updated shell SVG assets.
- **Panel window list**: the active window is strongly contrasted — tinted background, 1px accent
  border, 3px accent underline and bold white label.
- **System buttons**: Lock (sky blue), Logout (soft purple), Shutdown (raspberry pink), with icon
  centring fixed for Clutter St CSS.

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

| Component | Supported | Notes |
| --- | --- | --- |
| Cinnamon | `4.4.x` → `6.6.x`+ | Shell stylesheet in `cinnamon/` |
| GTK 3 | `3.22` → `3.24` | Single `gtk-3.22/` directory; GTK 3 is frozen at 3.24 |
| GTK 4 | `4.0`+ | `gtk-4.0/`; libadwaita apps override most of it |
| GTK 2 | `2.24` | `gtk-2.0/`, requires the `murrine` and `pixmap` engines |
| Muffin / Metacity | theme format 3 | `metacity-1/metacity-theme-3.xml` |

Cinnamon 4.4 is the floor because it is the oldest release whose distributions ship
GTK ≥ 3.22. Support for GTK < 3.22 (the old `gtk-3.0/` directory) was dropped, as GTK 3
resolves a theme by walking `gtk-3.<minor>` downwards from its own minor version and
therefore never reaches `gtk-3.0` on any supported system.
