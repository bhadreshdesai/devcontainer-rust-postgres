sudo chown -R vscode:vscode /usr/local/cargo
PROJECT="$1"
sudo chown -R vscode:vscode /workspaces/${PROJECT}/target
echo "alias ll='ls -laF'" >> ~/.bash_aliases