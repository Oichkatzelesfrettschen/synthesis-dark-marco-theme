# Synthesis Dark Marco Theme

A highly-riced metacity/marco window manager theme featuring gradient titlebars, layered shadows for depth perception, and SVG button icons with blur effects.

## Features

- **Gradient Titlebars**: Vertical gradient overlay creates subtle 3D depth illusion
- **Layered Shadows**: Ambient, key, and contact shadows for realistic depth perception
- **12px Rounded Corners**: Enhanced corner radii for modern aesthetic
- **SVG Button Icons**: Close, minimize, maximize buttons with `feGaussianBlur` glow effects
- **CachyOS Teal Accent**: Uses `#17b169` for system identity cohesion
- **Synthesis Dark Palette**: Combines Dracula, Catppuccin Mocha, and accessibility principles

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

### From AUR (Arch Linux)

```bash
yay -S synthesis-dark-marco-theme
```

### Manual Installation

```bash
git clone https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
makepkg -si
```

### Apply Theme

```bash
# For MATE Desktop
gsettings set org.mate.Marco.general theme 'Synthesis-Dark-Marco'

# Enable compositor
gsettings set org.mate.Marco.general compositing-manager true
```

## Companion Configuration

This theme works best with:

1. **Neumorphic GTK CSS**: Add depth effects to GTK widgets
2. **Faux-blur wallpapers**: Pre-blurred wallpapers for backdrop blur simulation
3. **Transparent terminals**: 10-15% transparency for glass effect

See the [dotfiles repository](https://github.com/Oichkatzelesfrettschen/dotfiles) for companion configurations.

## Technical Details

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

## License

GPL-3.0-or-later

Based on Ant-Dracula by Eliver Lara.

## Credits

- [Dracula Theme](https://draculatheme.com/)
- [Catppuccin](https://catppuccin.com/)
- [CachyOS](https://cachyos.org/)
- Colin Ware - "Visual Thinking for Design"
