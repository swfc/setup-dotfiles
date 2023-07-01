# ssh-setup
[See this file for how it works](dotfiles.html)
## How to use
First set up ssh keys and then add it to the GitHub public key.

```bash
source ./create_ssh_key.sh <ssh_key_file_name>
```
<ssh_key_file_name> will be put in $HOME/.ssh directory.

Next execute the `setup_dot_files.sh` script.
```bash
./setup_dot_files.sh
```
This should install oh-my-zsh and relevant custom plugins, and powerlevel10k custom theme.
