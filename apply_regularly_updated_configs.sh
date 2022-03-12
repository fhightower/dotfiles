# apply the regularly updated configs in this repo to a computer

cd ~;
git clone --depth=1 git@github.com:fhightower/dotfiles.git;
cp -r dotfiles/regularly_updated/* ~;
rm -rf dotfiles/
