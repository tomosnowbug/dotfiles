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
./cloneneobundle.sh
./createlinks.sh
vim
```

## Usage (connect by ssh)

- .ssh/config

```
Host github.com
User git
Hostname ssh.github.com
Port 443
ProxyCommand /usr/bin/nc -X connect -x proxy.example.com:8080 %h %p
IdentityFile ~/.ssh/id_rsa
```

- command line
```
git clone ssh://git@github.com/tomosnowbug/dotfiles.git ~/dotfiles
cd ~/dotfiles
./cloneneobundle.sh
./createlinks.sh
vim
```


