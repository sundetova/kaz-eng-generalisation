# Makefile.in generated by automake 1.14.1 from Makefile.am.
# lttoolbox/Makefile.  Generated from Makefile.in by configure.

# Copyright (C) 1994-2013 Free Software Foundation, Inc.

# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.







am__is_gnu_make = test -n '$(MAKEFILE_LIST)' && test -n '$(MAKELEVEL)'
am__make_running_with_option = \
  case $${target_option-} in \
      ?) ;; \
      *) echo "am__make_running_with_option: internal error: invalid" \
              "target option '$${target_option-}' specified" >&2; \
         exit 1;; \
  esac; \
  has_opt=no; \
  sane_makeflags=$$MAKEFLAGS; \
  if $(am__is_gnu_make); then \
    sane_makeflags=$$MFLAGS; \
  else \
    case $$MAKEFLAGS in \
      *\\[\ \	]*) \
        bs=\\; \
        sane_makeflags=`printf '%s\n' "$$MAKEFLAGS" \
          | sed "s/$$bs$$bs[$$bs $$bs	]*//g"`;; \
    esac; \
  fi; \
  skip_next=no; \
  strip_trailopt () \
  { \
    flg=`printf '%s\n' "$$flg" | sed "s/$$1.*$$//"`; \
  }; \
  for flg in $$sane_makeflags; do \
    test $$skip_next = yes && { skip_next=no; continue; }; \
    case $$flg in \
      *=*|--*) continue;; \
        -*I) strip_trailopt 'I'; skip_next=yes;; \
      -*I?*) strip_trailopt 'I';; \
        -*O) strip_trailopt 'O'; skip_next=yes;; \
      -*O?*) strip_trailopt 'O';; \
        -*l) strip_trailopt 'l'; skip_next=yes;; \
      -*l?*) strip_trailopt 'l';; \
      -[dEDm]) skip_next=yes;; \
      -[JT]) skip_next=yes;; \
    esac; \
    case $$flg in \
      *$$target_option*) has_opt=yes; break;; \
    esac; \
  done; \
  test $$has_opt = yes
am__make_dryrun = (target_option=n; $(am__make_running_with_option))
am__make_keepgoing = (target_option=k; $(am__make_running_with_option))
pkgdatadir = $(datadir)/lttoolbox
pkgincludedir = $(includedir)/lttoolbox
pkglibdir = $(libdir)/lttoolbox
pkglibexecdir = $(libexecdir)/lttoolbox
am__cd = CDPATH="$${ZSH_VERSION+.}$(PATH_SEPARATOR)" && cd
install_sh_DATA = $(install_sh) -c -m 644
install_sh_PROGRAM = $(install_sh) -c
install_sh_SCRIPT = $(install_sh) -c
INSTALL_HEADER = $(INSTALL_DATA)
transform = $(program_transform_name)
NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
build_triplet = i686-pc-linux-gnu
host_triplet = i686-pc-linux-gnu
target_triplet = i686-pc-linux-gnu
bin_PROGRAMS = lt-comp$(EXEEXT) lt-proc$(EXEEXT) lt-expand$(EXEEXT) \
	lt-tmxcomp$(EXEEXT) lt-tmxproc$(EXEEXT) lt-print$(EXEEXT) \
	lt-trim$(EXEEXT)
#am__append_1 = -I$(top_srcdir)/utf8
subdir = lttoolbox
DIST_COMMON = $(srcdir)/Makefile.in $(srcdir)/Makefile.am \
	$(srcdir)/lttoolbox_config.h.in $(top_srcdir)/depcomp \
	$(library_include_HEADERS)
ACLOCAL_M4 = $(top_srcdir)/aclocal.m4
am__aclocal_m4_deps = $(top_srcdir)/configure.ac
am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
	$(ACLOCAL_M4)
mkinstalldirs = $(install_sh) -d
CONFIG_HEADER = lttoolbox_config.h
CONFIG_CLEAN_FILES =
CONFIG_CLEAN_VPATH_FILES =
am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
am__vpath_adj = case $$p in \
    $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
    *) f=$$p;; \
  esac;
