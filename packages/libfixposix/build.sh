TERMUX_PKG_HOMEPAGE="https://github.com/sionescu/libfixposix"
TERMUX_PKG_DESCRIPTION="Thin wrapper over POSIX syscalls "
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENCE"
TERMUX_PKG_MAINTAINER="André A. Gomes <andre@atlas.engineer>"
TERMUX_PKG_VERSION=0.4.3
TERMUX_PKG_SRCURL=https://github.com/sionescu/libfixposix/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=78fe8bcebf496520ac29b5b65049f5ec1977c6bd956640bdc6d1da6ea04d8504
TERMUX_PKG_BUILD_DEPENDS="autoconf, automake, libtool, pkg-config, check"

termux_step_pre_configure() {
	autoreconf -i -f
}
