my dotfiles
========

- vim
- tmux
- bashrc


## Usage

- command line
```
git clone https://github.com/tomosnowbug/dotfiles.git ~/dotfiles
cd ~/dotfiles
./createlinks.sh
./cloneneobundle.sh
vim
```

## Usage (connect by ssh)

- .ssh/config

```
Host github.com
User git
Hostname ssh.github.com
Port 443
ProxyCommand /bin/nc -X connect -x proxy.example.com:8080 %h %p
IdentityFile ~/.ssh/id_rsa
```

- command line
```
git config --global http.proxy http://proxy.example.com:8080
git config --global https.proxy http://proxy.example.com:8080
git config --global url."https://".insteadOf git://
git clone ssh://git@github.com/tomosnowbug/dotfiles.git ~/git/dotfiles
cd ~/git/dotfiles
./createlinks.sh
./cloneneobundle.sh
vim
```


