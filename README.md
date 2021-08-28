Traduzido em inglês e português

Translated in english and portuguese



# Functional Programing

Starting learning functional programing

## Setting the environment:

Instructions for installing GHci on Linux and Windows systems.
The installation of GHci happens together with the environment stack for the control of packages and projects in Haskell.

**Windows**
Installation on Windows System can be done through the package available [here](https://get.haskellstack.org/stable/windows-x86_64-installer.exe)

To determine if the installation was successful, you can open a command prompt and test the following command:

> stack exec -- ghci

**Linux**
If the distribution is based on Ubuntu, you can run the following command:
> sudo apt-get install ghc

If the distribution is not based on Ubuntu, you can run the following commands:

>sudo apt-get install wget

> wget -qO- https://get.haskellstack.org/ | sh

**MacOS**
Information for installing the Haskell environment can be found [here](https://www.haskell.org/ghcup/)

[More informations](https://docs.haskellstack.org/en/stable/install_and_upgrade/)

## Importing Haskell Files (.sh)

> stack exec -- ghci

> :load fileName.hs



# Programação Funcional

Primeiros passos em programação funcional

## Preparando o ambiente:

Instruções para a instalação do GHCi em sistemas Linux e Windows.
A instalação do GHCi acontece juntamente com o ambiente stack para o controle de pacotes e projetos em Haskell.

Windows
A instalação no Sistema Windows pode ser feita através do pacote disponível [aqui](https://get.haskellstack.org/stable/windows-x86_64-installer.exe)

Para determinar se instalação obteve sucesso, você pode abrir o prompt de comando e testar o seguinte comando:

> stack exec -- ghci

Linux
Caso a distribuição seja baseada em Ubuntu, você poderá executar o seguinte comando:
>sudo apt-get install ghc

Caso a distribuição não seja baseada em Ubuntu, você poderá executar os seguintes comandos:

> sudo apt-get install wget

> wget -qO- https://get.haskellstack.org/ | sh

MacOS
Informações para a instalação do ambiente Haskell podem ser encontradas [aqui](https://www.haskell.org/ghcup/)

[Mais informações](https://docs.haskellstack.org/en/stable/install_and_upgrade/)

## Importando arquivos Haskell (.sh)

> stack exec -- ghci

> :load fileName.hs