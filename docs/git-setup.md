# Setting up git

Stuff to remember for setting up git.

## Windows

The the Windows credential store can be used by downloading [git credential winstore](https://gitcredentialstore.codeplex.com/). Then give the bootstrapper the path, e.g.,

```sh
/cygdrive/c/Users/Brynn/AppData/Roaming/GitCredStore/git-credential-winstore.exe
```

## Ubuntu & Elementary OS

Use the gnome keyring to manage you credentials. You need need to grab the dev tools though...

```sh
sudo apt-get install libgnome-keyring-dev
cd /usr/share/doc/git/contrib/credential/gnome-keyring
sudo make
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
```

You can also just feed the bootstrapper just the helper,

```sh
/usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
```

## OSX

Should just work, the bootstrapper uses the OSX Keyring.