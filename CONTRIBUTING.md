# Contributing to Synthesis Dark Marco Theme

Thank you for your interest in contributing! This document provides guidelines for contributing to the project.

## Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [Getting Started](#getting-started)
3. [Development Setup](#development-setup)
4. [Coding Standards](#coding-standards)
5. [Testing Requirements](#testing-requirements)
6. [Submitting Changes](#submitting-changes)
7. [Review Process](#review-process)

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help newcomers learn
- Assume good intentions

## Getting Started

### Prerequisites

- Git
- Meson (≥0.56.0)
- Ninja build system
- xmllint (for validation)
- Basic understanding of:
  - GTK theming (CSS for GTK3, gtkrc for GTK2)
  - XML (for Metacity/Marco themes)
  - SVG (for icon assets)
  - Kvantum theming (optional)

### Fork and Clone

```bash
# Fork on GitHub, then:
git clone https://github.com/YOUR_USERNAME/synthesis-dark-marco-theme.git
cd synthesis-dark-marco-theme
git remote add upstream https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme.git
```

## Development Setup

### Install Development Dependencies

**Arch Linux:**
```bash
sudo pacman -S meson ninja gtk2 gtk3 libxml2 shellcheck kvantum
```

**Ubuntu/Debian:**
```bash
sudo apt install meson ninja-build libgtk-3-dev libgtk2.0-dev libxml2-utils shellcheck
```

### Build for Development

```bash
make dev-install
```

This installs to `~/.themes` and `~/.config/Kvantum` for testing.

### Testing Changes

```bash
# Apply theme
gsettings set org.mate.Marco.general theme 'Synthesis-Dark-Marco'
gsettings set org.mate.interface gtk-theme 'Synthesis-Dark-Marco'

# Test specific components
GTK_THEME=Synthesis-Dark-Marco gtk3-widget-factory
```

## Coding Standards

### GTK3 CSS Guidelines

**Format:**
```css
/* Use 4-space indentation */
selector {
    property: value;
    another-property: value;
}

/* Group related selectors */
button,
.button {
    /* ... */
}

/* Add comments for complex sections */
/* === Notebooks (Tabs) === */
notebook {
    /* ... */
}
```

**Color Variables:**
- Always use `@define-color` for colors
- Never hardcode colors except in definitions
- Follow existing naming conventions

**Good:**
```css
@define-color accent_teal #17b169;

button:active {
    background-color: @accent_teal;
}
```

**Bad:**
```css
button:active {
    background-color: #17b169;  /* Direct color - don't do this */
}
```

### GTK2 gtkrc Guidelines

**Format:**
```
# Use tabs for indentation
style "widget_name" {
	property = value
	
	engine "murrine" {
		option = value
	}
}

class "GtkWidget" style "widget_name"
```

**Color Scheme:**
- Use `gtk-color-scheme` for all colors
- Reference with `@color_name` syntax

### Metacity/Marco XML

**Format:**
```xml
<!-- Use 2-space indentation -->
<metacity_theme>
  <constant name="C_name" value="#hexcolor" />
  
  <frame_geometry name="normal" title_scale="medium">
    <distance name="property" value="number" />
  </frame_geometry>
</metacity_theme>
```

**Guidelines:**
- Keep geometry values consistent
- Document any non-standard values
- Test with different window states (normal, maximized, tiled)

### SVG Guidelines

**Format:**
- Use 2-space indentation
- Include proper XML declaration
- Use symbolic colors when possible
- Optimize with SVGO (but keep readable)

**Example:**
```xml
<svg width="24" height="24" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <filter id="glow">
      <feGaussianBlur stdDeviation="1"/>
    </filter>
  </defs>
  
  <rect width="24" height="24" fill="#color" filter="url(#glow)"/>
</svg>
```

### Kvantum Guidelines

**kvconfig Format:**
```ini
[%General]
# Core settings

[GeneralColors]
window.color=#232530
# ... more colors

[Widget]
inherits=ParentWidget
property=value
```

## Color Palette Constraints

### Core Colors (DO NOT CHANGE)

These define the theme identity:

```
Background:  #232530
Foreground:  #f4f4f5
Base:        #1e1e2e
Accent Teal: #17b169 (CachyOS identity)
```

### Acceptable Changes

- Border colors (for contrast adjustments)
- Hover state intensities
- Shadow opacities
- Additional accent colors (as alternatives, not replacements)

### Contrast Requirements

All color combinations must meet WCAG standards:

- **AAA (preferred)**: 7:1 for normal text, 4.5:1 for large text
- **AA (minimum)**: 4.5:1 for normal text, 3:1 for large text
- **UI Components**: 3:1 minimum

Test contrast at: https://webaim.org/resources/contrastchecker/

## Testing Requirements

### Pre-Commit Checks

Run before committing:

```bash
make validate
```

This checks:
- XML validity
- SVG well-formedness
- CSS syntax
- File permissions

### Manual Testing

Test your changes across:

1. **Window States**:
   - Normal windows
   - Maximized windows
   - Tiled windows (left/right)
   - Small utility windows

2. **Widget States**:
   - Normal
   - Hover (prelight)
   - Active/pressed
   - Disabled (insensitive)
   - Focused

3. **Applications** (test at least 2-3):
   - GTK2: Firefox legacy, GIMP
   - GTK3: Files (Nautilus), Terminal, gedit
   - Qt: If Kvantum changes: Dolphin, Kate

### Validation Commands

```bash
# XML validation
xmllint --noout Synthesis-Dark-Marco/metacity-1/metacity-theme-3.xml

# SVG validation
for f in Synthesis-Dark-Marco/metacity-1/assets/*.svg; do
    xmllint --noout "$f"
done

# CSS syntax check
python3 << 'EOF'
with open('Synthesis-Dark-Marco/gtk-3.0/gtk.css') as f:
    content = f.read()
    open_braces = content.count('{')
    close_braces = content.count('}')
    assert open_braces == close_braces, f"Brace mismatch: {open_braces} != {close_braces}"
    print("✓ CSS syntax OK")
EOF
```

## Submitting Changes

### Commit Guidelines

**Format:**
```
[component] Short description (max 72 chars)

Detailed explanation of what changed and why.
Can be multiple paragraphs.

Fixes: #issue_number
```

**Examples:**
```
[gtk3] Improve button contrast in hover state

Increased hover background lightness from 5% to 8% to better
distinguish from normal state, especially on low-contrast displays.

Fixes: #42
```

```
[metacity] Add support for small window geometry

Created new frame_geometry for small utility windows with
8px corner radius instead of 12px for better aesthetics.
```

**Component Tags:**
- `[gtk2]` - GTK2 theme changes
- `[gtk3]` - GTK3 theme changes
- `[metacity]` - Marco/Metacity theme
- `[kvantum]` - Kvantum theme
- `[build]` - Build system changes
- `[docs]` - Documentation updates
- `[ci]` - CI/CD changes
- `[assets]` - SVG/PNG assets

### Pull Request Process

1. **Create a branch:**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/issue-description
   ```

2. **Make changes:**
   - Follow coding standards
   - Test thoroughly
   - Run validation

3. **Commit changes:**
   ```bash
   git add .
   git commit -m "[component] Description"
   ```

4. **Push to your fork:**
   ```bash
   git push origin feature/your-feature-name
   ```

5. **Create Pull Request:**
   - Use descriptive title
   - Reference any related issues
   - Include screenshots for visual changes
   - List what you tested

### PR Template

```markdown
## Description
Brief description of changes.

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Enhancement
- [ ] Documentation
- [ ] Build system

## Testing Done
- [ ] Validated XML/SVG/CSS
- [ ] Tested on MATE
- [ ] Tested on [other DE]
- [ ] Tested GTK2 apps
- [ ] Tested GTK3 apps
- [ ] Tested Qt apps (Kvantum)

## Screenshots
If applicable, add screenshots showing:
- Before/after comparison
- Different widget states
- Different window states

## Checklist
- [ ] Code follows style guidelines
- [ ] Validation passes (`make validate`)
- [ ] Tested manually
- [ ] Documentation updated (if needed)
- [ ] No breaking changes (or documented)

## Related Issues
Fixes #issue_number
```

## Review Process

### What Reviewers Look For

1. **Functionality**: Does it work as intended?
2. **Code Quality**: Follows style guidelines?
3. **Testing**: Adequate testing done?
4. **Documentation**: Changes documented?
5. **Compatibility**: No regressions?
6. **Accessibility**: Maintains contrast ratios?

### Addressing Feedback

- Be responsive to review comments
- Make requested changes promptly
- Ask questions if something is unclear
- Be open to suggestions

### Merging

Once approved:
- Squash commits if requested
- Ensure CI passes
- Maintainer will merge

## Development Tips

### Rapid Testing

```bash
# Quick reload GTK3
killall gtk3-widget-factory
GTK_THEME=Synthesis-Dark-Marco gtk3-widget-factory &

# Quick reload Marco
marco --replace &

# Live CSS editing
# Edit ~/.themes/Synthesis-Dark-Marco/gtk-3.0/gtk.css
# Press Ctrl+Alt+Backspace in app to reload
```

### Color Tweaking

Use a color picker to test values:
```bash
# Install color picker
sudo pacman -S gcolor3  # or gpick

# Test contrast
# Use online tools: https://webaim.org/resources/contrastchecker/
```

### SVG Editing

Recommended tools:
- Inkscape (GUI, full-featured)
- Boxy SVG (GUI, simple)
- Text editor (for simple changes)

### Finding Widgets to Style

```bash
# GTK Inspector (GTK3)
GTK_DEBUG=interactive gtk3-widget-factory

# Then Ctrl+Shift+I or Ctrl+Shift+D in any GTK3 app
```

## Architecture Decisions

When proposing significant changes, consider:

1. **Backward Compatibility**: Will this break existing setups?
2. **Cross-Platform**: Works on all supported DEs?
3. **Performance**: Impact on theme loading/rendering?
4. **Maintainability**: Easy to maintain long-term?
5. **Accessibility**: Maintains WCAG compliance?

Document decisions in PR description.

## Resources

### Documentation
- [GTK3 CSS Documentation](https://docs.gtk.org/gtk3/)
- [Metacity Theme Format](https://wiki.gnome.org/Attic/GnomeArt/Tutorials/MetacityThemes)
- [Kvantum Documentation](https://github.com/tsujan/Kvantum/blob/master/Kvantum/doc/Theme-Config)

### Tools
- [GTK Inspector](https://wiki.gnome.org/Projects/GTK/Inspector)
- [SVGO](https://github.com/svg/svgo) - SVG optimizer
- [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/)

### Similar Projects
- [Dracula Theme](https://github.com/dracula/gtk)
- [Catppuccin GTK](https://github.com/catppuccin/gtk)
- [Arc Theme](https://github.com/jnsh/arc-theme)

## Questions?

- Open a [GitHub Issue](https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme/issues)
- Check [ARCHITECTURE.md](ARCHITECTURE.md) for technical details
- Review existing PRs for examples

Thank you for contributing! 🎨
