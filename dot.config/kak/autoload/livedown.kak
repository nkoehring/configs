decl int livedown_port 8642

def livedown-start %{ %sh{
  (
    livedown start --open --port "$kak_opt_livedown_port" "$kak_buffile"
  ) >/dev/null 2>&1 </dev/null &
}}

def livedown-stop %{ %sh{
  livedown stop --port "$kak_opt_livedown_port"
}}
