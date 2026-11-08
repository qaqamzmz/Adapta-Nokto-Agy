# CLAUDE.md — Adapta-Nokto-Agy

## Nature du projet

Fork personnalisé du thème GTK/Cinnamon **Adapta-Nokto**. Ce dépôt n'est **pas un projet de code** :
c'est un **thème packagé** (feuilles de style CSS/RC + assets PNG/SVG). Il n'y a ni build, ni tests,
ni dépendances, ni CI. On modifie des CSS et des images, on recharge Cinnamon, on regarde.

Chaîne de fork : `tista500/adapta-gtk-theme` → `smurphos` (branche `spice-build`) → `slak44/adapta-gtk-theme-cinnamon-spices` → **Adapta-Nokto-Agy**.

**Cible de compatibilité** (décidée le 28 août 2026) : Cinnamon **4.4 → 6.6+**, GTK3 **3.22–3.24**,
GTK4 **4.0+**, GTK2 **2.24**, format de thème Metacity **3**. Tout support en dessous a été retiré.

- GitHub : `git@github.com:qaqamzmz/Adapta-Nokto-Agy.git` (branche `main`)
- Clé SSH : `~/.ssh/id_ed25519-dev-abourame` (aucune entrée `Host github.com` dans `~/.ssh/config` —
  utiliser `GIT_SSH_COMMAND="ssh -i ~/.ssh/id_ed25519-dev-abourame"` pour push/fetch)
- Auteur git : `qaqamzmz <dev@abourame.com>`
- Installé via symlink : `~/.themes/Adapta-Nokto-Agy -> ~/Documents/themes/Adapta-Nokto-Agy`
  → **toute édition dans ce dépôt est immédiatement live sur le bureau.**

## Structure

| Chemin | Rôle | Édité par le fork |
|---|---|---|
| `cinnamon/cinnamon.css` | Shell Cinnamon (panneau, menu démarrer, OSD, calendrier). ~95 Ko | **Oui, massivement** |
| `cinnamon/assets/` | SVG du shell (menu, switch, panel, checkbox) | Partiellement (opacité) |
| `gtk-3.22/gtk.css`, `gtk-4.0/gtk.css` | Thème GTK, ~500 Ko chacun, **généré depuis SASS upstream** | Oui, ponctuellement (3 règles titlebutton) |
| `gtk-3.22/assets/`, `gtk-4.0/assets/` | 378 PNG chacun (identiques entre les deux) — résolus **relativement au gtk.css** | Oui (288 PNG régénérés) |
| `gtk-2.0/*.rc` | Thème GTK2 (rc files + PNG par dossier) | Non |
| `metacity-1/*.svg` + `metacity-theme-3.xml` | Boutons de fenêtre SSD (Metacity/Muffin) | **Oui** (`*_prelight.svg`) |
| `scripts/` | Helpers hérités d'upstream (taille de police, fix menu, fix Firefox) | Oui (nom du thème) |
| `index.theme`, `info.json` | Métadonnées du thème / de la spice Cinnamon | Oui |

## Palette du fork (source de vérité)

Trois accents "soft" (style Tailwind) remplacent les accents d'origine :

| Rôle | Normal / Hover | Active / Pressed | Usages |
|---|---|---|---|
| 🔵 Bleu ciel | `#38BDF8` | `#0284C7` | Réduire (fenêtre), Verrouiller (menu), app active du panneau, toggles |
| 🟣 Violet doux | `#8B5CF6` | `#7C3AED` | Agrandir/Restaurer, Déconnexion, onglets, catégories, hover panneau |
| 🌸 Rose framboise | `#EC4899` | `#DB2777` | Fermer, Éteindre, actions critiques, erreurs système |
| 🌑 Fond | `rgba(30, 41, 59, 0.97)` | — | Menu démarrer, popups (97 % = lisibilité garantie) |

Variantes de fond dérivées présentes dans `cinnamon.css` : `rgba(30,41,59,0.85)` (panneau, panel-corner),
`rgba(30,41,59,0.6)` (surfaces secondaires).

