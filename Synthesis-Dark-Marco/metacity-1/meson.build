# Install metacity theme XML
install_data(
  'metacity-theme-3.xml',
  install_dir: join_paths(theme_dir, 'metacity-1')
)

# Install PNG button assets
png_buttons = [
  'close.png',
  'close_focused.png',
  'close_focused_normal.png',
  'close_focused_prelight.png',
  'close_focused_pressed.png',
  'close_unfocused.png',
  'close_unfocused_prelight.png',
  'close_unfocused_pressed.png',
  'maximize.png',
  'maximize_focused.png',
  'maximize_focused_normal.png',
  'maximize_focused_prelight.png',
  'maximize_focused_pressed.png',
  'maximize_unfocused.png',
  'maximize_unfocused_prelight.png',
  'maximize_unfocused_pressed.png',
  'menu.png',
  'menu_focused.png',
  'menu_focused_normal.png',
  'menu_focused_prelight.png',
  'menu_focused_pressed.png',
  'menu_unfocused.png',
  'menu_unfocused_prelight.png',
  'menu_unfocused_pressed.png',
  'minimize.png',
  'minimize_focused.png',
  'minimize_focused_normal.png',
  'minimize_focused_prelight.png',
  'minimize_focused_pressed.png',
  'minimize_unfocused.png',
  'minimize_unfocused_prelight.png',
  'minimize_unfocused_pressed.png',
  'shade.png',
  'shade_focused.png',
  'shade_focused_normal.png',
  'shade_focused_prelight.png',
  'shade_focused_pressed.png',
  'shade_unfocused.png',
  'shade_unfocused_prelight.png',
  'shade_unfocused_pressed.png',
  'thumbnail.png',
  'unmaximize.png',
  'unmaximize_focused.png',
  'unmaximize_focused_normal.png',
  'unmaximize_focused_prelight.png',
  'unmaximize_focused_pressed.png',
  'unmaximize_unfocused.png',
  'unmaximize_unfocused_prelight.png',
  'unmaximize_unfocused_pressed.png',
  'unshade.png',
  'unshade_focused.png',
  'unshade_focused_normal.png',
  'unshade_focused_prelight.png',
  'unshade_focused_pressed.png',
  'unshade_unfocused.png',
  'unshade_unfocused_prelight.png',
  'unshade_unfocused_pressed.png',
]

foreach png : png_buttons
  install_data(
    png,
    install_dir: join_paths(theme_dir, 'metacity-1')
  )
endforeach

# Install SVG assets with blur effects
svg_assets = [
  'assets/close.svg',
  'assets/close-hover.svg',
  'assets/maximize.svg',
  'assets/maximize-hover.svg',
  'assets/menu.svg',
  'assets/menu-hover.svg',
  'assets/minimize.svg',
  'assets/minimize-hover.svg',
  'assets/unmaximize.svg',
  'assets/unmaximize-hover.svg',
]

foreach svg : svg_assets
  install_data(
    svg,
    install_dir: join_paths(theme_dir, 'metacity-1', 'assets')
  )
endforeach

# Create symlinks for theme version compatibility
meson.add_install_script('sh', '-c',
  'ln -sf metacity-theme-3.xml "$MESON_INSTALL_DESTDIR_PREFIX/' + theme_dir + '/metacity-1/metacity-theme-1.xml"'
)
meson.add_install_script('sh', '-c',
  'ln -sf metacity-theme-3.xml "$MESON_INSTALL_DESTDIR_PREFIX/' + theme_dir + '/metacity-1/metacity-theme-2.xml"'
)
