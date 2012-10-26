#
# == Grabs
#
# Grabs are keyboard and mouse actions within subtle, every grab can be
# assigned either to a key and/or to a mouse button combination. A grab
# consists of a chain and an action.
#
# === Finding keys
#
# The best resource for getting the correct key names is
# */usr/include/X11/keysymdef.h*, but to make life easier here are some hints
# about it:
#
# * Numbers and letters keep their names, so *a* is *a* and *0* is *0*
# * Keypad keys need *KP_* as prefix, so *KP_1* is *1* on the keypad
# * Strip the *XK_* from the key names if looked up in
#   /usr/include/X11/keysymdef.h
# * Keys usually have meaningful english names
# * Modifier keys have special meaning (Alt (A), Control (C), Meta (M),
#   Shift (S), Super (W))
#
# === Chaining
#
# Chains are a combination of keys and modifiers to one or a list of keys
# and can be used in various ways to trigger an action. In subtle, there are
# two ways to define chains for grabs:
#
#   1. *Default*: Add modifiers to a key and use it for a grab
#
#      *Example*: grab "W-Return", "urxvt"
#
#   2. *Chain*: Define a list of grabs that need to be pressed in order
#
#      *Example*: grab "C-y Return", "urxvt"
#
# ==== Mouse buttons
#
# [*B1*]  = Button1 (Left mouse button)
# [*B2*]  = Button2 (Middle mouse button)
# [*B3*]  = Button3 (Right mouse button)
# [*B4*]  = Button4 (Mouse wheel up)
# [*B5*]  = Button5 (Mouse wheel down)
# [*...*]
# [*B20*] = Button20 (Are you sure that this is a mouse and not a keyboard?)
#
# ==== Modifiers
#
# [*A*] = Alt key (Mod1)
# [*C*] = Control key
# [*M*] = Meta key (Mod3)
# [*S*] = Shift key
# [*W*] = Super/Windows key (Mod4)
# [*G*] = Alt Gr (Mod5)
#
# === Action
#
# An action is something that happens when a grab is activated, this can be one
# of the following:
#
# [*symbol*] Run a subtle action
# [*string*] Start a certain program
# [*array*]  Cycle through gravities
# [*lambda*] Run a Ruby proc
#
# === Example
#
# This will create a grab that starts a urxvt when Alt+Enter are pressed:
#
#   grab "A-Return", "urxvt"
#   grab "C-a c",    "urxvt"
#
# === Link
#
# http://subforge.org/projects/subtle/wiki/Grabs
#

# Jump to view1, view2, ...
grab "W-S-1", :ViewJump1
grab "W-S-2", :ViewJump2
grab "W-S-3", :ViewJump3
grab "W-S-4", :ViewJump4
grab "W-S-5", :ViewJump5
grab "W-S-6", :ViewJump6
grab "W-S-7", :ViewJump7
grab "W-S-8", :ViewJump8
grab "W-S-9", :ViewJump9

# Switch current view
grab "W-1", :ViewSwitch1
grab "W-2", :ViewSwitch2
grab "W-3", :ViewSwitch3
grab "W-4", :ViewSwitch4
grab "W-5", :ViewSwitch5
grab "W-6", :ViewSwitch6
grab "W-7", :ViewSwitch7
grab "W-8", :ViewSwitch8
grab "W-9", :ViewSwitch9

# Select next and prev view */
grab "KP_Add",      :ViewNext
grab "KP_Subtract", :ViewPrev
grab "W-Right",     :ViewNext
grab "W-Left",      :ViewPrev

# Move mouse to screen1, screen2, ...
grab "W-A-1", :ScreenJump1
grab "W-A-2", :ScreenJump2
grab "W-A-3", :ScreenJump3
grab "W-A-4", :ScreenJump4

# Force reload of config and sublets
grab "W-C-r", :SubtleReload

# Force restart of subtle
grab "W-C-S-r", :SubtleRestart

# Quit subtle
grab "W-C-q", :SubtleQuit

# Move current window
grab "W-B1", :WindowMove

# Resize current window
grab "W-B3", :WindowResize

# Toggle floating mode of window
grab "W-space", :WindowFloat

# Toggle fullscreen mode of window
grab "W-f", :WindowFull

# Toggle sticky mode of window (will be visible on all views)
grab "W-S-s", :WindowStick

# Toggle zaphod mode of window (will span across all screens)
grab "W-equal", :WindowZaphod

# Raise window
grab "W-plus", :WindowRaise

# Lower window
grab "W-minus", :WindowLower

# Select next windows
grab "W-Left",  :WindowLeft
grab "W-Down",  :WindowDown
grab "W-Up",    :WindowUp
grab "W-Right", :WindowRight

# Kill current window
grab "W-S-k", :WindowKill

# Cycle between given gravities
#grab "W-KP_7", [ :top_left,     :top_left66,     :top_left33     ]
#grab "W-KP_8", [ :top,          :top66,          :top33          ]
#grab "W-KP_9", [ :top_right,    :top_right66,    :top_right33    ]
#grab "W-KP_4", [ :left,         :left66,         :left33         ]
#grab "W-KP_5", [ :center,       :center66,       :center33       ]
#grab "W-KP_6", [ :right,        :right66,        :right33        ]
#grab "W-KP_1", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
#grab "W-KP_2", [ :bottom,       :bottom66,       :bottom33       ]
#grab "W-KP_3", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# In case no numpad is available e.g. on notebooks
grab "W-q", [ :top_left,     :top_left66,     :top_left33     ]
grab "W-w", [ :top,          :top66,          :top33          ]
grab "W-e", [ :top_right,    :top_right66,    :top_right33    ]
grab "W-a", [ :left,         :left60,         :left33         ]
grab "W-s", [ :center,       :center66,       :center33       ]
grab "W-d", [ :right,        :right66,        :right40        ]
grab "W-y", [ :bottom_left,  :bottom_left66,  :bottom_left33  ]
grab "W-x", [ :bottom,       :bottom66,       :bottom33       ]
grab "W-c", [ :bottom_right, :bottom_right66, :bottom_right33 ]

# Exec programs
grab "W-Return", "urxvt"
grab "W-l", "i3lock -i ~/pics/screensaver.png -p win"
grab "W-p" do
  Subtle::Contrib::Launcher.run
end

# Run Ruby lambdas
grab "S-F2" do |c|
  puts c.name
end

grab "S-F3" do
  puts Subtlext::VERSION
end
