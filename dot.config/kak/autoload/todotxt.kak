# Detection
# ‾‾‾‾‾‾‾‾‾

hook global BufCreate .*[.]?(todo\.txt) %{
    set buffer filetype todotxt

    def -hidden todo-done2bottom %{
        try %{
            exec '%<a-s><a-k>^x <ret>dge<a-p>:echo %reg{#} items moved<ret>'
        }
    }
    def -hidden todo-a2top %{
        try %{
            exec '%<a-s><a-k>^\(A\) <ret>dgg<a-P>:echo %reg{#} items moved<ret>'
        }
    }
    def -hidden todo-b2top %{
        try %{
            exec '%<a-s><a-k>^\(B\) <ret>dgg<a-P>:echo %reg{#} items moved<ret>'
        }
    }
    def -hidden todo-c2top %{
        try %{
            exec '%<a-s><a-k>^\(C\) <ret>dgg<a-P>:echo %reg{#} items moved<ret>'
        }
    }
    def -docstring 'sort items by priority and state' todo-sort %{
      exec '%:todo-c2top<ret>:todo-b2top<ret>:todo-a2top<ret>:todo-done2bottom<ret>'
    }
    def -docstring 'mark item under cursor as done' todo-mark-done %{
        try %{
            exec 'xs\([ABC]\) <ret>cx <esc>'
        } catch %{
            exec 'ghix <esc>'
        }
    }
    def -docstring 'mark item under cursor as high priority' -params 1 todo-mark-prio %{
        try %{
            exec "xs^(\([ABC]\)|x) <ret>c(%arg{1}) <esc>"
        } catch %{
            exec "ghi(%arg{1}) <esc>"
        }
    }
}

face global TodoPrioA red+b
face global TodoPrioB yellow+b
face global TodoPrioC cyan+b
face global TodoDate default+b


add-highlighter global/todotxt group
add-highlighter global/todotxt/comment regex "^x ([^\n]+)" 0:comment                   # done items
add-highlighter global/todotxt/prio-a regex "^\(A\) ([^\n]+)" 0:TodoPrioA              # priority (A)
add-highlighter global/todotxt/prio-b regex "^\(B\) ([^\n]+)" 0:TodoPrioB              # priority (B)
add-highlighter global/todotxt/prio-c regex "^\(C\) ([^\n]+)" 0:TodoPrioC              # priority (C)
add-highlighter global/todotxt/key-value regex "([^:|^ ]+:)([^ |^\n]+)" 0:value 1:type # key:value
add-highlighter global/todotxt/keyword regex "(\+[^\+|^ |^\n]+)" 0:keyword             # +project
add-highlighter global/todotxt/meta regex "(@[^\+|^ |^\n]+)" 0:meta                    # @context
add-highlighter global/todotxt/date regex "(\d{4}-\d{2}-\d{2})" 0:TodoDate             # date

hook -group todotxt-highlight global WinSetOption filetype=todotxt %{ add-highlighter window ref todotxt }
hook -group todotxt-highlight global WinSetOption filetype=(?!todotxt).* %{ remove-highlighter window/todotxt }

