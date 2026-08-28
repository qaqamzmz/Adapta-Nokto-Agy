# Mémoire du Projet : Adapta-Nokto-Agy & Centre de Contrôle Cinnamon

Ce document constitue la mémoire persistante et la documentation complète des modifications apportées au système, au thème et à l'environnement de bureau Cinnamon.

---

## 1. Identité et Thème : Adapta-Nokto-Agy

* **Nom du thème** : `Adapta-Nokto-Agy`
* **Emplacement** : `/home/romain/Documents/themes/Adapta-Nokto-Agy` (et symlink `~/.themes/Adapta-Nokto-Agy`)
* **Base du fork** : Adapta-Nokto (GTK2, GTK3, GTK4, Metacity, Cinnamon).

### Palette de Couleurs Soft :
* 🔵 **Couleur 1 (Bleu Ciel)** :
  * Hover / Normal : `#38BDF8` (RGB: `56, 189, 248`)
  * Active / Pressed : `#0284C7` (RGB: `2, 132, 199`)
  * Usage : Bouton Réduire (fenêtres), Bouton Verrouiller (menu démarrer), Application active (barre des tâches), Toggles actifs.
* 🟣 **Couleur 2 (Violet Doux)** :
  * Hover / Normal : `#8B5CF6` (RGB: `139, 92, 246`)
  * Active / Pressed : `#7C3AED` (RGB: `124, 58, 237`)
  * Usage : Bouton Agrandir / Restaurer (fenêtres), Bouton Déconnexion (menu démarrer), Onglets, Catégories.
* 🌸 **Couleur 3 (Rose Framboise Doux)** :
  * Hover / Normal : `#EC4899` (RGB: `236, 72, 153`)
  * Active / Pressed : `#DB2777` (RGB: `219, 39, 119`)
  * Usage : Bouton Fermer (fenêtres), Bouton Éteindre / Arrêter (menu démarrer & header), Actions critiques, Cartes d'erreurs système.
* 🌑 **Fond & Transparence** :
  * Ardoise sombre / Slate Navy : `rgba(30, 41, 59, 0.97)`
  * Opacité réglée à **97%** pour assurer une lisibilité parfaite du texte sans distraction de l'arrière-plan.

---

## 2. Modifications Réalisées sur le Thème

### A. Boutons de fenêtres (CSD, SSD & Metacity)
* **288 fichiers PNG générés** avec Python Cairo dans `assets/`, `gtk-3.0/assets/`, `gtk-3.22/assets/`, `gtk-4.0/assets/` (icônes vectorielles blanches nettes : tiret, carré, croix).
* **Fichiers SVG Metacity** mis à jour dans `metacity-1/` (`button_close_prelight.svg`, `button_minimize_prelight.svg`, `button_maximize_prelight.svg`, etc.).
* Configuration gsettings activée pour les bordures de fenêtres (`org.cinnamon.desktop.wm.preferences theme` et `org.gnome.desktop.wm.preferences theme`).

### B. Barre des tâches (Panneau Cinnamon)
* **Application active fortement contrastée** :
  * Fond en surbrillance bleu ciel (`rgba(56, 189, 248, 0.32)`),
  * Bordure nette de 1px (`rgba(56, 189, 248, 0.50)`),
  * Ligne d'accentuation inférieure de 3px (`box-shadow: inset 0 -3px 0 #38BDF8`),
  * Texte blanc pur et en gras (`font-weight: 700`).
* **Applications en arrière-plan** : Fond translucide discret avec fine démarcation blanche/grise.
* **Survol des applications** : Surbrillance violette (`#8B5CF6`).

### C. Menu Démarrer
* **Transparence optimisée** : Opacité à 97% (`rgba(30, 41, 59, 0.97)` et assets SVG mis à jour).
* **Boutons système (Bas gauche)** :
  * 🔒 **Verrouiller** : Bleu ciel (`#38BDF8`),
  * 🚪 **Déconnexion** : Violet doux (`#8B5CF6`),
  * ⏻ **Arrêter** : Rose framboise (`#EC4899`),
  * Centrage parfait des icônes grâce à un `padding: 8px` et suppression des pseudo-sélecteurs incompatibles Clutter St CSS.

---

## 3. Applet : Centre de Contrôle & Horloge (`control-center@romain`)

* **Emplacement** : `/home/romain/.local/share/cinnamon/applets/control-center@romain/`
* **Intégration** : Active sur la barre des tâches à la place de l'horloge (`panel1:right:10:control-center@romain:13`).

### Fonctionnalités Complètes :
1. **En-tête supérieur (Header)** :
   * Date longue en français (ex : *Mercredi 26 août 2026*).
   * ⚙️ Raccourci vers les Paramètres Système (`cinnamon-settings`).
   * 🔒 Verrouillage immédiat de session (`cinnamon-screensaver-command --lock`).
   * ⏻ Arrêt / Extinction de session (`cinnamon-session-quit --power-off`).
2. **Quick Toggles (Grille 2x2 symétrique)** :
   * 📶 **Wi-Fi** : Détection active via `nmcli connection show --active` avec affichage du SSID connecté et mise en surbrillance.
   * ᛒ **Bluetooth** : Détection via `rfkill` + `bluetoothctl`.
   * 🌙 **Mode Nuit** : Filtre anti-lumière bleue (`org.cinnamon.settings-daemon.plugins.color`).
   * 🔕 **Ne pas déranger** : Masquage des notifications (`org.cinnamon.desktop.notifications`).
3. **⚡ Modes d'Alimentation (Power Modes)** :
   * Sélecteur 3 profils : 🍃 **Éco**, ⚖️ **Équilibré**, 🚀 **Performance** via `powerprofilesctl`.
4. **🔊 Curseur de Volume Audio Principal** :
   * Slider interactif 0-100% relié à `pactl` avec bouton mute/démute et indicateur en pourcentage.
5. **🔆 Curseur de Luminosité de l'Écran (Display Brightness)** :
   * Slider interactif 15-100% avec détection automatique de l'écran principal (`xrandr`) et support rétroéclairage matériel (`org.cinnamon.SettingsDaemon.Power.Screen`).
6. **Système de 3 Onglets (Tabs)** :
   * 📅 **Agenda & Calendrier** : Initialisation automatique et instantanée dès l'ouverture du menu (`_refreshCalendar`), vue mois interactive, événements du jour et ouverture directe de GNOME Calendrier.
   * 🔔 **Notifications** : Historique des alertes reçues avec bouton « Effacer ».
   * ⚠️ **Erreurs Système (Dédoublonnage unique)** : Analyse les 500 dernières entrées du journal système (`journalctl -p 0..3 -n 500`), filtre les doublons (en supprimant les PIDs dynamiques) et affiche exactement les **15 dernières erreurs uniques et distinctes**, de la plus récente à la plus ancienne.

---
*Dernière mise à jour : 26 Août 2026*
