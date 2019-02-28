export XDG_CONFIG_HOME=~/.config
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"
export VAGRANT_HOME="/Volumes/My\ Passport/vmbox/.vagrant.d"
export PATH=$VAGRANT_HOME:$PATH


# vim builder
function makeInstallLatestVim() {
  ghq get vim/vim --update;
  pushd `ghq list vim/vim --full-path`;
  git checkout master;

  ./configure \
    --with-features=huge \
    --enable-luainterp \
    --with-lua-prefix=/usr/local \
    --enable-perlinterp \
    --enable-pythoninterp \
    --enable-python3interp \
    --enable-rubyinterp \
    --enable-fail-if-missing;

  make;
  sudo make install;
  popd
}

alias vup=makeInstallLatestVim
alias vi=vim
alias v=vim

setopt AUTO_CD
cdpath=(.. ~ ~/src)
