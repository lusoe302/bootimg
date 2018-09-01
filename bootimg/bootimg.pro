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
    main.c \
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
    dtbinfo.c \
    fctxinject.c \
    fs-config.c \
    getarch.c \
    hexpatch.c \
    keycheck.c \
    main.c \
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


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../libsepol/release/ -llibsepol -luser32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../libsepol/debug/ -llibsepol -luser32
else:unix:!macx: LIBS += -L$$PWD/../ -llibsepol

INCLUDEPATH += $$PWD/../libsepol
DEPENDPATH += $$PWD/../libsepol

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/release/liblibsepol.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/debug/liblibsepol.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/release/libsepol.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../libsepol/debug/libsepol.lib
else:unix:!macx: PRE_TARGETDEPS += $$PWD/../liblibsepol.a
