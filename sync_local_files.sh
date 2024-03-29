# pull local files into this repo

set BASE_CONFIG_PATH ~/.config
set REG_UPDATE_PATH ./regularly_updated/.config

cp $BASE_CONFIG_PATH/nvim/init.vim $REG_UPDATE_PATH/nvim/
cp -r $BASE_CONFIG_PATH/nvim/lua/ $REG_UPDATE_PATH/nvim/lua/
cp -r $BASE_CONFIG_PATH/nvim/snippets/ $REG_UPDATE_PATH/nvim/snippets/
cp $BASE_CONFIG_PATH/nvim/spell/en.utf-8.add $REG_UPDATE_PATH/nvim/spell/

cp -r $BASE_CONFIG_PATH/fish/ $REG_UPDATE_PATH/fish

cp ~/.taskrc ./regularly_updated/
cp ~/.hushlogin ./regularly_updated/
cp ~/.bashrc ./regularly_updated/

