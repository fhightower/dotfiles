# pull local files into this repo

set BASE_CONFIG_PATH ~/.config
set REG_UPDATE_PATH ./regularly_updated/.config

cp $BASE_CONFIG_PATH/nvim/init.vim $REG_UPDATE_PATH/nvim/
cp $BASE_CONFIG_PATH/nvim/spell/en.utf-8.add $REG_UPDATE_PATH/nvim/spell/

cp -r $BASE_CONFIG_PATH/fish/ $REG_UPDATE_PATH/fish

cp ~/.taskrc ./regularly_updated/