**Toute nouvelle couleur doit sortir de ce tableau.** Ne pas introduire d'accent ad hoc.

## Où se trouvent les personnalisations

- **Boutons de titre GTK (CSD)** : `gtk-3.22/gtk.css:6620-6661`, `gtk-4.0/gtk.css:6634-6675`
  — sélecteurs `.csd .titlebar .button.titlebutton.{close,minimize,maximize}:hover`.
- **Boutons de titre SSD** : `metacity-1/button_close_prelight.svg`, `button_minimize_prelight.svg`,
  `button_maximize_prelight.svg`, `max_button_unmaximize_prelight.svg` (attribut `fill:` + gradient stops).
- **Boutons système du menu démarrer** : `cinnamon/cinnamon.css:1590-1675`, blocs commentés
  `/* 1. VERROUILLER */`, `/* 2. DÉCONNEXION */`, `/* 3. ARRÊTER */`.
- **App active du panneau** : `cinnamon/cinnamon.css:2133` et `:2349` — fond `rgba(56,189,248,0.32)`,
  bordure 1px `rgba(56,189,248,0.50)`, `box-shadow: inset 0 -3px 0 #38BDF8`, `font-weight: 700`.
  Les quatre variantes (`inset 0 -3px`, `0 3px`, `3px 0`, `-3px 0`) correspondent aux quatre positions
  de panneau (bas/haut/gauche/droite) — **les modifier ensemble**.
- **Fond du menu / transparence** : `cinnamon/cinnamon.css:340`, `475`, `547`, `625`.
- **Icônes des places du menu** (Bureau, Téléchargements…) : bloc `/* 4. PLACES DU MENU */`.
  Pastille d'accent `#38BDF8` **derrière** l'icône (`background-color` + `border-radius: 6px` sur
  `StIcon`), et non un `color:` sur le glyphe — voir le piège « icônes non recolorables » ci-dessous.
  Le glyphe garde la couleur héritée du libellé, donc le contraste tient avec un thème d'icônes
  clair comme sombre. Pastille inchangée au survol, atténuée à 25 % si désactivée.
  Vérifié au pixel : `#38BDF8` sur toutes les lignes, survolées comprises.
