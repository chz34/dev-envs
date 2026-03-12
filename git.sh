# git signing using ssh key
git config --global gpg.format ssh
git config --global user.signingkey "$(ls ~/.ssh/*.pub)"
git config --global commit.gpgsign true
