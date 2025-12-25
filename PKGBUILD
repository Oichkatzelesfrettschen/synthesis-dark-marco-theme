# Maintainer: Eirikr <eirikr@archlinux.org>
# Contributor: Synthesis Dark Theme Project

pkgname=synthesis-dark-marco-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Synthesis Dark metacity/marco window theme with gradient titlebars, layered shadows, and SVG blur effects"
arch=('any')
url="https://github.com/Oichkatzelesfrettschen/synthesis-dark-marco-theme"
license=('GPL-3.0-or-later')
depends=('marco' 'gtk3')
optdepends=(
    'mate-desktop: MATE desktop environment'
    'imagemagick: for wallblur effects with companion scripts'
)
provides=('synthesis-dark-marco-theme')
conflicts=('synthesis-dark-marco-theme-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Oichkatzelesfrettschen/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    local _srcdir="$srcdir/$pkgname-$pkgver"
    local _destdir="$pkgdir/usr/share/themes/Synthesis-Dark-Marco"

    # Install theme to system themes directory
    install -dm755 "$_destdir"
    install -dm755 "$_destdir/metacity-1"
    install -dm755 "$_destdir/metacity-1/assets"

    # Copy index.theme
    install -Dm644 "$_srcdir/Synthesis-Dark-Marco/index.theme" \
        "$_destdir/index.theme"

    # Install metacity theme XML
    install -Dm644 "$_srcdir/Synthesis-Dark-Marco/metacity-1/metacity-theme-3.xml" \
        "$_destdir/metacity-1/metacity-theme-3.xml"

    # Create symlinks for theme version compatibility
    ln -sf metacity-theme-3.xml "$_destdir/metacity-1/metacity-theme-1.xml"
    ln -sf metacity-theme-3.xml "$_destdir/metacity-1/metacity-theme-2.xml"

    # Install PNG button assets (fallback and shade buttons)
    install -Dm644 "$_srcdir/Synthesis-Dark-Marco/metacity-1/"*.png \
        -t "$_destdir/metacity-1/"

    # Install SVG button assets with feGaussianBlur effects
    install -Dm644 "$_srcdir/Synthesis-Dark-Marco/metacity-1/assets/"*.svg \
        -t "$_destdir/metacity-1/assets/"
}