- **Cadre du menu démarrer** : `cinnamon/assets/menu/appmenu.svg` + bloc `/* 5. MENU DÉMARRER */`.
  Asset **dédié** (les autres popups gardent `menu.svg` et ses tranches de 9). Coins passés de
  ~1,9 px à 10 px, ombre de 6 px/pic 10 à 14 px/pic 17 (mesuré par différence avec le fond
  d'écran). Ciblé par `.appmenu-background`, classe posée par le seul menu démarrer via
  `setCustomStyleClass()`.
- **Photo de profil ronde** : bloc `/* 6. PHOTO DE PROFIL RONDE */`, `border-radius: 32px` sur
  `.appmenu-sidebar-user-box .user-icon` (l'avatar y mesure 64 px).
- **Sidebar sans défilement** : bloc `/* 7. SIDEBAR SANS DÉFILEMENT */`. Padding vertical retiré de
  `.appmenu-places-box` et `.appmenu-favs-box` : la colonne demandait 298 px pour 277 px
  disponibles, elle tient maintenant en 270 px.
- **Opacité des icônes de catégorie grisées** : bloc `/* 8. OPACITÉ DES ICÔNES... */`.
  `menu@cinnamon.org` **lit** cette propriété au lieu de laisser le CSS s'appliquer
  (`_setCategoriesButtonActive`) : `icon.get_theme_node().get_double('opacity')`, puis
  `set_opacity(valeur * 255)`. Sans déclaration, St émettait
  `Did not find double property 'opacity'` (une par catégorie et par cycle de grisage, 262 au
  total) et le garde `if (icon_opacity)` laissait les icônes à pleine intensité pendant une
  recherche. La valeur attendue est une **fraction 0..1**. Réglée à `0.3`, pour coller au libellé
  grisé qui est à 0.28. Vérifié : 0 alerte, `get_double` → `0.3`, opacité appliquée 76.
- **Texte au survol dans la liste d'applications** : `.appmenu-application-button-selected`
  → `color: #7DD3FC` (bleu ciel clair) au lieu du blanc. Grammaire retenue pour tout le menu :
  **fond d'accent translucide + texte de la même famille en plus clair** — colonne applications en
  bleu (`#7DD3FC` sur fond `rgba(56,189,248,0.20)`), catégories et places en violet (`#C4B5FD` sur
  fond `rgba(139,92,246,0.22)`).

## Support de versions : comment le déterminer

**La version de GTK n'est pas un choix, elle est imposée par les distributions** qui livrent les
versions de Cinnamon visées. Cinnamon est une application GTK3 ; GTK3 est donc le plancher.

Méthode : pour chaque version de Cinnamon supportée, regarder le GTK de la distribution
correspondante, et prendre le minimum.

```bash
# sur une machine cible
cinnamon --version
dpkg -l | grep -E 'libgtk-3-0|libgtk-4-1|libgtk2\.0-0'   # Debian/Ubuntu/Mint
pkg-config --modversion gtk+-3.0 gtk4                     # si les -dev sont installes
```

Ce qui rend la réponse définitive pour GTK3 : **GTK3 est figé à 3.24**, il n'y aura pas de 3.26.
Et GTK résout un thème en parcourant `gtk-3.<minor>` en descendant de son propre minor par pas
de 2 jusqu'à 0. Vérifié par `strace` sur GTK 3.24.41 :

```
openat("…/Adapta-Nokto-Agy/gtk-3.22/gtk.css") = 10      # trouvé, la recherche s'arrête
```

Donc un **unique `gtk-3.22/`** couvre 3.22 et 3.24, soit tout le parc supporté ; `gtk-3.0/` n'est
lu que par GTK < 3.22 (vérifié : en l'absence de `gtk-3.22/`, GTK se rabat bien sur `gtk-3.0/`).

Axes indépendants de Cinnamon :
- **GTK4** — Cinnamon lui-même est GTK3 ; `gtk-4.0/` ne sert qu'aux applications GTK4. Vérifié :
  GTK 4.14 ouvre bien `gtk-4.0/gtk.css` et le parse **sans erreur**. Mais le fichier est à ~89 %
  identique au stylesheet GTK3 : zéro sélecteur GTK4 natif (`columnview`, `gridview`, `listview`,
  `dropdown`, `avatar`, `windowcontrols`) et des tonnes de structures GTK3 mortes en GTK4
  (`.titlebar` ×344, `menuitem` ×166). Les applications libadwaita écrasent en outre l'essentiel
  avec leur propre stylesheet. → fonctionnel mais partiel ; ne pas y investir sans besoin réel.
- **GTK2** — non lié à Cinnamon. Conservé : `libgtk2.0-0t64` est installé sur la cible avec les
  deux moteurs requis par le thème (`murrine`, `pixmap`).

## Ce qui a été retiré (28 août 2026)

| Supprimé | Poids | Preuve |
|---|---|---|
| `gtk-3.0/` | 2,0 Mo | `strace` : jamais ouvert par GTK ≥ 3.22 |
| `assets/` (racine) | 1,6 Mo | Les `url()` sont résolus **relativement au gtk.css** → seuls `gtk-*/assets/` sont lus. Aucune référence dans `metacity-1/`, `gtk-2.0/`, `index.theme`, `info.json`. `strace` confirme : seul `gtk-3.22/assets/` est ouvert |
| `cinnamon/assets/thumbnail.png` | 36 Ko | Doublon de `cinnamon/thumbnail.png` (même md5), non référencé |
| `metacity-1/metacity-theme-2.xml` | 72 Ko | Muffin préfère le format 3 ; Mint-Y (thème par défaut de Cinnamon 6.6) ne livre que le `-3.xml` |
| `cinnamon/cinnamon.css.map` | 16 Ko | Pointait sur un dossier `sass/` absent du dépôt |

Total : 9,6 Mo → 6,0 Mo (761 fichiers). Revalidé après suppression : GTK3 et GTK4 chargent leur
CSS, zéro `ENOENT` sur les assets, zéro erreur de parsing, thème WM et thème Cinnamon rechargés
sans alerte.

**Volontairement conservé** : les blocs `version="< 3.1"` de `metacity-theme-3.xml` (2 occurrences).
Ils ciblent un format Metacity ancien et sont inertes sur Muffin ≥ 4.4, mais les thèmes livrés par
Mint les portent encore, ils pèsent quelques lignes, et éditer ce XML à la main est plus risqué que
le gain. À noter : `metacity-theme-3.xml` **n'est pas du XML strict** (`version="< 3.1"` contient un
`<` brut dans un attribut) — un parseur XML standard le rejette, GMarkup l'accepte. Ne pas
« corriger » ce faux positif.

## Pièges connus

1. **CSS Clutter/St ≠ CSS web.** `cinnamon.css` est lu par Clutter St, qui ne gère qu'un sous-ensemble :
   pas de pseudo-sélecteurs complexes, pas de `calc()`, propriétés propriétaires
   (`-panel-corner-background-color`, `-natural-hpadding`…). Une règle invalide est silencieusement
   ignorée — pas d'erreur, juste un style qui ne s'applique pas. Vérifier visuellement, toujours.
2. **Les `gtk.css` sont des artefacts générés** depuis le SASS upstream (~500 Ko, une règle par ligne).
   Les éditions du fork y sont chirurgicales et **seraient écrasées par une resynchronisation upstream**.
   Documenter tout patch appliqué à ces fichiers.
3. **Le thème parent `Adapta-Nokto` est installé à côté** dans `~/.themes/`. Les scripts de
   `scripts/` pointent désormais sur `THEMENAME="Adapta-Nokto-Agy"` (corrigé), et leur garde
   `grep -q "$THEMENAME" cinnamon.css` s'appuie sur le marqueur `/* Adapta-Nokto-Agy */` en
   `cinnamon/cinnamon.css:11` — **ne pas supprimer ce commentaire**, il casserait les scripts.
4. **Les PNG d'`assets/` ont des variantes** : `-dark`, `-active`, `-hover`, `-insensitive`, `-backdrop`,
   `-ssd`, `-eta`, `-selectionmode`, `@2` (HiDPI). Régénérer une icône implique **toute sa famille**,
   sinon incohérences d'état. La génération d'origine s'est faite en Python + Cairo (script non versionné).
5. **Icônes non recolorables par CSS.** Beaucoup de thèmes d'icônes (WhiteSur, Breeze et dérivés
   KDE) écrivent leurs SVG ainsi :

   ```xml
   <style id="current-color-scheme">.ColorScheme-Text { color:#363636; }</style>
   <path class="ColorScheme-Text" … fill="currentColor"/>
   ```

   `currentColor` est donc résolu par le SVG **lui-même**. C'est la convention KDE : l'application
   est censée réécrire ce bloc `<style>` ; KDE le fait, GTK/St non. Résultat : le glyphe est figé
   (`#363636`, quasi noir sur notre fond `#212E3D`) et **aucun `color:` CSS ne l'atteint**, même
   avec `icon_type = SYMBOLIC`. Ne pas perdre de temps à ajuster `color` sur ces icônes : soit
   passer par un fond (`background-color` sur `StIcon`, cf. les places), soit changer de thème
   d'icônes. Sur cette machine, `WhiteSur-dark` existe et utilise `color:#dedede` — c'est la
   correction de fond côté système (`gsettings set org.cinnamon.desktop.interface icon-theme
   "WhiteSur-dark"`), hors périmètre de ce dépôt.

6. **Survol : deux mécanismes différents dans le même applet.** Dans `menu@cinnamon.org`
   (`_buttonEnterEvent`, ~ligne 1856) :
   - `PlaceButton`, `FavoritesButton`, `SystemButton` → `add_style_pseudo_class("hover")`, la classe
     est **conservée** → cibler `.appmenu-sidebar-button:hover`, et une règle de base sur
     `.appmenu-sidebar-button` continue de s'appliquer.
   - Boutons d'application → `set_style_class_name("appmenu-application-button-selected")`, la classe
     est **remplacée** → cibler `.appmenu-application-button-selected`, et une règle de base sur
     `.appmenu-application-button` **cesse** de s'appliquer.

   Se tromper de mécanisme donne une règle qui ne se déclenche jamais. Pour simuler fidèlement en
   introspection, utiliser la même méthode que l'applet, pas l'autre.

7. **`border-image` : contraintes de géométrie, et `box-shadow` inopérant.** Le cadre des menus
   (coins arrondis *et* ombre) vient d'un `border-image` 9-slice, pas de `border-radius` /
   `box-shadow`. Quatre règles apprises à la mesure :
   - **`box-shadow` est ignoré par St dès qu'un `border-image` est présent.** Vérifié : passer à
     `0 30px 40px rgba(0,0,0,0.95)` ne change pas un pixel. L'ombre doit vivre dans l'asset.
   - **St clippe le `border-image` à l'allocation** : le budget d'ombre est exactement l'encart du
     corps dans le SVG. Pour une ombre plus large, il faut un encart plus large — et un `padding`
     compensatoire sur l'acteur, sinon le contenu mord sur l'arrondi.
   - **Le rayon doit tenir dans la tranche d'angle** (`rayon ≤ tranche − encart`), sinon l'arc est
     étiré par la zone de bord. C'est ce qui impose d'agrandir le canevas quand on veut des coins
     plus ronds.
   - **Le rect d'ombre doit être plus grand que le corps** et décalé : superposé, il reste caché
     derrière et seule la frange du flou dépasse (première tentative : ombre pas plus forte
     qu'avant malgré une opacité doublée).

8. **GdkPixbuf sniffe le début des SVG.** Un commentaire XML placé avant la balise `<svg>` la
   repousse hors de la fenêtre de détection et le fichier est rejeté :
   `St-WARNING: Failed to load …: Format d'image non reconnu` — alors que le XML est parfaitement
   valide. Garder `<svg>` en tête et mettre les commentaires **à l'intérieur**. Test local sans
   recharger Cinnamon :

   ```bash
   python3 -c "import gi; gi.require_version('GdkPixbuf','2.0')
   from gi.repository import GdkPixbuf
   print(GdkPixbuf.Pixbuf.new_from_file('cinnamon/assets/menu/appmenu.svg').get_width())"
   ```

9. **Mesurer une ombre : par différence, jamais à l'œil.** Le fond d'écran n'est pas uni — comparer
   des valeurs absolues d'un endroit à l'autre mène à des conclusions fausses (j'ai « mesuré » une
   ombre de 16 px qui n'existait pas). Capturer une fois menu fermé, une fois menu ouvert, et
   soustraire colonne par colonne. Même prudence pour les couleurs : une pastille identique paraît
   plus pâle entourée de violet (contraste simultané).

10. **Pas de source map.** `cinnamon/cinnamon.css.map` a été supprimé : il pointait sur un dossier
   `sass/` absent du dépôt et ne reflétait plus le CSS édité à la main. Il reste deux références
   pendantes `sourceMappingURL=gtk-contained-dark.css.map` en `gtk-3.22/gtk.css:13011` et
   `gtk-4.0/gtk.css:12801` — inoffensives, héritées d'upstream, laissées en place pour ne pas
   toucher aux fichiers générés.
11. **Propriétés CSS lues par le JS, pas appliquées par St.** Certaines déclarations du thème ne
    sont pas interprétées par St mais **lues par du JavaScript** qui les applique lui-même. Le cas
    connu : `opacity` sur `.appmenu-category-button-greyed StIcon`, lu par `menu@cinnamon.org`.
    Conséquence : une propriété absente n'est pas seulement du bruit de log, c'est une
    **fonctionnalité manquante**. St n'avertit que pour deux types — `get_double` et `get_color`
    (`strings libst.so | grep "Did not find"`) ; `get_length` échoue **en silence**. Les quatre
    propriétés custom que Cinnamon lit par `get_length` (`-arrow-rise`, `-slider-handle-radius`,
    `-cinnamon-close-overlap`, `margin-from-right-edge-of-screen`) sont bien définies ici — vérifié.
    Pour trouver ce genre de dépendance :
    `grep -rn "get_theme_node()\.get_double\|get_theme_node()\.get_color" /usr/share/cinnamon/`

12. **`PROJECT_MEMORY.md`** est gitignoré volontairement (contient des chemins et détails locaux).
   C'est la mémoire longue historique du projet — la lire, mais ne pas la committer.

## Workflow de vérification

Il n'y a pas de test automatisé. Après modification :

```bash
# Recharger le shell Cinnamon (perd les positions de fenêtres, pas les sessions)
cinnamon --replace -d :0 > /dev/null 2>&1 &
# ou Alt+F2 puis "r"

# Réappliquer le thème pour forcer le rechargement des CSS GTK
gsettings set org.cinnamon.theme name "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.interface gtk-theme "Adapta-Nokto-Agy"
gsettings set org.cinnamon.desktop.wm.preferences theme "Adapta-Nokto-Agy"
gsettings set org.gnome.desktop.wm.preferences theme "Adapta-Nokto-Agy"

# Journal d'erreurs de Cinnamon (les CSS invalides n'y apparaissent pas toujours)
journalctl --user -f -n 50 | grep -i cinnamon
```

## Vérifier un style St sans deviner (introspection Cinnamon)

Cinnamon expose `org.Cinnamon.Eval` sur DBus : on peut lire la **couleur réellement calculée** par St
sur n'importe quel acteur, au lieu de juger à l'œil. Indispensable ici, puisqu'une règle non
supportée est silencieusement ignorée.

```bash
ev() { gdbus call --session --dest org.Cinnamon --object-path /org/Cinnamon \
        --method org.Cinnamon.Eval "$1" 2>&1 | sed 's/(true, .//;s/.)$//'; }

# l'applet menu : definitions[i].applet (appletObj est vide en 6.6)
ev 'var D=imports.ui.appletManager.definitions; var r=[];
    for (var i=0;i<D.length;i++) if(D[i]&&D[i].uuid) r.push(i+":"+D[i].uuid); r.join(" ")'

# lire la couleur d'une icône de place
ev 'imports.ui.appletManager.definitions[0].applet.menu.open(); "ok"'
ev 'function hx(c){return "#"+[c.red,c.green,c.blue].map(function(v){return ("0"+v.toString(16)).slice(-2).toUpperCase();}).join("");}
    var b=imports.ui.appletManager.definitions[0].applet.placesBox.get_children()[0];
    var o=[]; (function w(a){var n=a.constructor.name;
      if(n=="St_Icon") o.push("ico="+hx(a.get_theme_node().get_foreground_color()));
      if(n=="St_Label") o.push("lbl="+hx(a.get_theme_node().get_foreground_color()));
      if(a.get_children) a.get_children().forEach(w);})(b); o.join(" ")'
```

**PIÈGE MAJEUR, qui m'a eu trois fois : il faut que le menu soit OUVERT.** St ne recalcule les nœuds de style que sur les
acteurs affichés ; menu fermé, `get_theme_node()` renvoie un **cache périmé** et fait croire que la
règle ne s'applique pas. Ce piège a fait diagnostiquer à tort « `StIcon` non supporté par St » —
alors que les sélecteurs de type et les descendants de classe fonctionnent parfaitement. Il a
aussi fait croire que le correctif `opacity` ne marchait pas (0.3 lu comme 0), et que la couleur
héritée d'un bouton grisé ne descendait pas jusqu'à son icône. À chaque doute : rouvrir le menu
avant de conclure.

Deux autres détails d'introspection en 6.6 : les noms de types côté GJS portent un underscore
(`St_Icon`, `St_Label`) alors que le **CSS** s'écrit sans (`StIcon`, `StLabel`) ; et
`appletManager.appletObj` est vide — passer par `appletManager.definitions[i].applet`.

Pour forcer un état sans souris :
`ch[1].set_style_class_name("appmenu-sidebar-button-selected")`, mesurer, puis remettre
`"appmenu-sidebar-button"`.

## SonarQube

Instance locale : `https://localhost:8443/dashboard?id=Adapta-Nokto-Agy` (certificat auto-signé → `curl -k`).

État : **Quality Gate OK**, mais 26 000 « bugs » et 1 566 code smells sur 26 778 ncloc.
**Ce sont des faux positifs quasi intégraux** : l'analyseur CSS de Sonar juge du CSS web, alors que le
projet contient du CSS GTK et du CSS Clutter/St.

| Règle | Nb | Verdict |
|---|---|---|
| `css:S4670` Selectors should be known | 21 291 | Faux positif — widgets GTK/St (`StButton`, `.csd`, `headerbar`) |
| `css:S4659` Pseudo-class selectors should be valid | 4 298 | Faux positif — `:backdrop`, `:selected`, `:insensitive` |
| `css:S1874` Deprecated CSS features | 911 | Faux positif — syntaxe GTK legacy volontaire |
| `css:S4666` Selectors should not be duplicated | 457 | Bruit — sortie du générateur SASS |
| `css:S4654` CSS properties should be valid | 257 | Faux positif — propriétés propriétaires GTK/St |
| `css:S7924` Contraste texte/fond insuffisant | 197 | **Seule catégorie à examiner** — accessibilité réelle |

Répartition au moment de l'analyse : `gtk-3.22/gtk.css` 10 645, `gtk-4.0/gtk.css` 10 638,
`gtk-3.0/gtk.css` 5 626, `cinnamon/cinnamon.css` 657. **`gtk-3.0/` ayant été supprimé, une
nouvelle analyse doit tomber à ~21 900 issues** — la baisse ne traduira aucune correction.

**Conséquence pratique** : ne pas « corriger les bugs Sonar ». Les seuls signaux exploitables sont
`css:S7924` (contraste) sur `cinnamon/cinnamon.css`, et éventuellement `css:S4666` sur les portions
écrites à la main. Il n'y a pas de `sonar-project.properties` — à ajouter avec des exclusions
(`gtk-2.0/**`, `gtk-3.22/**`, `gtk-4.0/**`) si l'analyse doit redevenir utile — il ne resterait
alors que `cinnamon/cinnamon.css`, le seul fichier écrit à la main.

Requêtes API :

```bash
SQ="<your-sonar-token>"   # token analyst global
curl -sk -u "$SQ:" "https://localhost:8443/api/measures/component?component=Adapta-Nokto-Agy&metricKeys=bugs,code_smells,ncloc"
curl -sk -u "$SQ:" "https://localhost:8443/api/issues/search?componentKeys=Adapta-Nokto-Agy&rules=css:S7924&ps=50"
```

## Conventions

- **Langue** : `CLAUDE.md` et les commentaires de `cinnamon.css` en français ; `README.md` et
  `info.json` en anglais (destinés au dépôt public / cinnamon-spices). Le tableau de palette du
  `README.md` doit rester synchronisé avec celui de ce fichier.
- **Commits** : format Conventional Commits (`feat:`, `docs:`) — cf. historique.
- **Ne pas committer** de chemins absolus `/home/romain`, de tokens, de noms de machine dans les fichiers
  suivis. Le commit `ccc6277` a précisément servi à assainir le dépôt sur ce point.
- **Portée** : ce dépôt contient le thème. L'applet `control-center@romain` vit ailleurs
  (`~/.local/share/cinnamon/applets/control-center@romain/`) et n'est **pas** versionnée ici.
