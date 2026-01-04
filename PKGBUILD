# Maintainer: Eirikr <eirikr@archlinux.org>
# Contributor: Synthesis Dark Theme Project

pkgname=synthesis-dark-marco-theme
pkgver=1.1.0
pkgrel=1
pkgdesc="Synthesis Dark theme with GTK2/GTK3, Marco/Metacity, and Kvantum support"
arch=('any')
url="https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme"
license=('GPL-3.0-or-later')
depends=()
makedepends=('meson' 'ninja')
optdepends=(
    'marco: MATE window manager'
    'metacity: GNOME window manager'
    'mate-desktop: MATE desktop environment'
    'gtk2: GTK2 theme support'
    'gtk3: GTK3 theme support'
    'gtk-engine-murrine: GTK2 theme engine for best results'
    'kvantum: Qt theme support'
    'imagemagick: for wallblur effects with companion scripts'
)
provides=('synthesis-dark-marco-theme')
conflicts=('synthesis-dark-marco-theme-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Oichkatzelesfrettschen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # TODO: Update with actual checksum when tagged release is created

build() {
    cd "$srcdir/$pkgname-$pkgver"
    
    meson setup builddir \
        --prefix=/usr \
        --buildtype=plain \
        -Dgtk2=enabled \
        -Dgtk3=enabled \
        -Dkvantum=enabled
    
    meson compile -C builddir
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    meson test -C builddir || warning "Some tests failed"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    DESTDIR="$pkgdir" meson install -C builddir
}
