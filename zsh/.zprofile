# ──────────────────────────────
# Gruvbox Dark Hard Palette
# ──────────────────────────────
export gb_bg0="#1d2021"
export gb_bg1="#3c3836"
export gb_bg2="#504945"
export gb_fg0="#ebdbb2"
export gb_red="#cc241d"
export gb_green="#98971a"
export gb_yellow="#d79921"
export gb_blue="#458588"
export gb_purple="#b16286"
export gb_aqua="#689d6a"
export gb_orange="#d65d0e"
export gb_gray="#928374"
# ──────────────────────────────
# FZF Gruvbox Theme
# ──────────────────────────────
export FZF_DEFAULT_OPTS="
    --color=fg:$gb_fg0,bg:$gb_bg0,hl:$gb_yellow
    --color=fg+:$gb_fg0,bg+:$gb_bg1,hl+:$gb_yellow
    --color=border:$gb_bg2,header:$gb_blue,gutter:$gb_bg0
    --color=spinner:$gb_orange,info:$gb_aqua
    --color=pointer:$gb_blue,marker:$gb_red,prompt:$gb_gray"
