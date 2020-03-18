export PYENV_ROOT="$HOME/.pyenv"
export HTTPS=true
export FINIT=0

function finit
  nvm use default
  pyenv init - | source
  pyenv shell 3.7.4 2.7.16
  export FINIT=1
end

function vim
  if test $FINIT = 0
    finit
  end
  nvim $argv
end

