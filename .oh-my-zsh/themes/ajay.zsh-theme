function virtualenv_info {
    [ $CONDA_DEFAULT_ENV ] && echo "($CONDA_DEFAULT_ENV) "
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

# %{$FG[239]%}[%{$reset_color%}    %{$FG[239]%}]%{$reset_color%}
TIME="%{$FG[239]%}[%{$reset_color%} %{$FG[033]%}%*%{$reset_color%} %{$FG[239]%}]%{$reset_color%} %{$FG[033]%}-%{$reset_color%} %{$FG[239]%}[%{$reset_color%} %{$FG[033]%}%D%{$reset_color%} %{$FG[239]%}]%{$reset_color%}"
function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}
# +%I:%M
# PROMPT="╭─%{$FG[033]%}[%*] - [%D] %{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) 

PROMPT="╭─%{$FG[202]%}[%{$reset_color%} %{$FG[033]%}%*%{$reset_color%} %{$FG[202]%}]%{$reset_color%} %{$FG[033]%}-%{$reset_color%} %{$FG[202]%}[%{$reset_color%} %{$FG[033]%}%D%{$reset_color%} %{$FG[202]%}]%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) 
╰─\$(virtualenv_info)\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
