#
# == Styles
#
# Styles define various properties of styleable items in a CSS-like syntax.
#
# If no background color is given no color will be set. This will ensure a
# custom background pixmap won't be overwritten.
#
# Following properties are available for most the styles:
#
# [*foreground*] Foreground text color
# [*background*] Background color
# [*margin*]     Outer spacing
# [*border*]     Border color and size
# [*padding*]    Inner spacing
# [*font*]       Font string (xftontsel or xft)
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Styles

# Style for all style elements
style :all do
  background  C[:brown]
  icon        "#757575"
  border      "#303030", 0
  padding     0, 3
  #font        "-*-webbycaps-*-*-*-*-7-*-*-*-*-*-*-*"
  font        "xft:monofur:pixelsize=14"
  #font        "xft:sans-8"
end

# Style for the all views
style :views do
  foreground    "#757575"
  border_top    C[:brown], 1
  border_bottom C[:brown], 1
  padding_top -2
  padding_bottom -2

  # Style for the active views
  style :focus do
    foreground    C[:orange]
  end

  # Style for urgent window titles and views
  style :urgent do
    foreground  C[:red]
    border_top    C[:mild_orange], 2
    border_bottom C[:mild_orange], 2
  end

  # Style for occupied views (views with clients)
  style :occupied do
    foreground  "#b8b8b8"
  end
end

# Style for sublets
style :sublets do
  foreground  C[:orange]
end

# Style for separator
style :separator do
  foreground  "#757575"
  separator   "|"
end

# Style for focus window title
style :title do
  foreground  C[:orange]
end

# Style for active/inactive windows
style :clients do
  active    "#303030", 2
  inactive  "#202020", 2
  margin    0
  width     50
end

# Style for subtle
style :subtle do
  margin      0, 0, 0, 0
  panel       "#2D2815"
  background  "#3d3d3d"
  stipple     "#757575"
end
