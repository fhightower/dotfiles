function gpsu
  set CURR_BRANCH $(git branch --show-current);
  git push -u origin $CURR_BRANCH;
end
