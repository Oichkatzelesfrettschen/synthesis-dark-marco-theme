# Synthesis Dark Marco Theme

A comprehensive dark theme providing consistent styling across GTK2, GTK3, Marco/Metacity, and Kvantum (Qt) applications.

## Features

### Window Manager (Marco/Metacity)
- **Gradient Titlebars**: Vertical gradient overlay creates subtle 3D depth illusion
- **Layered Shadows**: Ambient, key, and contact shadows for realistic depth perception
- **12px Rounded Corners**: Enhanced corner radii for modern aesthetic
- **SVG Button Icons**: Close, minimize, maximize buttons with `feGaussianBlur` glow effects

### GTK2 & GTK3 Support
- **Complete Widget Coverage**: Buttons, entries, scrollbars, menus, tabs, and more
- **Smooth Animations**: Transitions and hover effects
- **Modern CSS3**: Client-side decorations (CSD) support for GTK3
- **Murrine Engine**: Advanced rendering for GTK2

### Kvantum (Qt) Theme
- **Qt Application Support**: Consistent theming for KDE/Qt apps
- **SVG-Based Rendering**: Scalable, crisp interface elements
- **Blur Effects**: Modern aesthetic matching GTK themes

### Design Principles
- **CachyOS Teal Accent**: Uses `#17b169` for system identity cohesion
- **Synthesis Dark Palette**: Combines Dracula, Catppuccin Mocha, and accessibility principles
- **WCAG AAA Compliant**: 13.5:1 contrast ratio for primary text
- **Colin Ware's Visual Perception**: Research-backed shadow and depth techniques

## Color Scheme

| Role | Hex | Usage |
|------|-----|-------|
| `bg-base` | `#232530` | Titlebar, backgrounds |
| `fg-primary` | `#f4f4f5` | Primary text (13.5:1 contrast) |
| `accent-teal` | `#17b169` | Maximize, menu buttons (CachyOS) |
| `accent-red` | `#f38ba8` | Close button |
| `accent-yellow` | `#f9e2af` | Minimize button |
| `border` | `#44475a` | Window borders |

## Installation

### Quick Install (Arch Linux)

```bash
yay -S synthesis-dark-marco-theme
```

### Build from Source

```bash
git clone https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
make build
sudo make install
```

See **[INSTALL.md](INSTALL.md)** for detailed installation instructions for all distributions.

### Apply Theme

**MATE Desktop:**
```bash
gsettings set org.mate.Marco.general theme 'Synthesis-Dark-Marco'
gsettings set org.mate.interface gtk-theme 'Synthesis-Dark-Marco'
gsettings set org.mate.Marco.general compositing-manager true
```

**Kvantum (Qt apps):**
```bash
kvantummanager  # Select "SynthesisDark"
```

**Other Desktop Environments**: See [INSTALL.md](INSTALL.md) for GNOME, XFCE, KDE, and Cinnamon setup.

## Companion Configuration

This theme works best with:

1. **Neumorphic GTK CSS**: Add depth effects to GTK widgets
2. **Faux-blur wallpapers**: Pre-blurred wallpapers for backdrop blur simulation
3. **Transparent terminals**: 10-15% transparency for glass effect

See the [dotfiles repository](https://github.com/Oichkatzelesfrettschen/dotfiles) for companion configurations.

## Technical Details

### Architecture

- **Build System**: Meson + Ninja for fast, reliable builds
- **Modular Design**: Independent GTK2, GTK3, and Kvantum components
- **Validation**: Automated XML, CSS, and SVG validation
- **CI/CD**: GitHub Actions for quality assurance

See **[ARCHITECTURE.md](ARCHITECTURE.md)** for comprehensive technical documentation.

### Shadow Technique

Uses Colin Ware's visual perception principles from "Visual Thinking for Design":

- **Ambient shadow**: Large, soft, low contrast (`alpha 0.15`)
- **Key shadow**: Medium, darker (`alpha 0.25`)
- **Contact shadow**: Thin, darkest, at edge

### SVG Blur Implementation

Button icons use `feGaussianBlur` filter primitive:

```xml
<filter id="glow">
  <feGaussianBlur in="SourceGraphic" stdDeviation="1" result="blur"/>
  <feMerge>
    <feMergeNode in="blur"/>
    <feMergeNode in="SourceGraphic"/>
  </feMerge>
</filter>
```

## Desktop Environment Compatibility

| Desktop Environment | GTK Theme | Window Manager Theme | Qt Theme (Kvantum) |
|---------------------|-----------|---------------------|-------------------|
| MATE                | ✅ Full    | ✅ Marco             | ✅                 |
| GNOME               | ✅ Full    | ⚠️ Limited (use Shell theme) | ✅     |
| XFCE                | ✅ Full    | ⚠️ Use XFWM4 theme   | ✅                 |
| KDE Plasma          | ✅ Via settings | ⚠️ Use KWin theme | ✅ Primary         |
| Cinnamon            | ✅ Full    | ⚠️ Partial Metacity  | ✅                 |
| Budgie              | ✅ Full    | ✅ If using Metacity | ✅                 |

## Building and Development

### Build Requirements

- Meson (≥0.56.0)
- Ninja
- GTK2/GTK3 (optional, for respective themes)
- Kvantum (optional, for Qt theme)

### Build Commands

```bash
# Build all components
make build

# Install system-wide
sudo make install

# Install for current user
make dev-install

# Validate theme files
make validate

# Clean build artifacts
make clean
```

### Development

See **[CONTRIBUTING.md](CONTRIBUTING.md)** for development guidelines, coding standards, and how to contribute.

## Documentation

- **[INSTALL.md](INSTALL.md)** - Comprehensive installation guide for all distributions
- **[ARCHITECTURE.md](ARCHITECTURE.md)** - Technical documentation and design decisions
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Development guidelines and how to contribute

## License

GPL-3.0-or-later

Based on Ant-Dracula by Eliver Lara.

## Credits

- [Dracula Theme](https://draculatheme.com/) - Base color palette
- [Catppuccin](https://catppuccin.com/) - Accent colors
- [CachyOS](https://cachyos.org/) - Teal accent inspiration
- Colin Ware - "Visual Thinking for Design" - Shadow principles
- Eliver Lara - Ant-Dracula theme foundation

## Support

- **Issues**: [GitHub Issues](https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme/discussions)
- **Documentation**: Check [INSTALL.md](INSTALL.md) and [ARCHITECTURE.md](ARCHITECTURE.md)
