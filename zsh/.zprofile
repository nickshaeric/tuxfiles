# zprofile@mbookair
# Nord palette
export nd_bg0="#2E3440"    # Nord0  — darkest bg
export nd_bg1="#3B4252"    # Nord1  — subtle bg
export nd_bg2="#434C5E"    # Nord2  — mid bg
export nd_bg3="#4C566A"    # Nord3  — lightest dark
export nd_fg0="#D8DEE9"    # Nord4  — default fg
export nd_fg1="#E5E9F0"    # Nord5  — light fg
export nd_fg2="#ECEFF4"    # Nord6  — brightest fg
export nd_teal="#8FBCBB"   # Nord7  — teal
export nd_cyan="#88C0D0"   # Nord8  — signature cyan
export nd_blue="#81A1C1"   # Nord9  — mid blue
export nd_dblue="#5E81AC"  # Nord10 — deep blue
export nd_red="#BF616A"    # Nord11 — red
export nd_orange="#D08770" # Nord12 — orange
export nd_yellow="#EBCB8B" # Nord13 — yellow
export nd_green="#A3BE8C"  # Nord14 — green
export nd_purple="#B48EAD" # Nord15 — purple

# fzf nord theme
export FZF_DEFAULT_OPTS="
    --color=fg:$nd_fg0,bg:$nd_bg0,hl:$nd_cyan
    --color=fg+:$nd_fg1,bg+:$nd_bg1,hl+:$nd_cyan
    --color=border:$nd_bg2,header:$nd_blue,gutter:$nd_bg0
    --color=spinner:$nd_teal,info:$nd_teal
    --color=pointer:$nd_cyan,marker:$nd_red,prompt:$nd_bg3"
