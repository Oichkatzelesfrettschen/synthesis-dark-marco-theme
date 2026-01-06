# Installation Guide

## Quick Start

For most users:

```bash
git clone https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
make build
sudo make install
```

## Table of Contents

1. [System Requirements](#system-requirements)
2. [Installation Methods](#installation-methods)
3. [Desktop Environment Setup](#desktop-environment-setup)
4. [Troubleshooting](#troubleshooting)
5. [Uninstallation](#uninstallation)

## System Requirements

### Essential
- Linux-based operating system
- One of:
  - GTK2 applications (requires `gtk2`)
  - GTK3/GTK4 applications (requires `gtk3`)
  - Qt applications (requires `kvantum`)
  - Marco/Metacity window manager

### Build Dependencies
- `meson` (≥0.56.0)
- `ninja` or `ninja-build`

### Recommended
- `gtk-engine-murrine` - For optimal GTK2 rendering
- `xmllint` (libxml2-utils) - For validation

## Installation Methods

### Method 1: Arch Linux (AUR)

**For Arch Linux and derivatives (Manjaro, EndeavourOS, CachyOS, etc.)**

Using your preferred AUR helper:

```bash
yay -S synthesis-dark-marco-theme
```

Or manually:

```bash
git clone https://aur.archlinux.org/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
makepkg -si
```

### Method 2: From Source (All Distributions)

**Step 1: Install build dependencies**

**Arch/Manjaro:**
```bash
sudo pacman -S meson ninja gtk2 gtk3
```

**Ubuntu/Debian:**
```bash
sudo apt install meson ninja-build libgtk-3-dev libgtk2.0-dev
```

**Fedora/RHEL:**
```bash
sudo dnf install meson ninja-build gtk3-devel gtk2-devel
```

**openSUSE:**
```bash
sudo zypper install meson ninja gtk3-devel gtk2-devel
```

**Step 2: Clone and build**

```bash
git clone https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
make build
```

**Step 3: Install system-wide**

```bash
sudo make install
```

**Or install for current user only:**

```bash
make dev-install
```

### Method 3: Manual Installation (No Build System)

For minimal systems without Meson:

```bash
# System-wide installation
sudo mkdir -p /usr/share/themes/Synthesis-Dark-Marco
sudo cp -r Synthesis-Dark-Marco/* /usr/share/themes/Synthesis-Dark-Marco/

# User installation
mkdir -p ~/.themes/Synthesis-Dark-Marco
cp -r Synthesis-Dark-Marco/* ~/.themes/Synthesis-Dark-Marco/

# Kvantum (Qt) theme
mkdir -p ~/.config/Kvantum/SynthesisDark
cp Synthesis-Dark-Marco/Kvantum/SynthesisDark/* ~/.config/Kvantum/SynthesisDark/
```

### Method 4: Custom Installation Prefix

To install to a custom location:

```bash
make build PREFIX=/usr/local
sudo make install PREFIX=/usr/local
```

Or with Meson directly:

```bash
meson setup builddir --prefix=/opt/themes
meson install -C builddir
```

## Desktop Environment Setup

### MATE Desktop

**Window Manager Theme:**
```bash
gsettings set org.mate.Marco.general theme 'Synthesis-Dark-Marco'

# Enable compositor for best visual effects
gsettings set org.mate.Marco.general compositing-manager true
```

**GTK Theme:**
```bash
gsettings set org.mate.interface gtk-theme 'Synthesis-Dark-Marco'
```

**Or via GUI:**
1. Open "Appearance Preferences"
2. Go to "Theme" tab
3. Select "Synthesis-Dark-Marco"
4. Open "Marco Theme Preferences"
5. Select "Synthesis-Dark-Marco"

### GNOME (GTK Theme Only)

**Via Settings:**
1. Install GNOME Tweaks: `sudo apt install gnome-tweaks`
2. Open "Tweaks"
3. Go to "Appearance"
4. Select "Synthesis-Dark-Marco" under "Applications"

**Via gsettings:**
```bash
gsettings set org.gnome.desktop.interface gtk-theme 'Synthesis-Dark-Marco'
```

**Note**: GNOME Shell decorations require a separate Shell theme.

### XFCE

**Via Settings Manager:**
1. Open "Appearance" settings
2. Select "Synthesis-Dark-Marco" under "Style"
3. Open "Window Manager" settings
4. Select "Synthesis-Dark-Marco" if available

**Via xfconf:**
```bash
xfconf-query -c xsettings -p /Net/ThemeName -s "Synthesis-Dark-Marco"
```

**Note**: XFCE uses XFWM4 for window decorations (not Metacity).

### KDE Plasma (Qt Applications)

**Kvantum Setup:**

1. Install Kvantum:
   ```bash
   # Arch
   sudo pacman -S kvantum
   
   # Ubuntu/Debian
   sudo apt install qt5-style-kvantum
   
   # Fedora
   sudo dnf install kvantum
   ```

2. Launch Kvantum Manager:
   ```bash
   kvantummanager
   ```

3. Select "SynthesisDark" from the list
4. Click "Use this theme"

**Apply to GTK Apps in KDE:**

```bash
# Set GTK2 theme
echo 'gtk-theme-name="Synthesis-Dark-Marco"' >> ~/.gtkrc-2.0

# Set GTK3 theme
mkdir -p ~/.config/gtk-3.0
echo '[Settings]' > ~/.config/gtk-3.0/settings.ini
echo 'gtk-theme-name=Synthesis-Dark-Marco' >> ~/.config/gtk-3.0/settings.ini
```

### Cinnamon

**Via System Settings:**
1. Open "System Settings"
2. Go to "Themes"
3. Select "Synthesis-Dark-Marco" for:
   - Controls (GTK theme)
   - Window borders (if available)

**Via dconf:**
```bash
gsettings set org.cinnamon.desktop.interface gtk-theme 'Synthesis-Dark-Marco'
gsettings set org.cinnamon.desktop.wm.preferences theme 'Synthesis-Dark-Marco'
```

### Budgie

**Via Budgie Settings:**
1. Open "Budgie Desktop Settings"
2. Go to "Style"
3. Select "Synthesis-Dark-Marco" for:
   - Widget theme
   - Window theme (if using Metacity)

## Component-Specific Setup

### GTK2 Applications

Ensure the Murrine engine is installed for best results:

```bash
# Arch
sudo pacman -S gtk-engine-murrine

# Ubuntu/Debian
sudo apt install gtk2-engines-murrine

# Fedora
sudo dnf install gtk-murrine-engine
```

Verify theme is loaded:
```bash
gtk-query-settings gtk-theme-name
```

### GTK3/GTK4 Applications

Test with a GTK3 app:
```bash
GTK_THEME=Synthesis-Dark-Marco gtk3-demo
```

### Qt/KDE Applications

Test with Kvantum preview:
```bash
kvantumpreview
```

### Marco Window Manager

Verify theme is loaded:
```bash
marco --replace &
gsettings get org.mate.Marco.general theme
```

## Advanced Configuration

### Build Options

Build with specific components:

```bash
# GTK3 only
meson setup builddir -Dgtk2=disabled -Dkvantum=disabled

# Kvantum only
meson setup builddir -Dgtk2=disabled -Dgtk3=disabled

# All components (default)
meson setup builddir
```

### Custom Color Modifications

To customize colors:

1. **GTK3**: Edit `~/.themes/Synthesis-Dark-Marco/gtk-3.0/gtk.css`
2. **GTK2**: Edit `~/.themes/Synthesis-Dark-Marco/gtk-2.0/gtkrc`
3. **Kvantum**: Edit `~/.config/Kvantum/SynthesisDark/SynthesisDark.kvconfig`

Example: Change accent color from teal to purple:

```css
/* gtk-3.0/gtk.css */
@define-color theme_selected_bg_color #cba6f7;  /* Was #17b169 */
```

### Application-Specific Overrides

For specific apps, create `~/.config/gtk-3.0/gtk.css`:

```css
/* Override for specific application */
.firefox {
    background-color: #1e1e2e;
}
```

## Validation

Verify installation:

```bash
# Check theme files exist
ls ~/.themes/Synthesis-Dark-Marco/
ls /usr/share/themes/Synthesis-Dark-Marco/

# Validate XML
xmllint --noout ~/.themes/Synthesis-Dark-Marco/metacity-1/metacity-theme-3.xml

# Test GTK theme
GTK_THEME=Synthesis-Dark-Marco gtk3-widget-factory
```

## Troubleshooting

### Theme Not Appearing in List

**Problem**: Theme doesn't show up in theme selector.

**Solutions**:
1. Verify installation path:
   ```bash
   ls ~/.themes/Synthesis-Dark-Marco/index.theme
   ls /usr/share/themes/Synthesis-Dark-Marco/index.theme
   ```

2. Check file permissions:
   ```bash
   chmod -R 755 ~/.themes/Synthesis-Dark-Marco
   ```

3. Restart your session or reload theme cache:
   ```bash
   # GTK
   gtk-update-icon-cache -f ~/.themes/Synthesis-Dark-Marco/
   
   # MATE
   mate-session-save --logout
   ```

### GTK2 Applications Look Wrong

**Problem**: GTK2 apps have incorrect colors or styling.

**Solutions**:
1. Install Murrine engine:
   ```bash
   sudo pacman -S gtk-engine-murrine  # Arch
   sudo apt install gtk2-engines-murrine  # Ubuntu
   ```

2. Verify GTK2 theme is set:
   ```bash
   cat ~/.gtkrc-2.0
   # Should contain: gtk-theme-name="Synthesis-Dark-Marco"
   ```

3. Force reload:
   ```bash
   killall gtk-theme-switch
   ```

### Kvantum Theme Not Working

**Problem**: Qt apps don't use the theme.

**Solutions**:
1. Ensure Kvantum is set as Qt style:
   ```bash
   echo "export QT_STYLE_OVERRIDE=kvantum" >> ~/.profile
   ```

2. Verify theme installation:
   ```bash
   ls ~/.config/Kvantum/SynthesisDark/
   ```

3. Select theme in Kvantum Manager:
   ```bash
   kvantummanager
   ```

### Window Borders Missing

**Problem**: No window decorations visible.

**Solutions**:
1. Verify window manager is running:
   ```bash
   ps aux | grep -E "marco|metacity"
   ```

2. Enable compositor (MATE):
   ```bash
   gsettings set org.mate.Marco.general compositing-manager true
   ```

3. Check theme is applied:
   ```bash
   gsettings get org.mate.Marco.general theme
   ```

### Build Errors

**Problem**: Meson configuration or build fails.

**Solutions**:
1. Update Meson:
   ```bash
   pip install --user --upgrade meson
   ```

2. Clean build directory:
   ```bash
   rm -rf builddir
   make clean
   make build
   ```

3. Check dependencies:
   ```bash
   meson setup builddir  # Will report missing dependencies
   ```

## Uninstallation

### System Installation

```bash
sudo rm -rf /usr/share/themes/Synthesis-Dark-Marco
sudo rm -rf /usr/share/Kvantum/SynthesisDark
```

Or with Meson:
```bash
cd synthesis-dark-marco-theme
make uninstall
```

### User Installation

```bash
rm -rf ~/.themes/Synthesis-Dark-Marco
rm -rf ~/.config/Kvantum/SynthesisDark
```

Or:
```bash
make dev-uninstall
```

### Package Manager

**Arch Linux:**
```bash
sudo pacman -R synthesis-dark-marco-theme
```

## Related Resources

- **Repository**: https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme
- **Issue Tracker**: https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme/issues
- **Documentation**: [ARCHITECTURE.md](ARCHITECTURE.md)
- **Contributing**: [CONTRIBUTING.md](CONTRIBUTING.md)

## Getting Help

If you encounter issues:

1. Check [Troubleshooting](#troubleshooting) section above
2. Review [Architecture documentation](ARCHITECTURE.md)
3. Search existing [GitHub issues](https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme/issues)
4. Create a new issue with:
   - Your distribution and version
   - Desktop environment
   - Installation method used
   - Error messages (if any)
   - Output of validation commands
