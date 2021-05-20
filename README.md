# Vim-IDE

This is my Vim configuration.

To install launch `install.sh` script with root permissions. This script also can be used to update installed config.

```bash
sudo ./install.sh
```

This one install required packages and copy config files to `$HOME/.vim` directory.

To define directory to install you can use `-d` or `--directory`. For example:
```bash
sudo ./install.sh -d ./custom/directory
```

Plugins:
* [kotlin-vim](https://github.com/udalov/kotlin-vim)
* [cscope-mappings](http://cscope.sourceforge.net/cscope_vim_tutorial.html)
* [Mojo highliting](https://chromium.googlesource.com/chromium/src/tools/vim/+/refs/heads/main/mojom/syntax/mojom.vim)

Required packages:
* [Vim](https://www.vim.org/)
* [Git](https://git-scm.com/)
* [Cscope](http://cscope.sourceforge.net/)
* [Wget](https://www.gnu.org/software/wget/)
 
