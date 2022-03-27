# readme.md

既にファイルがある場合は念のためバックアップをとっておく

```
cd ~
mkdir ~/tmp
mv ~/.vimrc ~/tmp
mv ~/.gvimrc ~/tmp
mv ~/.vim ~/tmp

```

git cloneして、シンボリックを貼る

```
git clone https://github.com/<your account>/dotfiles.git
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/vimfiles ~/.vim

```