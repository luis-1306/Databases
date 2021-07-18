# Zsh config for production terminal

Primero instalo el interprete ZSH y otras herramientas necesarias.

~~~
sudo apt install zsh git-core curl
~~~

Ahora instalo Oh My ZSH, un framework para gestionar la configuración de ZSH.

~~~
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
~~~

Luego descargo el theme de PowerLevel10k desde su repositorio oficial.

~~~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
~~~

Una vez descargado para aplicar el theme a ZSH hace falta editar la siguiente linea de .zshrc.

~~~
ZSH_THEME="powerlevel10k/powerlevel10k"
~~~

Después de reiniciar el terminal se abrirá un asistente de configuración de p10k.

## Plugins

Después de cada descarga de plugin es necesario editar el archivo .zshrc para habilitarlos.

~~~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
~~~
