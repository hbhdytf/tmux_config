#!/bin/bash

###tmux install script
###sandy 2016-08-18
SOFT_PATH=$HOME/.tmux/  

if [ ! -d $SOFT_PATH ] ;then  
mkdir -p $SOFT_PATH  
fi  

function die()
{
    echo "${@}"
    exit 1
}

install()
{
for i in $HOME/.tmux $HOME/.tmux.conf; do
  if [[ ( -e $i ) || ( -h $i ) ]]; then
    echo "${i} has been renamed to ${i}.old"
    mv "${i}" "${i}.old" || die "Could not move ${i} to ${i}.old"
  fi
done

#git clone git://github.com/yesmeck/tmuxrc.git $HOME/.tmux \
git clone git://github.com/hbhdytf/tmux_config.git $SOFT_PATH \
    || die "Could not clone the repository to ${HOME}/.tmux"

}

yesmeck()
{
    ln -s $HOME/.tmux/yesmeck/tmux.conf $HOME/.tmux.conf
    echo "yesmeck install successfully."
}

gpakosz()
{
    ln -s $HOME/.tmux/gpakosz/.tmux.conf $HOME/.tmux.conf
    cp $HOME/.tmux/gpakosz/.tmux.conf.local $HOME/
    echo "Install successfully."
}
update()
{
    echo "update"
}

###case menu #####  
  
case $1 in  
update )  
update  
;;  
  
install )  
    case $2 in
    "") echo "USAGE:$0 install [yesmeck|gpakosz]";exit;;
    gpakosz) install; gpakosz;;
    yesmeck) install; yesmeck;;
    esac  
;;  

"")
echo "Default install!";
install; 
gpakosz
;;

* )  
  
echo "USAGE:$0 {install or update or exit}"
exit  
esac  
