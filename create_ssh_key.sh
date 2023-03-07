if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  echo "This script must be sourced, not run as a standalone script."
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Usage: $0 <ssh-key-filename>"
  exit 1
fi

filename="$HOME/.ssh/$1"
ssh-keygen -t ed25519 -C "hannayjd@$HOSTNAME" -f "$filename"
eval "$(ssh-agent -s)"
ssh-add $filename
echo "Add following public key to GitHub server at https://github.com/settings/keys"
ssh-add -L
