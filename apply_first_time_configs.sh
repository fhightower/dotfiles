# apply the first time configs in this repo to a computer

cd ~;
git clone --depth=1 https://github.com/fhightower/dotfiles.git;
cp -r dotfiles/first_time/ ~;
rm -rf dotfiles/
cd -;
