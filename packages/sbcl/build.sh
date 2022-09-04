TERMUX_PKG_HOMEPAGE=https://www.sbcl.org/
TERMUX_PKG_DESCRIPTION="Steel Bank Common Lisp"
TERMUX_PKG_LICENSE="custom"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.2.8
TERMUX_PKG_SRCURL=https://prdownloads.sourceforge.net/sbcl/sbcl-${TERMUX_PKG_VERSION}-source.tar.bz2
TERMUX_PKG_SHA256=992fcc2b5319010f7587cdc2294b088a595d6c0982ff195b565adfaf4b7d7b0e
TERMUX_PKG_BLACKLISTED_ARCHES="i686, x86_64, arm"

termux_step_pre_configure() {
	local SBCL_HOST_TARFILE=$TERMUX_PKG_CACHEDIR/sbcl-host-${TERMUX_PKG_VERSION}.tar.bz2
	if [ ! -f $SBCL_HOST_TARFILE ]; then
		curl -o $SBCL_HOST_TARFILE -L http://downloads.sourceforge.net/project/sbcl/sbcl/${TERMUX_PKG_VERSION}/sbcl-${TERMUX_PKG_VERSION}-x86-64-linux-binary.tar.bz2
		cd $TERMUX_PKG_TMPDIR
		tar xf $SBCL_HOST_TARFILE
		cd sbcl-${TERMUX_PKG_VERSION}-x86-64-linux
		INSTALL_ROOT=$TERMUX_PKG_CACHEDIR/sbcl-host sh install.sh
	fi
	export PATH=$PATH:$TERMUX_PKG_CACHEDIR/sbcl-host/bin
	export SBCL_HOME=$TERMUX_PKG_CACHEDIR/sbcl-host/lib/sbcl
}

termux_step_make_install() {
	cd $TERMUX_PKG_SRCDIR
	sh make.sh --prefix=$TERMUX_PREFIX
}
