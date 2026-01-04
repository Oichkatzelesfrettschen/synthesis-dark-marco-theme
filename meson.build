project('synthesis-dark-marco-theme',
  version: '1.1.0',
  license: 'GPL-3.0-or-later',
  meson_version: '>=0.56.0'
)

theme_name = 'Synthesis-Dark-Marco'
theme_dir = join_paths(get_option('datadir'), 'themes', theme_name)

# Install index.theme
install_data(
  join_paths('Synthesis-Dark-Marco', 'index.theme'),
  install_dir: theme_dir
)

# Install metacity/marco theme
subdir('Synthesis-Dark-Marco/metacity-1')

# Install GTK2 theme
if get_option('gtk2').enabled()
  subdir('Synthesis-Dark-Marco/gtk-2.0')
endif

# Install GTK3 theme
if get_option('gtk3').enabled()
  subdir('Synthesis-Dark-Marco/gtk-3.0')
endif

# Install Kvantum theme
if get_option('kvantum').enabled()
  subdir('Synthesis-Dark-Marco/Kvantum')
endif

# Validation targets
xmllint = find_program('xmllint', required: false)
if xmllint.found()
  test('validate-metacity-xml',
    xmllint,
    args: ['--noout', join_paths(meson.project_source_root(), 'Synthesis-Dark-Marco/metacity-1/metacity-theme-3.xml')]
  )
endif

# Summary
summary({
  'Theme name': theme_name,
  'Install prefix': get_option('prefix'),
  'Theme directory': theme_dir,
  'GTK2 support': get_option('gtk2').enabled(),
  'GTK3 support': get_option('gtk3').enabled(),
  'Kvantum support': get_option('kvantum').enabled(),
}, section: 'Configuration')