am__strip_dir = f=`echo $$p | sed -e 's|^.*/||'`;
am__install_max = 40
am__nobase_strip_setup = \
  srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`
am__nobase_strip = \
  for p in $$list; do echo "$$p"; done | sed -e "s|$$srcdirstrip/||"
am__nobase_list = $(am__nobase_strip_setup); \
  for p in $$list; do echo "$$p $$p"; done | \
  sed "s| $$srcdirstrip/| |;"' / .*\//!s/ .*/ ./; s,\( .*\)/[^/]*$$,\1,' | \
  $(AWK) 'BEGIN { files["."] = "" } { files[$$2] = files[$$2] " " $$1; \
    if (++n[$$2] == $(am__install_max)) \
      { print $$2, files[$$2]; n[$$2] = 0; files[$$2] = "" } } \
    END { for (dir in files) print dir, files[dir] }'
am__base_list = \
  sed '$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;$$!N;s/\n/ /g' | \
  sed '$$!N;$$!N;$$!N;$$!N;s/\n/ /g'
am__uninstall_files_from_dir = { \
  test -z "$$files" \
    || { test ! -d "$$dir" && test ! -f "$$dir" && test ! -r "$$dir"; } \
    || { echo " ( cd '$$dir' && rm -f" $$files ")"; \
         $(am__cd) "$$dir" && rm -f $$files; }; \
  }
am__installdirs = "$(DESTDIR)$(libdir)" "$(DESTDIR)$(bindir)" \
	"$(DESTDIR)$(man1dir)" "$(DESTDIR)$(lttoolboxdir)" \
	"$(DESTDIR)$(library_includedir)"
LTLIBRARIES = $(lib_LTLIBRARIES)
liblttoolbox3_la_LIBADD =
am__objects_1 =
am__objects_2 = alphabet.lo att_compiler.lo compiler.lo compression.lo \
	entry_token.lo expander.lo fst_processor.lo lt_locale.lo \
	match_exe.lo match_node.lo match_state.lo node.lo \
	pattern_list.lo regexp_compiler.lo sorted_vector.lo state.lo \
	transducer.lo trans_exe.lo xml_parse_util.lo tmx_compiler.lo
am_liblttoolbox3_la_OBJECTS = $(am__objects_1) $(am__objects_2)
liblttoolbox3_la_OBJECTS = $(am_liblttoolbox3_la_OBJECTS)
AM_V_lt = $(am__v_lt_$(V))
am__v_lt_ = $(am__v_lt_$(AM_DEFAULT_VERBOSITY))
am__v_lt_0 = --silent
am__v_lt_1 = 
liblttoolbox3_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX \
	$(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=link $(CXXLD) \
	$(AM_CXXFLAGS) $(CXXFLAGS) $(liblttoolbox3_la_LDFLAGS) \
	$(LDFLAGS) -o $@
PROGRAMS = $(bin_PROGRAMS)
am_lt_comp_OBJECTS = lt_comp.$(OBJEXT)
lt_comp_OBJECTS = $(am_lt_comp_OBJECTS)
lt_comp_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_comp_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_comp_LDFLAGS) $(LDFLAGS) -o $@
am_lt_expand_OBJECTS = lt_expand.$(OBJEXT)
lt_expand_OBJECTS = $(am_lt_expand_OBJECTS)
lt_expand_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_expand_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_expand_LDFLAGS) $(LDFLAGS) -o $@
am_lt_print_OBJECTS = lt_print.$(OBJEXT)
lt_print_OBJECTS = $(am_lt_print_OBJECTS)
lt_print_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_print_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_print_LDFLAGS) $(LDFLAGS) -o $@
am_lt_proc_OBJECTS = lt_proc.$(OBJEXT)
lt_proc_OBJECTS = $(am_lt_proc_OBJECTS)
lt_proc_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_proc_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_proc_LDFLAGS) $(LDFLAGS) -o $@
am_lt_tmxcomp_OBJECTS = lt_tmxcomp.$(OBJEXT)
lt_tmxcomp_OBJECTS = $(am_lt_tmxcomp_OBJECTS)
lt_tmxcomp_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_tmxcomp_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_tmxcomp_LDFLAGS) $(LDFLAGS) -o $@
am_lt_tmxproc_OBJECTS = lt_tmxproc.$(OBJEXT)
lt_tmxproc_OBJECTS = $(am_lt_tmxproc_OBJECTS)
lt_tmxproc_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_tmxproc_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_tmxproc_LDFLAGS) $(LDFLAGS) -o $@
am_lt_trim_OBJECTS = lt_trim.$(OBJEXT)
lt_trim_OBJECTS = $(am_lt_trim_OBJECTS)
lt_trim_DEPENDENCIES = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_trim_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(lt_trim_LDFLAGS) $(LDFLAGS) -o $@
AM_V_P = $(am__v_P_$(V))
am__v_P_ = $(am__v_P_$(AM_DEFAULT_VERBOSITY))
am__v_P_0 = false
am__v_P_1 = :
AM_V_GEN = $(am__v_GEN_$(V))
am__v_GEN_ = $(am__v_GEN_$(AM_DEFAULT_VERBOSITY))
am__v_GEN_0 = @echo "  GEN     " $@;
am__v_GEN_1 = 
AM_V_at = $(am__v_at_$(V))
am__v_at_ = $(am__v_at_$(AM_DEFAULT_VERBOSITY))
am__v_at_0 = @
am__v_at_1 = 
DEFAULT_INCLUDES = -I.
depcomp = $(SHELL) $(top_srcdir)/depcomp
am__depfiles_maybe = depfiles
am__mv = mv -f
CXXCOMPILE = $(CXX) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
	$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CXXFLAGS) $(CXXFLAGS)
LTCXXCOMPILE = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=compile $(CXX) $(DEFS) \
	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
	$(AM_CXXFLAGS) $(CXXFLAGS)
AM_V_CXX = $(am__v_CXX_$(V))
am__v_CXX_ = $(am__v_CXX_$(AM_DEFAULT_VERBOSITY))
am__v_CXX_0 = @echo "  CXX     " $@;
am__v_CXX_1 = 
CXXLD = $(CXX)
CXXLINK = $(LIBTOOL) $(AM_V_lt) --tag=CXX $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CXXLD) $(AM_CXXFLAGS) \
	$(CXXFLAGS) $(AM_LDFLAGS) $(LDFLAGS) -o $@
AM_V_CXXLD = $(am__v_CXXLD_$(V))
am__v_CXXLD_ = $(am__v_CXXLD_$(AM_DEFAULT_VERBOSITY))
am__v_CXXLD_0 = @echo "  CXXLD   " $@;
am__v_CXXLD_1 = 
COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
LTCOMPILE = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=compile $(CC) $(DEFS) \
	$(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) \
	$(AM_CFLAGS) $(CFLAGS)
AM_V_CC = $(am__v_CC_$(V))
am__v_CC_ = $(am__v_CC_$(AM_DEFAULT_VERBOSITY))
am__v_CC_0 = @echo "  CC      " $@;
am__v_CC_1 = 
CCLD = $(CC)
LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
	$(LIBTOOLFLAGS) --mode=link $(CCLD) $(AM_CFLAGS) $(CFLAGS) \
	$(AM_LDFLAGS) $(LDFLAGS) -o $@
AM_V_CCLD = $(am__v_CCLD_$(V))
am__v_CCLD_ = $(am__v_CCLD_$(AM_DEFAULT_VERBOSITY))
am__v_CCLD_0 = @echo "  CCLD    " $@;
am__v_CCLD_1 = 
SOURCES = $(liblttoolbox3_la_SOURCES) $(lt_comp_SOURCES) \
	$(lt_expand_SOURCES) $(lt_print_SOURCES) $(lt_proc_SOURCES) \
	$(lt_tmxcomp_SOURCES) $(lt_tmxproc_SOURCES) $(lt_trim_SOURCES)
DIST_SOURCES = $(liblttoolbox3_la_SOURCES) $(lt_comp_SOURCES) \
	$(lt_expand_SOURCES) $(lt_print_SOURCES) $(lt_proc_SOURCES) \
	$(lt_tmxcomp_SOURCES) $(lt_tmxproc_SOURCES) $(lt_trim_SOURCES)
am__can_run_installinfo = \
  case $$AM_UPDATE_INFO_DIR in \
    n|no|NO) false;; \
    *) (install-info --version) >/dev/null 2>&1;; \
  esac
man1dir = $(mandir)/man1
NROFF = nroff
MANS = $(man_MANS)
DATA = $(lttoolbox_DATA)
HEADERS = $(library_include_HEADERS)
am__tagged_files = $(HEADERS) $(SOURCES) $(TAGS_FILES) \
	$(LISP)lttoolbox_config.h.in
# Read a list of newline-separated strings from the standard input,
# and print each of them once, without duplicates.  Input order is
# *not* preserved.
am__uniquify_input = $(AWK) '\
  BEGIN { nonempty = 0; } \
  { items[$$0] = 1; nonempty = 1; } \
  END { if (nonempty) { for (i in items) print i; }; } \
'
# Make sure the list of sources is unique.  This is necessary because,
# e.g., the same source file might be shared among _SOURCES variables
# for different programs/libraries.
am__define_uniq_tagged_files = \
  list='$(am__tagged_files)'; \
  unique=`for i in $$list; do \
    if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
  done | $(am__uniquify_input)`
ETAGS = etags
CTAGS = ctags
DISTFILES = $(DIST_COMMON) $(DIST_SOURCES) $(TEXINFOS) $(EXTRA_DIST)
ACLOCAL = ${SHELL} /home/apertium/apertium-testing/lttoolbox/missing aclocal-1.14
AMTAR = $${TAR-tar}
AM_DEFAULT_VERBOSITY = 1
AR = ar
AUTOCONF = ${SHELL} /home/apertium/apertium-testing/lttoolbox/missing autoconf
AUTOHEADER = ${SHELL} /home/apertium/apertium-testing/lttoolbox/missing autoheader
AUTOMAKE = ${SHELL} /home/apertium/apertium-testing/lttoolbox/missing automake-1.14
AWK = gawk
CC = gcc
CCDEPMODE = depmode=gcc3
CFLAGS = -Wall -march=i686 -O3 -fomit-frame-pointer -funroll-loops  -ansi
CPP = gcc -E
CPPFLAGS =  -ansi
CXX = g++
CXXCPP = g++ -E
CXXDEPMODE = depmode=gcc3
CXXFLAGS = -Wall -march=i686 -O3               -fomit-frame-pointer -funroll-loops  -ansi
CYGPATH_W = echo
DEFS = -DHAVE_CONFIG_H
DEPDIR = .deps
DLLTOOL = false
DSYMUTIL = 
DUMPBIN = 
ECHO_C = 
ECHO_N = -n
ECHO_T = 
EGREP = /bin/grep -E
EXEEXT = 
FGREP = /bin/grep -F
GENERIC_API_VERSION = 3.3
GENERIC_LIBRARY_NAME = lttoolbox
GENERIC_LIBRARY_VERSION = 0:0:0
GENERIC_MAJOR_VERSION = 3
GENERIC_RELEASE = 3.3
GENERIC_VERSION = 3.3.2
GREP = /bin/grep
INSTALL = /usr/bin/install -c
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_PROGRAM = ${INSTALL}
INSTALL_SCRIPT = ${INSTALL}
INSTALL_STRIP_PROGRAM = $(install_sh) -c -s
LD = /usr/bin/ld
LDFLAGS = 
LIBOBJS = 
LIBS = -lxml2 
LIBTOOL = $(SHELL) $(top_builddir)/libtool
LIPO = 
LN_S = ln -s
LTLIBOBJS = 
LTTOOLBOX_CFLAGS = -I/usr/include/libxml2 
LTTOOLBOX_LIBS = -lxml2 
MAKEINFO = ${SHELL} /home/apertium/apertium-testing/lttoolbox/missing makeinfo
MANIFEST_TOOL = :
MKDIR_P = /bin/mkdir -p
NM = /usr/bin/nm -B
NMEDIT = 
OBJDUMP = objdump
OBJEXT = o
OTOOL = 
OTOOL64 = 
PACKAGE = lttoolbox
PACKAGE_BUGREPORT = sortiz@users.sourceforge.net
PACKAGE_NAME = lttoolbox/lttoolbox.h
PACKAGE_STRING = lttoolbox/lttoolbox.h 3.3.2
PACKAGE_TARNAME = lttoolbox-lttoolbox-h
PACKAGE_URL = 
PACKAGE_VERSION = 3.3.2
PATH_SEPARATOR = :
PKG_CONFIG = /usr/bin/pkg-config
PKG_CONFIG_LIBDIR = 
PKG_CONFIG_PATH = /usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/local/lib/pkgconfig
PYTHON = /usr/bin/python
PYTHON_EXEC_PREFIX = ${exec_prefix}
PYTHON_PLATFORM = linux2
PYTHON_PREFIX = ${prefix}
PYTHON_VERSION = 2.7
RANLIB = ranlib
SED = /bin/sed
SET_MAKE = 
SHELL = /bin/bash
STRIP = strip
VERSION = 3.3.2
abs_builddir = /home/apertium/apertium-testing/lttoolbox/lttoolbox
abs_srcdir = /home/apertium/apertium-testing/lttoolbox/lttoolbox
abs_top_builddir = /home/apertium/apertium-testing/lttoolbox
abs_top_srcdir = /home/apertium/apertium-testing/lttoolbox
ac_ct_AR = ar
ac_ct_CC = gcc
ac_ct_CXX = g++
ac_ct_DUMPBIN = 
am__include = include
am__leading_dot = .
am__quote = 
am__tar = $${TAR-tar} chof - "$$tardir"
am__untar = $${TAR-tar} xf -
bindir = ${exec_prefix}/bin
build = i686-pc-linux-gnu
build_alias = 
build_cpu = i686
build_os = linux-gnu
build_vendor = pc
builddir = .
datadir = ${datarootdir}
datarootdir = ${prefix}/share
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
dvidir = ${docdir}
exec_prefix = ${prefix}
host = i686-pc-linux-gnu
host_alias = 
host_cpu = i686
host_os = linux-gnu
host_vendor = pc
htmldir = ${docdir}
includedir = ${prefix}/include
infodir = ${datarootdir}/info
install_sh = ${SHELL} /home/apertium/apertium-testing/lttoolbox/install-sh
libdir = ${exec_prefix}/lib
libexecdir = ${exec_prefix}/libexec
localedir = ${datarootdir}/locale
localstatedir = ${prefix}/var
mandir = ${datarootdir}/man
mkdir_p = $(MKDIR_P)
oldincludedir = /usr/include
pdfdir = ${docdir}
pkgpyexecdir = ${pyexecdir}/lttoolbox
pkgpythondir = ${pythondir}/lttoolbox
prefix = /usr/local
program_transform_name = s,x,x,
psdir = ${docdir}
pyexecdir = ${exec_prefix}/lib/python2.7/dist-packages
pythondir = ${prefix}/lib/python2.7/dist-packages
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
srcdir = .
sysconfdir = ${prefix}/etc
target = i686-pc-linux-gnu
target_alias = 
target_cpu = i686
target_os = linux-gnu
target_vendor = pc
top_build_prefix = ../
top_builddir = ..
top_srcdir = ..
h_sources = alphabet.h att_compiler.h buffer.h compiler.h compression.h  \
            entry_token.h expander.h fst_processor.h lt_locale.h ltstr.h \
            match_exe.h match_node.h match_state.h my_stdio.h node.h \
            pattern_list.h regexp_compiler.h sorted_vector.h state.h \
            transducer.h trans_exe.h xml_parse_util.h exception.h tmx_compiler.h

cc_sources = alphabet.cc att_compiler.cc compiler.cc compression.cc entry_token.cc \
             expander.cc fst_processor.cc lt_locale.cc match_exe.cc \
             match_node.cc match_state.cc node.cc pattern_list.cc \
             regexp_compiler.cc sorted_vector.cc state.cc transducer.cc \
             trans_exe.cc xml_parse_util.cc tmx_compiler.cc

library_includedir = $(includedir)/$(GENERIC_LIBRARY_NAME)-$(GENERIC_API_VERSION)/$(GENERIC_LIBRARY_NAME)
library_include_HEADERS = $(h_sources)
instdir = lttoolbox
lib_LTLIBRARIES = liblttoolbox3.la
liblttoolbox3_la_SOURCES = $(h_sources) $(cc_sources)
liblttoolbox3_la_LDFLAGS = -version-info $(GENERIC_LIBRARY_VERSION) -release $(GENERIC_RELEASE)
lttoolboxdir = $(prefix)/share/lttoolbox
lttoolboxinclude = $(prefix)/include
lttoolboxlib = $(prefix)/lib
lttoolbox_DATA = dix.dtd dix.rng acx.rng xsd/dix.xsd xsd/acx.xsd
lt_print_SOURCES = lt_print.cc
lt_print_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_print_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_trim_SOURCES = lt_trim.cc
lt_trim_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_trim_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_comp_SOURCES = lt_comp.cc
lt_comp_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_comp_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_proc_SOURCES = lt_proc.cc
lt_proc_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_proc_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_expand_SOURCES = lt_expand.cc
lt_expand_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_expand_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_tmxcomp_SOURCES = lt_tmxcomp.cc
lt_tmxcomp_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_tmxcomp_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)
lt_tmxproc_SOURCES = lt_tmxproc.cc
lt_tmxproc_LDADD = liblttoolbox$(GENERIC_MAJOR_VERSION).la
lt_tmxproc_LDFLAGS = -llttoolbox$(GENERIC_MAJOR_VERSION) $(LTTOOLBOX_LIBS)

#lt-validate-dictionary: Makefile.am validate-header.sh
#	@echo "Creating lt-validate-dictionary script"
#	@echo "#!$(BASH)" > $@
#	@cat validate-header.sh >> $@
#	@echo "$(XMLLINT) --dtdvalid $(apertiumdir)/dix.dtd --noout \$$FILE1 && exit 0;" >> $@
#	@echo "exit 1;" >> $@
#	@chmod a+x $@
man_MANS = lt-comp.1 lt-expand.1 lt-proc.1 lt-tmxcomp.1 lt-tmxproc.1 lt-print.1 lt-trim.1
INCLUDES = -I$(top_srcdir) $(LTTOOLBOX_CFLAGS) $(am__append_1)
CLEANFILES = *~
EXTRA_DIST = dix.dtd dix.rng acx.rng xsd/dix.xsd xsd/acx.xsd CMakeLists.txt $(man_MANS)
all: lttoolbox_config.h
	$(MAKE) $(AM_MAKEFLAGS) all-am

.SUFFIXES:
.SUFFIXES: .cc .lo .o .obj
$(srcdir)/Makefile.in:  $(srcdir)/Makefile.am  $(am__configure_deps)
	@for dep in $?; do \
	  case '$(am__configure_deps)' in \
	    *$$dep*) \
	      ( cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh ) \
	        && { if test -f $@; then exit 0; else break; fi; }; \
	      exit 1;; \
	  esac; \
	done; \
	echo ' cd $(top_srcdir) && $(AUTOMAKE) --gnu lttoolbox/Makefile'; \
	$(am__cd) $(top_srcdir) && \
	  $(AUTOMAKE) --gnu lttoolbox/Makefile
.PRECIOUS: Makefile
Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
	@case '$?' in \
	  *config.status*) \
	    cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh;; \
	  *) \
	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe)'; \
	    cd $(top_builddir) && $(SHELL) ./config.status $(subdir)/$@ $(am__depfiles_maybe);; \
	esac;

$(top_builddir)/config.status: $(top_srcdir)/configure $(CONFIG_STATUS_DEPENDENCIES)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh

$(top_srcdir)/configure:  $(am__configure_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
$(ACLOCAL_M4):  $(am__aclocal_m4_deps)
	cd $(top_builddir) && $(MAKE) $(AM_MAKEFLAGS) am--refresh
$(am__aclocal_m4_deps):

lttoolbox_config.h: stamp-h1
	@test -f $@ || rm -f stamp-h1
	@test -f $@ || $(MAKE) $(AM_MAKEFLAGS) stamp-h1

stamp-h1: $(srcdir)/lttoolbox_config.h.in $(top_builddir)/config.status
	@rm -f stamp-h1
	cd $(top_builddir) && $(SHELL) ./config.status lttoolbox/lttoolbox_config.h
$(srcdir)/lttoolbox_config.h.in:  $(am__configure_deps) 
	($(am__cd) $(top_srcdir) && $(AUTOHEADER))
	rm -f stamp-h1
	touch $@

distclean-hdr:
	-rm -f lttoolbox_config.h stamp-h1

install-libLTLIBRARIES: $(lib_LTLIBRARIES)
	@$(NORMAL_INSTALL)
	@list='$(lib_LTLIBRARIES)'; test -n "$(libdir)" || list=; \
	list2=; for p in $$list; do \
	  if test -f $$p; then \
	    list2="$$list2 $$p"; \
	  else :; fi; \
	done; \
	test -z "$$list2" || { \
	  echo " $(MKDIR_P) '$(DESTDIR)$(libdir)'"; \
	  $(MKDIR_P) "$(DESTDIR)$(libdir)" || exit 1; \
	  echo " $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL) $(INSTALL_STRIP_FLAG) $$list2 '$(DESTDIR)$(libdir)'"; \
	  $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL) $(INSTALL_STRIP_FLAG) $$list2 "$(DESTDIR)$(libdir)"; \
	}

uninstall-libLTLIBRARIES:
	@$(NORMAL_UNINSTALL)
	@list='$(lib_LTLIBRARIES)'; test -n "$(libdir)" || list=; \
	for p in $$list; do \
	  $(am__strip_dir) \
	  echo " $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=uninstall rm -f '$(DESTDIR)$(libdir)/$$f'"; \
	  $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=uninstall rm -f "$(DESTDIR)$(libdir)/$$f"; \
	done

clean-libLTLIBRARIES:
	-test -z "$(lib_LTLIBRARIES)" || rm -f $(lib_LTLIBRARIES)
	@list='$(lib_LTLIBRARIES)'; \
	locs=`for p in $$list; do echo $$p; done | \
	      sed 's|^[^/]*$$|.|; s|/[^/]*$$||; s|$$|/so_locations|' | \
	      sort -u`; \
	test -z "$$locs" || { \
	  echo rm -f $${locs}; \
	  rm -f $${locs}; \
	}

liblttoolbox3.la: $(liblttoolbox3_la_OBJECTS) $(liblttoolbox3_la_DEPENDENCIES) $(EXTRA_liblttoolbox3_la_DEPENDENCIES) 
	$(AM_V_CXXLD)$(liblttoolbox3_la_LINK) -rpath $(libdir) $(liblttoolbox3_la_OBJECTS) $(liblttoolbox3_la_LIBADD) $(LIBS)
install-binPROGRAMS: $(bin_PROGRAMS)
	@$(NORMAL_INSTALL)
	@list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
	if test -n "$$list"; then \
	  echo " $(MKDIR_P) '$(DESTDIR)$(bindir)'"; \
	  $(MKDIR_P) "$(DESTDIR)$(bindir)" || exit 1; \
	fi; \
	for p in $$list; do echo "$$p $$p"; done | \
	sed 's/$(EXEEXT)$$//' | \
	while read p p1; do if test -f $$p \
	 || test -f $$p1 \
	  ; then echo "$$p"; echo "$$p"; else :; fi; \
	done | \
	sed -e 'p;s,.*/,,;n;h' \
	    -e 's|.*|.|' \
	    -e 'p;x;s,.*/,,;s/$(EXEEXT)$$//;$(transform);s/$$/$(EXEEXT)/' | \
	sed 'N;N;N;s,\n, ,g' | \
	$(AWK) 'BEGIN { files["."] = ""; dirs["."] = 1 } \
	  { d=$$3; if (dirs[d] != 1) { print "d", d; dirs[d] = 1 } \
	    if ($$2 == $$4) files[d] = files[d] " " $$1; \
	    else { print "f", $$3 "/" $$4, $$1; } } \
	  END { for (d in files) print "f", d, files[d] }' | \
	while read type dir files; do \
	    if test "$$dir" = .; then dir=; else dir=/$$dir; fi; \
	    test -z "$$files" || { \
	    echo " $(INSTALL_PROGRAM_ENV) $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL_PROGRAM) $$files '$(DESTDIR)$(bindir)$$dir'"; \
	    $(INSTALL_PROGRAM_ENV) $(LIBTOOL) $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=install $(INSTALL_PROGRAM) $$files "$(DESTDIR)$(bindir)$$dir" || exit $$?; \
	    } \
	; done

uninstall-binPROGRAMS:
	@$(NORMAL_UNINSTALL)
	@list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
	files=`for p in $$list; do echo "$$p"; done | \
	  sed -e 'h;s,^.*/,,;s/$(EXEEXT)$$//;$(transform)' \
	      -e 's/$$/$(EXEEXT)/' \
	`; \
	test -n "$$list" || exit 0; \
	echo " ( cd '$(DESTDIR)$(bindir)' && rm -f" $$files ")"; \
	cd "$(DESTDIR)$(bindir)" && rm -f $$files

clean-binPROGRAMS:
	@list='$(bin_PROGRAMS)'; test -n "$$list" || exit 0; \
	echo " rm -f" $$list; \
	rm -f $$list || exit $$?; \
	test -n "$(EXEEXT)" || exit 0; \
	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
	echo " rm -f" $$list; \
	rm -f $$list

lt-comp$(EXEEXT): $(lt_comp_OBJECTS) $(lt_comp_DEPENDENCIES) $(EXTRA_lt_comp_DEPENDENCIES) 
	@rm -f lt-comp$(EXEEXT)
	$(AM_V_CXXLD)$(lt_comp_LINK) $(lt_comp_OBJECTS) $(lt_comp_LDADD) $(LIBS)

lt-expand$(EXEEXT): $(lt_expand_OBJECTS) $(lt_expand_DEPENDENCIES) $(EXTRA_lt_expand_DEPENDENCIES) 
	@rm -f lt-expand$(EXEEXT)
	$(AM_V_CXXLD)$(lt_expand_LINK) $(lt_expand_OBJECTS) $(lt_expand_LDADD) $(LIBS)

lt-print$(EXEEXT): $(lt_print_OBJECTS) $(lt_print_DEPENDENCIES) $(EXTRA_lt_print_DEPENDENCIES) 
	@rm -f lt-print$(EXEEXT)
	$(AM_V_CXXLD)$(lt_print_LINK) $(lt_print_OBJECTS) $(lt_print_LDADD) $(LIBS)

lt-proc$(EXEEXT): $(lt_proc_OBJECTS) $(lt_proc_DEPENDENCIES) $(EXTRA_lt_proc_DEPENDENCIES) 
	@rm -f lt-proc$(EXEEXT)
	$(AM_V_CXXLD)$(lt_proc_LINK) $(lt_proc_OBJECTS) $(lt_proc_LDADD) $(LIBS)

lt-tmxcomp$(EXEEXT): $(lt_tmxcomp_OBJECTS) $(lt_tmxcomp_DEPENDENCIES) $(EXTRA_lt_tmxcomp_DEPENDENCIES) 
	@rm -f lt-tmxcomp$(EXEEXT)
	$(AM_V_CXXLD)$(lt_tmxcomp_LINK) $(lt_tmxcomp_OBJECTS) $(lt_tmxcomp_LDADD) $(LIBS)

lt-tmxproc$(EXEEXT): $(lt_tmxproc_OBJECTS) $(lt_tmxproc_DEPENDENCIES) $(EXTRA_lt_tmxproc_DEPENDENCIES) 
	@rm -f lt-tmxproc$(EXEEXT)
	$(AM_V_CXXLD)$(lt_tmxproc_LINK) $(lt_tmxproc_OBJECTS) $(lt_tmxproc_LDADD) $(LIBS)

lt-trim$(EXEEXT): $(lt_trim_OBJECTS) $(lt_trim_DEPENDENCIES) $(EXTRA_lt_trim_DEPENDENCIES) 
	@rm -f lt-trim$(EXEEXT)
	$(AM_V_CXXLD)$(lt_trim_LINK) $(lt_trim_OBJECTS) $(lt_trim_LDADD) $(LIBS)

mostlyclean-compile:
	-rm -f *.$(OBJEXT)

distclean-compile:
	-rm -f *.tab.c

include ./$(DEPDIR)/alphabet.Plo
include ./$(DEPDIR)/att_compiler.Plo
include ./$(DEPDIR)/compiler.Plo
include ./$(DEPDIR)/compression.Plo
include ./$(DEPDIR)/entry_token.Plo
include ./$(DEPDIR)/expander.Plo
include ./$(DEPDIR)/fst_processor.Plo
include ./$(DEPDIR)/lt_comp.Po
include ./$(DEPDIR)/lt_expand.Po
include ./$(DEPDIR)/lt_locale.Plo
include ./$(DEPDIR)/lt_print.Po
include ./$(DEPDIR)/lt_proc.Po
include ./$(DEPDIR)/lt_tmxcomp.Po
include ./$(DEPDIR)/lt_tmxproc.Po
include ./$(DEPDIR)/lt_trim.Po
include ./$(DEPDIR)/match_exe.Plo
include ./$(DEPDIR)/match_node.Plo
include ./$(DEPDIR)/match_state.Plo
include ./$(DEPDIR)/node.Plo
include ./$(DEPDIR)/pattern_list.Plo
include ./$(DEPDIR)/regexp_compiler.Plo
include ./$(DEPDIR)/sorted_vector.Plo
include ./$(DEPDIR)/state.Plo
include ./$(DEPDIR)/tmx_compiler.Plo
include ./$(DEPDIR)/trans_exe.Plo
include ./$(DEPDIR)/transducer.Plo
include ./$(DEPDIR)/xml_parse_util.Plo

.cc.o:
	$(AM_V_CXX)$(CXXCOMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
#	$(AM_V_CXX)source='$<' object='$@' libtool=no \
#	DEPDIR=$(DEPDIR) $(CXXDEPMODE) $(depcomp) \
#	$(AM_V_CXX_no)$(CXXCOMPILE) -c -o $@ $<

.cc.obj:
	$(AM_V_CXX)$(CXXCOMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ `$(CYGPATH_W) '$<'`
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Po
#	$(AM_V_CXX)source='$<' object='$@' libtool=no \
#	DEPDIR=$(DEPDIR) $(CXXDEPMODE) $(depcomp) \
#	$(AM_V_CXX_no)$(CXXCOMPILE) -c -o $@ `$(CYGPATH_W) '$<'`

.cc.lo:
	$(AM_V_CXX)$(LTCXXCOMPILE) -MT $@ -MD -MP -MF $(DEPDIR)/$*.Tpo -c -o $@ $<
	$(AM_V_at)$(am__mv) $(DEPDIR)/$*.Tpo $(DEPDIR)/$*.Plo
#	$(AM_V_CXX)source='$<' object='$@' libtool=yes \
#	DEPDIR=$(DEPDIR) $(CXXDEPMODE) $(depcomp) \
#	$(AM_V_CXX_no)$(LTCXXCOMPILE) -c -o $@ $<

mostlyclean-libtool:
	-rm -f *.lo

clean-libtool:
	-rm -rf .libs _libs
install-man1: $(man_MANS)
	@$(NORMAL_INSTALL)
	@list1=''; \
	list2='$(man_MANS)'; \
	test -n "$(man1dir)" \
	  && test -n "`echo $$list1$$list2`" \
	  || exit 0; \
	echo " $(MKDIR_P) '$(DESTDIR)$(man1dir)'"; \
	$(MKDIR_P) "$(DESTDIR)$(man1dir)" || exit 1; \
	{ for i in $$list1; do echo "$$i"; done;  \
	if test -n "$$list2"; then \
	  for i in $$list2; do echo "$$i"; done \
	    | sed -n '/\.1[a-z]*$$/p'; \
	fi; \
	} | while read p; do \
	  if test -f $$p; then d=; else d="$(srcdir)/"; fi; \
	  echo "$$d$$p"; echo "$$p"; \
	done | \
	sed -e 'n;s,.*/,,;p;h;s,.*\.,,;s,^[^1][0-9a-z]*$$,1,;x' \
	      -e 's,\.[0-9a-z]*$$,,;$(transform);G;s,\n,.,' | \
	sed 'N;N;s,\n, ,g' | { \
	list=; while read file base inst; do \
	  if test "$$base" = "$$inst"; then list="$$list $$file"; else \
	    echo " $(INSTALL_DATA) '$$file' '$(DESTDIR)$(man1dir)/$$inst'"; \
	    $(INSTALL_DATA) "$$file" "$(DESTDIR)$(man1dir)/$$inst" || exit $$?; \
	  fi; \
	done; \
	for i in $$list; do echo "$$i"; done | $(am__base_list) | \
	while read files; do \
	  test -z "$$files" || { \
	    echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(man1dir)'"; \
	    $(INSTALL_DATA) $$files "$(DESTDIR)$(man1dir)" || exit $$?; }; \
	done; }

uninstall-man1:
	@$(NORMAL_UNINSTALL)
	@list=''; test -n "$(man1dir)" || exit 0; \
	files=`{ for i in $$list; do echo "$$i"; done; \
	l2='$(man_MANS)'; for i in $$l2; do echo "$$i"; done | \
	  sed -n '/\.1[a-z]*$$/p'; \
	} | sed -e 's,.*/,,;h;s,.*\.,,;s,^[^1][0-9a-z]*$$,1,;x' \
	      -e 's,\.[0-9a-z]*$$,,;$(transform);G;s,\n,.,'`; \
	dir='$(DESTDIR)$(man1dir)'; $(am__uninstall_files_from_dir)
install-lttoolboxDATA: $(lttoolbox_DATA)
	@$(NORMAL_INSTALL)
	@list='$(lttoolbox_DATA)'; test -n "$(lttoolboxdir)" || list=; \
	if test -n "$$list"; then \
	  echo " $(MKDIR_P) '$(DESTDIR)$(lttoolboxdir)'"; \
	  $(MKDIR_P) "$(DESTDIR)$(lttoolboxdir)" || exit 1; \
	fi; \
	for p in $$list; do \
	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
	  echo "$$d$$p"; \
	done | $(am__base_list) | \
	while read files; do \
	  echo " $(INSTALL_DATA) $$files '$(DESTDIR)$(lttoolboxdir)'"; \
	  $(INSTALL_DATA) $$files "$(DESTDIR)$(lttoolboxdir)" || exit $$?; \
	done

uninstall-lttoolboxDATA:
	@$(NORMAL_UNINSTALL)
	@list='$(lttoolbox_DATA)'; test -n "$(lttoolboxdir)" || list=; \
	files=`for p in $$list; do echo $$p; done | sed -e 's|^.*/||'`; \
	dir='$(DESTDIR)$(lttoolboxdir)'; $(am__uninstall_files_from_dir)
install-library_includeHEADERS: $(library_include_HEADERS)
	@$(NORMAL_INSTALL)
	@list='$(library_include_HEADERS)'; test -n "$(library_includedir)" || list=; \
	if test -n "$$list"; then \
	  echo " $(MKDIR_P) '$(DESTDIR)$(library_includedir)'"; \
	  $(MKDIR_P) "$(DESTDIR)$(library_includedir)" || exit 1; \
	fi; \
	for p in $$list; do \
	  if test -f "$$p"; then d=; else d="$(srcdir)/"; fi; \
	  echo "$$d$$p"; \
	done | $(am__base_list) | \
	while read files; do \
	  echo " $(INSTALL_HEADER) $$files '$(DESTDIR)$(library_includedir)'"; \
	  $(INSTALL_HEADER) $$files "$(DESTDIR)$(library_includedir)" || exit $$?; \
	done

uninstall-library_includeHEADERS:
	@$(NORMAL_UNINSTALL)
	@list='$(library_include_HEADERS)'; test -n "$(library_includedir)" || list=; \
	files=`for p in $$list; do echo $$p; done | sed -e 's|^.*/||'`; \
	dir='$(DESTDIR)$(library_includedir)'; $(am__uninstall_files_from_dir)

ID: $(am__tagged_files)
	$(am__define_uniq_tagged_files); mkid -fID $$unique
tags: tags-am
TAGS: tags

tags-am: $(TAGS_DEPENDENCIES) $(am__tagged_files)
	set x; \
	here=`pwd`; \
	$(am__define_uniq_tagged_files); \
	shift; \
	if test -z "$(ETAGS_ARGS)$$*$$unique"; then :; else \
	  test -n "$$unique" || unique=$$empty_fix; \
	  if test $$# -gt 0; then \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      "$$@" $$unique; \
	  else \
	    $(ETAGS) $(ETAGSFLAGS) $(AM_ETAGSFLAGS) $(ETAGS_ARGS) \
	      $$unique; \
	  fi; \
	fi
ctags: ctags-am

CTAGS: ctags
ctags-am: $(TAGS_DEPENDENCIES) $(am__tagged_files)
	$(am__define_uniq_tagged_files); \
	test -z "$(CTAGS_ARGS)$$unique" \
	  || $(CTAGS) $(CTAGSFLAGS) $(AM_CTAGSFLAGS) $(CTAGS_ARGS) \
	     $$unique

GTAGS:
	here=`$(am__cd) $(top_builddir) && pwd` \
	  && $(am__cd) $(top_srcdir) \
	  && gtags -i $(GTAGS_ARGS) "$$here"
cscopelist: cscopelist-am

cscopelist-am: $(am__tagged_files)
	list='$(am__tagged_files)'; \
	case "$(srcdir)" in \
	  [\\/]* | ?:[\\/]*) sdir="$(srcdir)" ;; \
	  *) sdir=$(subdir)/$(srcdir) ;; \
	esac; \
	for i in $$list; do \
	  if test -f "$$i"; then \
	    echo "$(subdir)/$$i"; \
	  else \
	    echo "$$sdir/$$i"; \
	  fi; \
	done >> $(top_builddir)/cscope.files

distclean-tags:
	-rm -f TAGS ID GTAGS GRTAGS GSYMS GPATH tags

distdir: $(DISTFILES)
	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	topsrcdirstrip=`echo "$(top_srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
	list='$(DISTFILES)'; \
	  dist_files=`for file in $$list; do echo $$file; done | \
	  sed -e "s|^$$srcdirstrip/||;t" \
	      -e "s|^$$topsrcdirstrip/|$(top_builddir)/|;t"`; \
	case $$dist_files in \
	  */*) $(MKDIR_P) `echo "$$dist_files" | \
			   sed '/\//!d;s|^|$(distdir)/|;s,/[^/]*$$,,' | \
			   sort -u` ;; \
	esac; \
	for file in $$dist_files; do \
	  if test -f $$file || test -d $$file; then d=.; else d=$(srcdir); fi; \
	  if test -d $$d/$$file; then \
	    dir=`echo "/$$file" | sed -e 's,/[^/]*$$,,'`; \
	    if test -d "$(distdir)/$$file"; then \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    if test -d $(srcdir)/$$file && test $$d != $(srcdir); then \
	      cp -fpR $(srcdir)/$$file "$(distdir)$$dir" || exit 1; \
	      find "$(distdir)/$$file" -type d ! -perm -700 -exec chmod u+rwx {} \;; \
	    fi; \
	    cp -fpR $$d/$$file "$(distdir)$$dir" || exit 1; \
	  else \
	    test -f "$(distdir)/$$file" \
	    || cp -p $$d/$$file "$(distdir)/$$file" \
	    || exit 1; \
	  fi; \
	done
check-am: all-am
check: check-am
all-am: Makefile $(LTLIBRARIES) $(PROGRAMS) $(MANS) $(DATA) $(HEADERS) \
		lttoolbox_config.h
install-binPROGRAMS: install-libLTLIBRARIES

installdirs:
	for dir in "$(DESTDIR)$(libdir)" "$(DESTDIR)$(bindir)" "$(DESTDIR)$(man1dir)" "$(DESTDIR)$(lttoolboxdir)" "$(DESTDIR)$(library_includedir)"; do \
	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
	done
install: install-am
install-exec: install-exec-am
install-data: install-data-am
uninstall: uninstall-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am

installcheck: installcheck-am
install-strip:
	if test -z '$(STRIP)'; then \
	  $(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	    install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	      install; \
	else \
	  $(MAKE) $(AM_MAKEFLAGS) INSTALL_PROGRAM="$(INSTALL_STRIP_PROGRAM)" \
	    install_sh_PROGRAM="$(INSTALL_STRIP_PROGRAM)" INSTALL_STRIP_FLAG=-s \
	    "INSTALL_PROGRAM_ENV=STRIPPROG='$(STRIP)'" install; \
	fi
mostlyclean-generic:

clean-generic:
	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)

distclean-generic:
	-test -z "$(CONFIG_CLEAN_FILES)" || rm -f $(CONFIG_CLEAN_FILES)
	-test . = "$(srcdir)" || test -z "$(CONFIG_CLEAN_VPATH_FILES)" || rm -f $(CONFIG_CLEAN_VPATH_FILES)

maintainer-clean-generic:
	@echo "This command is intended for maintainers to use"
	@echo "it deletes files that may require special tools to rebuild."
clean: clean-am

clean-am: clean-binPROGRAMS clean-generic clean-libLTLIBRARIES \
	clean-libtool mostlyclean-am

distclean: distclean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
distclean-am: clean-am distclean-compile distclean-generic \
	distclean-hdr distclean-tags

dvi: dvi-am

dvi-am:

html: html-am

html-am:

info: info-am

info-am:

install-data-am: install-library_includeHEADERS install-lttoolboxDATA \
	install-man

install-dvi: install-dvi-am

install-dvi-am:

install-exec-am: install-binPROGRAMS install-libLTLIBRARIES

install-html: install-html-am

install-html-am:

install-info: install-info-am

install-info-am:

install-man: install-man1

install-pdf: install-pdf-am

install-pdf-am:

install-ps: install-ps-am

install-ps-am:

installcheck-am:

maintainer-clean: maintainer-clean-am
	-rm -rf ./$(DEPDIR)
	-rm -f Makefile
maintainer-clean-am: distclean-am maintainer-clean-generic

mostlyclean: mostlyclean-am

mostlyclean-am: mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool

pdf: pdf-am

pdf-am:

ps: ps-am

ps-am:

uninstall-am: uninstall-binPROGRAMS uninstall-libLTLIBRARIES \
	uninstall-library_includeHEADERS uninstall-lttoolboxDATA \
	uninstall-man

uninstall-man: uninstall-man1

.MAKE: all install-am install-strip

.PHONY: CTAGS GTAGS TAGS all all-am check check-am clean \
	clean-binPROGRAMS clean-generic clean-libLTLIBRARIES \
	clean-libtool cscopelist-am ctags ctags-am distclean \
	distclean-compile distclean-generic distclean-hdr \
	distclean-libtool distclean-tags distdir dvi dvi-am html \
	html-am info info-am install install-am install-binPROGRAMS \
	install-data install-data-am install-dvi install-dvi-am \
	install-exec install-exec-am install-html install-html-am \
	install-info install-info-am install-libLTLIBRARIES \
	install-library_includeHEADERS install-lttoolboxDATA \
	install-man install-man1 install-pdf install-pdf-am install-ps \
	install-ps-am install-strip installcheck installcheck-am \
	installdirs maintainer-clean maintainer-clean-generic \
	mostlyclean mostlyclean-compile mostlyclean-generic \
	mostlyclean-libtool pdf pdf-am ps ps-am tags tags-am uninstall \
	uninstall-am uninstall-binPROGRAMS uninstall-libLTLIBRARIES \
	uninstall-library_includeHEADERS uninstall-lttoolboxDATA \
	uninstall-man uninstall-man1


# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
