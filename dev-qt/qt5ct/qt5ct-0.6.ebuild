# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

QT5_MODULE="qttools"

inherit qt5-build

DESCRIPTION="Qt5 configuration utility"
HOMEPAGE="http://qt-apps.org/content/show.php/Qt5+Configuration+Tool?content=168066"
SRC_URI="http://qt-apps.org/CONTENT/content-files/168066-${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtsvg:5
"
RDEPEND="${DEPEND}"

QMAKE_QT5="/usr/lib/qt5/bin/qmake"
S="${WORKDIR}"/"${P}"

src_compile(){
	$QMAKE_QT5 ${PN}.pro
	emake DESTDIR="${D}"
	emake -k check
}

src_install(){
	exeinto /usr/bin
	doexe src/${PN}/${PN}
	insinto /usr/share/applications
	doins src/${PN}/${PN}.desktop
	insopts -m0755
	insinto /usr/lib/qt5/plugins/platformthemes
	doins src/${PN}-qtplugin/lib${PN}.so
}
