TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt
SOURCES += \
        main.c \
    dtbinfo.c \
    fctxinject.c \
    fs-config.c \
    getarch.c \
    hexpatch.c \
    keycheck.c \
    mkimg.c \
    mkinitfs.c \
    offsetof.c \
    readta.c \
    replace.c \
    seinject.c \
    sha.c \
    unpackelf.c \
    unpackimg.c \
    unpackinitfs.c \
    xattr.c \
    zip.c \
    magiskpolicy/api.c \
    magiskpolicy/magiskpolicy.c \
    magiskpolicy/rules.c \
    magiskpolicy/sepolicy.c \
    magiskpolicy/vector.c \
    magiskpolicy/windows-mmap.c

HEADERS += \
    android_filesystem_capability.h \
    android_filesystem_config.h \
    bootimg.h \
    sha.h \
    magiskpolicy/logging.h \
    magiskpolicy/magisk.h \
    magiskpolicy/magiskpolicy.h \
    magiskpolicy/sepolicy.h \
    magiskpolicy/vector.h \
    magiskpolicy/windows-mmap.h


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../libsepol/Win/release/ -llibsepol -luser32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../libsepol/Win/debug/ -llibsepol -luser32
else:unix:!macx:CONFIG(debug, debug|release): LIBS += -L$$PWD/../libsepol/Linux/debug/ -llibsepol
else:unix:!macx:CONFIG(release, debug|release): LIBS += -L$$PWD/../libsepol/Linux/release/ -llibsepol

win32:CONFIG(release, debug|release): DESTDIR = $$PWD/../Win/release
else:win32:CONFIG(debug, debug|release): DESTDIR = $$PWD/../Win/debug
else:unix:!macx:CONFIG(debug, debug|release): DESTDIR = $$PWD/../Linux/debug
else:unix:!macx:CONFIG(release, debug|release): DESTDIR = $$PWD/../Linux/release

INCLUDEPATH += $$PWD/../libsepol
DEPENDPATH += $$PWD/../libsepol

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Win/release/liblibsepol.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Win/debug/liblibsepol.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Win/release/libsepol.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Win/debug/libsepol.lib
else:unix:!macx:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Linux/debug/liblibsepol.a
else:unix:!macx:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/Linux/release/liblibsepol.a
