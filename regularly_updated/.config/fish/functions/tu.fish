function tu --description 'Update tasks in git repo'
  cd ~/.task/;
  gau;
  gcm "Update tasks";
  gps;
  cd -;
end
