System configuration files
==========================

Here you can find all relevant configurations. This is thought equally as
public viewport and backup. I appreciate suggestions, rants and bug reports :)

requirements
------------

My zshrc expects the zgen repository checked out in `~/src/pkg/`:

```sh
mkdir -p ~/src/pkg
git clone https://github.com/tarjoilija/zgen.git ~/src/pkg/zgen
```

Wayland
-------

For a while I used wayland and sway. You can check out [this reddit post](https://www.reddit.com/r/unixporn/comments/d0fuc1/sway_mario_plays_the_blues/) for some pretty imagery. My current setup is back to X11 because I needed some things that don't work on a pure wayland setup yet.

If you want to check out the wayland config (which is most probably very outdated after so many years), you can find [the wayland branch on github](https://github.com/nkoehring/configs/tree/wayland).

