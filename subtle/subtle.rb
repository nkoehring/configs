# -*- encoding: utf-8 -*-
#
# Author::  Christoph Kappel <unexist@subforge.org>
# Version:: $Id: data/subtle.rb,v 3182 2012/02/04 16:39:33 unexist $
# License:: GNU GPLv2
#
# = Subtle default configuration
#
# This file will be installed as default and can also be used as a starter for
# an own custom configuration file. The system wide config usually resides in
# +/etc/xdg/subtle+ and the user config in +HOME/.config/subtle+, both locations
# are dependent on the locations specified by +XDG_CONFIG_DIRS+ and
# +XDG_CONFIG_HOME+.
#

$LOAD_PATH.unshift "/usr/share/subtle-contrib-hg/"
require "launcher.rb"
Subtle::Contrib::Launcher.fonts = [
  "xft:monofur:pixelsize=80",
  "xft:monofur:pixelsize=16",
]

C = {
  :orange => "#FD971F",
  :mild_orange => "#A36D2E",
  :brown  => "#2D2815",
  :red    => "#F92672",
  :yellow => "#FECF35",
  :green  => "#A6E22E"
}

load_config 'options.rb'
load_config 'gravities.rb'
load_config 'styles.rb'
load_config 'panel.rb'
load_config 'grabs.rb'
load_config 'tags.rb'
load_config 'views.rb'
load_config 'sublets.rb'
load_config 'hooks.rb'

# vim:ts=2:bs=2:sw=2:et:fdm=marker
