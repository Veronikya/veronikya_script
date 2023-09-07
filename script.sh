#! /bin/sh
# apt install zsh -y
apt update -y

# 安装tmux并配置
apt install vim -y
apt install tmux -y
apt install git -y
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


# 安装zsh并配置
apt install zsh -y
apt install curl -y
cd ~
rm -rf ~/.oh-my-zsh
echo -e 'Y' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# 安装powerline
sudo easy_install pip
apt install python3-pip -y
pip install powerline-status --user


# 安装PowerFonts
cd ~
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ~ && rm -rf fonts


# 安装zsh agnoster主题
cd ~
git clone https://github.com/fcamblor/oh-my-zsh-agnoster-fcamblor.git
cd oh-my-zsh-agnoster-fcamblor/
./install
cd ~ && rm -rf oh-my-zsh-agnoster-fcamblor
# 检查 ~/.zshrc 文件是否存在
if [ ! -f ~/.zshrc ]; then
  echo "Error: ~/.zshrc file not found."
  exit 1
fi
# 使用 sed 命令修改 ZSH_THEME 配置项
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc
echo "ZSH_THEME has been set to agnoster."

# 安装zsh 高亮插件
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
sed -i 's/plugins=(/plugins=(zsh-syntax-highlighting /g' ~/.zshrc
sed -i 's/plugins=(/plugins=(zsh-autosuggestions /g' ~/.zshrc
source ~/.zshrc
# set-option -g default-shell /bin/zsh
chsh -s /bin/zsh
