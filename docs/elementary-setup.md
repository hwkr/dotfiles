# Setting Up Elementary OS

Most of the setup can be done with the scripts (in `scripts/`) but there are a few additional tweaks.

## Pantheon Terminal

The terminal's colors can be changed using __dconf Editor__ and the colors can be set to

```
#2d2d2d:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#0091c8:#d3d0c8:#5b5b5b:#f2777a:#99cc99:#ffcc66:#6699cc:#cc99cc:#00adef:#f2f0ec
```

## Sublime Text

Should be install be the start script, if not run

```sh
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text
```