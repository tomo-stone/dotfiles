function fish_prompt --description 'Write out the prompt'
	set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l prompt_symbol ''
  switch $USER
    case root toor; set prompt_symbol '#'
    case '*';  set prompt_symbol '$'
  end
  set_color --bold green white
  printf "%s@%s" $USER (hostname -s)
  set_color normal
  printf ":"
  set_color --bold blue white
  printf "%s " (prompt_pwd)
  set_color normal
  printf "%s " $prompt_symbol 
end

