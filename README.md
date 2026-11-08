# Adapta-Nokto-Agy

🌐 **Language / Langue :** [🇬🇧 English User Guide](#english-user-guide) | [🇫🇷 Guide Utilisateur Français](#guide-utilisateur-français)

---

<a id="english-user-guide"></a>

## 🇬🇧 English User Guide

**Adapta-Nokto-Agy** is a customized dark theme for Linux desktop environments, tailored for **Cinnamon** with soft Tailwind-inspired window accents, refined contrast, and subtle background transparency.
Cinnamon, Metacity/Muffin, GTK2, GTK3.22, and GTK4 themes are included.

### 1. Visual Identity & Accent Palette

Three soft accents replace the original Adapta teal colours, applied consistently across GTK, Metacity, and the Cinnamon shell:

| Accent | Normal / Hover | Active / Pressed | Used for |
| --- | --- | --- | --- |
| 🔵 **Sky blue** | `#38BDF8` | `#0284C7` | Minimize button, Lock action, active panel window, toggles, sliders & OSD |
| 🟣 **Soft purple** | `#8B5CF6` | `#7C3AED` | Maximize / Restore button, Logout action, tabs, categories, panel hover |
| 🌸 **Raspberry pink** | `#EC4899` | `#DB2777` | Close button, Shutdown action, destructive actions, urgent window alerts |

- **Dark surface**: `rgba(30, 41, 59, 0.97)` — 97% opacity keeps text fully legible while retaining a subtle hint of transparency.
- **Derived surfaces**: `rgba(30, 41, 59, 0.85)` (panel, panel corners) and `rgba(30, 41, 59, 0.6)` (secondary surfaces).

#### Key Customizations
- **Window titlebar & controls**: Accent hover and active colours on CSD titlebuttons (GTK 3.22 / 4.0) and server-side decorations (`metacity-1/*_prelight.svg` & `*_pressed.svg`), with crisp white glyph assets (dash, square, cross).
- **Start menu (`menu@cinnamon.org`)**:
  - Dedicated 9-slice frame (`cinnamon/assets/menu/appmenu.svg`) with rounded corners (`9px`) and deeper drop shadow (`14px`).
  - Circular user avatar (`border-radius: 32px`).
  - Compact left sidebar (places & favourites) engineered to fit without hidden vertical scrolling.
  - Sky-blue pill badge (`#38BDF8`) behind Places icons so glyphs remain visible regardless of whether your icon theme hardcodes dark or light SVG colours.
  - System action buttons colour-coded by role: **Lock** (sky blue), **Logout** (soft purple), **Shutdown** (raspberry pink).
- **Panel window list**: The active window stands out with a tinted sky-blue background (`rgba(56, 189, 248, 0.32)`), a `1px` accent border, a `3px` accent underline, and a bold white label.

---

### 2. Compatibility & Requirements

| Component | Supported | Notes |
| --- | --- | --- |
| **Cinnamon** | `4.4.x` → `6.6.x`+ | Shell stylesheet in `cinnamon/` |
| **GTK 3** | `3.22` → `3.24` | Single `gtk-3.22/` directory; GTK 3 is frozen at 3.24 |
| **GTK 4** | `4.0`+ | `gtk-4.0/`; libadwaita apps override most of it |
| **GTK 2** | `2.24` | `gtk-2.0/`, requires the `murrine` and `pixmap` engines |
| **Muffin / Metacity** | Theme format `3` | `metacity-1/metacity-theme-3.xml` |

> [!NOTE]
> Cinnamon 4.4 is the floor because it is the oldest release whose distributions ship GTK ≥ 3.22. Support for GTK < 3.22 (the legacy `gtk-3.0/` directory) was dropped, as GTK 3 resolves a theme by walking `gtk-3.<minor>` downwards from its own minor version and never reaches `gtk-3.0` on supported systems.

**Recommended GTK2 engines (Debian / Ubuntu / Linux Mint):**
```bash
sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf
```

---

### 3. Installation & Activation

#### Option 1: Git Clone (Recommended)
```bash
mkdir -p ~/.themes
git clone https://github.com/qaqamzmz/Adapta-Nokto-Agy.git ~/.themes/Adapta-Nokto-Agy
```

#### Option 2: Archive `.tar.gz`
Download `Adapta-Nokto-Agy.tar.gz` to `~/Downloads`, extract it, and copy the theme folder to `~/.themes`:
```bash
cd ~/Downloads
tar -xzf Adapta-Nokto-Agy.tar.gz
mkdir -p ~/.themes
cp -r Adapta-Nokto-Agy ~/.themes/
```

#### Activating the Theme (GUI)
Open **System Settings → Themes** (`cinnamon-settings themes`) and select **Adapta-Nokto-Agy** for:
- **Window borders** (Metacity / Muffin)
- **Controls** (GTK2 / GTK3 / GTK4)
- **Desktop** (Cinnamon Shell)

#### Activating the Theme (Command Line)
```bash
gsettings set org.cinnamon.theme name "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.interface gtk-theme "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.wm.preferences theme "Adapta-Nokto-Agy"
gsettings set org.gnome.desktop.wm.preferences theme "Adapta-Nokto-Agy"
```

#### Support for Root (`sudo`) GUI Applications
To allow GTK2, GTK3, and Metacity themes to apply to GUI applications running as `root`:
```bash
sudo mkdir -p /usr/local/share/themes
sudo ln -s ~/.themes/Adapta-Nokto-Agy /usr/local/share/themes/
```

#### Recommended Icon Theme
For optimal contrast across application menus and panels, pair **Adapta-Nokto-Agy** with a dark icon theme variant (such as `WhiteSur-dark` or `Papirus-Dark`):
```bash
gsettings set org.cinnamon.desktop.interface icon-theme "WhiteSur-dark"
```

---

### 4. Helper Scripts (`scripts/`)

Three interactive helper scripts are provided in the `scripts/` folder (must be run from a terminal):

1. **Change Desktop Font Size (`scripts/adapta_fontsize.sh`)**
   Allows you to switch the Cinnamon desktop base font size between `System controlled` (default for Cinnamon 4.6+) and fixed sizes (`8pt`, `10pt`, `12pt`, `14pt`, `16pt`):
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/adapta_fontsize.sh
   ```
2. **Toggle Menu App Description Margin (`scripts/adapta_toggle_menufix.sh`)**
   Toggles a `1.09em` bottom margin on `.menu-selected-app-box` if application descriptions overlap in custom menu layouts:
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/adapta_toggle_menufix.sh
   ```
3. **Fix Firefox Dark Input Fields (`scripts/firefox_fix.sh`)**
   Writes `user_pref("widget.content.gtk-theme-override", "Adwaita");` to `user.js` in your default Firefox profile (`*.default-release` or `*.default`) to prevent unreadable dark-on-dark text inputs on websites that do not style form controls:
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/firefox_fix.sh
   ```

---

### 5. Reloading & Troubleshooting

- **Reload Cinnamon Shell after CSS tweaks**: Press `Alt+F2`, type `r`, and press `Enter` (or run `cinnamon --replace -d :0 > /dev/null 2>&1 &`).
- **GTK4 / libadwaita applications**: Modern `libadwaita` applications enforce their own stylesheet by design; to apply the GTK4 theme to them, you can set `GTK_THEME=Adapta-Nokto-Agy` in your environment if desired.

---

<a id="guide-utilisateur-français"></a>

## 🇫🇷 Guide Utilisateur Français

**Adapta-Nokto-Agy** est un thème sombre personnalisé pour les environnements de bureau Linux, conçu sur mesure pour **Cinnamon** avec une palette d'accents doux (inspirée de Tailwind), un contraste affiné et une légère transparence de fond.
Les thèmes pour Cinnamon, Metacity/Muffin, GTK2, GTK3.22 et GTK4 sont inclus.

### 1. Identité Visuelle & Palette de Couleurs

Trois couleurs d'accentuation douces remplacent le vert sarcelle d'Adapta d'origine, de manière uniforme sur GTK, Metacity et le shell Cinnamon :

| Accent | Normal / Survol | Actif / Pressé | Utilisations |
| --- | --- | --- | --- |
| 🔵 **Bleu ciel** | `#38BDF8` | `#0284C7` | Bouton Réduire, action Verrouiller, fenêtre active du panneau, toggles, sliders & OSD |
| 🟣 **Violet doux** | `#8B5CF6` | `#7C3AED` | Bouton Agrandir / Restaurer, action Déconnexion, onglets, catégories, survol du panneau |
| 🌸 **Rose framboise** | `#EC4899` | `#DB2777` | Bouton Fermer, action Éteindre, actions critiques/destructives, alertes de fenêtres |

- **Surface sombre principale** : `rgba(30, 41, 59, 0.97)` — l'opacité à 97 % garantit une lisibilité optimale du texte tout en conservant une subtile profondeur.
- **Surfaces dérivées** : `rgba(30, 41, 59, 0.85)` (panneau, coins du panneau) et `rgba(30, 41, 59, 0.6)` (surfaces secondaires).

#### Personnalisations Principales
- **Barres de titre et boutons de fenêtres** : Couleurs d'accentuation au survol et au clic sur les boutons CSD (GTK 3.22 / 4.0) et SSD (`metacity-1/*_prelight.svg` & `*_pressed.svg`), avec glyphes vectoriels blancs nets (tiret, carré, croix).
- **Menu Démarrer (`menu@cinnamon.org`)** :
  - Cadre 9-slice dédié (`cinnamon/assets/menu/appmenu.svg`) avec coins arrondis (`9px`) et ombre portée renforcée (`14px`).
  - Photo de profil circulaire (`border-radius: 32px`).
  - Colonne latérale gauche (raccourcis & favoris) ajustée pour éliminer tout défilement vertical invisible.
  - Pastille bleu ciel (`#38BDF8`) derrière les icônes des emplacements (*Places*) garantissant leur visibilité même avec les thèmes d'icônes KDE/WhiteSur qui figent une couleur sombre dans leurs SVG.
  - Boutons système différenciés par couleur : **Verrouiller** (bleu ciel), **Déconnexion** (violet doux), **Éteindre** (rose framboise).
- **Liste des fenêtres du panneau** : La fenêtre active est fortement contrastée avec un fond bleu ciel translucide (`rgba(56, 189, 248, 0.32)`), une bordure de `1px`, un soulignement de `3px` (`#38BDF8`) et un libellé blanc en gras.

---

### 2. Compatibilité & Prérequis

| Composant | Versions supportées | Notes |
| --- | --- | --- |
| **Cinnamon** | `4.4.x` → `6.6.x`+ | Feuille de style du shell dans `cinnamon/` |
| **GTK 3** | `3.22` → `3.24` | Dossier unique `gtk-3.22/` ; GTK 3 est figé à la branche 3.24 |
| **GTK 4** | `4.0`+ | `gtk-4.0/` ; les applications `libadwaita` surchargent l'essentiel du style |
| **GTK 2** | `2.24` | `gtk-2.0/`, requiert les moteurs `murrine` et `pixmap` |
| **Muffin / Metacity** | Format de thème `3` | `metacity-1/metacity-theme-3.xml` |

> [!NOTE]
> Cinnamon 4.4 constitue le plancher car toutes les distributions le livrant embarquent GTK ≥ 3.22. Le dossier obsolète `gtk-3.0/` a été supprimé car GTK 3 résout les thèmes en descendant depuis sa version mineure (`3.24` → `3.22`) et ne consulte jamais `gtk-3.0` sur les systèmes supportés.

**Moteurs GTK2 recommandés (Debian / Ubuntu / Linux Mint) :**
```bash
sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf
```

---

### 3. Installation & Activation

#### Option 1 : Clonage Git (Recommandé)
```bash
mkdir -p ~/.themes
git clone https://github.com/qaqamzmz/Adapta-Nokto-Agy.git ~/.themes/Adapta-Nokto-Agy
```

#### Option 2 : Archive `.tar.gz`
Téléchargez l'archive `Adapta-Nokto-Agy.tar.gz` dans `~/Téléchargements` (ou `~/Downloads`), extrayez-la et copiez le dossier dans `~/.themes` :
```bash
cd ~/Downloads
tar -xzf Adapta-Nokto-Agy.tar.gz
mkdir -p ~/.themes
cp -r Adapta-Nokto-Agy ~/.themes/
```

#### Activer le thème (Interface Graphique)
Ouvrez **Paramètres système → Thèmes** (`cinnamon-settings themes`) et sélectionnez **Adapta-Nokto-Agy** pour :
- **Bordures de fenêtres** (Metacity / Muffin)
- **Contrôles** (GTK2 / GTK3 / GTK4)
- **Bureau** (Cinnamon Shell)

#### Activer le thème (Ligne de commande)
```bash
gsettings set org.cinnamon.theme name "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.interface gtk-theme "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.wm.preferences theme "Adapta-Nokto-Agy"
gsettings set org.gnome.desktop.wm.preferences theme "Adapta-Nokto-Agy"
```

#### Applications graphiques lancées en `root` (`sudo`)
Pour appliquer le thème aux applications administrateur exécutées en `root` :
```bash
sudo mkdir -p /usr/local/share/themes
sudo ln -s ~/.themes/Adapta-Nokto-Agy /usr/local/share/themes/
```

#### Thème d'icônes recommandé
Pour un contraste optimal des icônes symboliques dans le menu d'applications et le panneau, associez **Adapta-Nokto-Agy** à une variante sombre de thème d'icônes (ex. `WhiteSur-dark` ou `Papirus-Dark`) :
```bash
gsettings set org.cinnamon.desktop.interface icon-theme "WhiteSur-dark"
```

---

### 4. Scripts Utilitaires (`scripts/`)

Trois scripts interactifs sont fournis dans le répertoire `scripts/` (à lancer depuis un terminal) :

1. **Ajuster la taille de police du bureau (`scripts/adapta_fontsize.sh`)**
   Permet de régler la taille de police de base du shell Cinnamon entre `System controlled` (géré par le système, recommandé sur Cinnamon 4.6+) et une taille fixe (`8pt`, `10pt`, `12pt`, `14pt`, `16pt`) :
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/adapta_fontsize.sh
   ```
2. **Basculer le correctif d'espacement du menu (`scripts/adapta_toggle_menufix.sh`)**
   Active ou désactive une marge inférieure de `1.09em` sur `.menu-selected-app-box` si les descriptions d'applications sont tronquées :
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/adapta_toggle_menufix.sh
   ```
3. **Corriger les champs de saisie sombres dans Firefox (`scripts/firefox_fix.sh`)**
   Ajoute `user_pref("widget.content.gtk-theme-override", "Adwaita");` au fichier `user.js` de votre profil Firefox par défaut (`*.default-release` ou `*.default`) pour éviter le texte noir sur fond sombre dans les formulaires web non stylés :
   ```bash
   ~/.themes/Adapta-Nokto-Agy/scripts/firefox_fix.sh
   ```

---

### 5. Rechargement & Dépannage

- **Recharger le shell Cinnamon** : Appuyez sur `Alt+F2`, tapez `r` puis `Entrée` (ou exécutez `cinnamon --replace -d :0 > /dev/null 2>&1 &`).
- **Applications GTK4 / libadwaita** : Les applications utilisant `libadwaita` imposent leur propre feuille de style ; vous pouvez forcer le thème via la variable d'environnement `GTK_THEME=Adapta-Nokto-Agy` si nécessaire.

---

## Credits & License / Crédits & Licence

### Credits & Fork Chain
This project is a fork of [slak44/adapta-gtk-theme-cinnamon-spices](https://github.com/slak44/adapta-gtk-theme-cinnamon-spices).

Based on:
- [slak44's fork of Adapta](https://github.com/slak44/adapta-gtk-theme-cinnamon-spices)
- [smurphos' fork of Adapta](https://github.com/smurphos/adapta-gtk-theme-cinnamon-spices/tree/spice-build), `spice-build` branch
- [Tista's original Adapta repo](https://github.com/adapta-project/adapta-gtk-theme), `master` branch
- [senatoreg's fork of Adapta](https://github.com/senatoreg/adapta-gtk-theme/), `master` branch
- Misc fixes committed directly to the Adapta CSS in [cinnamon-spices-themes](https://github.com/linuxmint/cinnamon-spices-themes)

### License / Licence
- This theme is distributed under the terms of the [GPLv2.0 license](COPYING).
- Assets in SVG format are distributed under the terms of the [CC BY-SA 4.0 license](LICENSE_CC_BY_SA4).
- Cinnamon thumbnail includes a depiction of icons from Sam Hewitt's [Paper Icons](https://snwh.org/paper) licensed under CC-SA-4.0.
