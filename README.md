# Ubuntu Setup

``sudo apt update && sudo apt upgrade -y``

### Install: 
- virtualbox ``sudo apt install virtualbox`` *Remember to add to "Secure Boot" if enabled*
- neovim ``sudo apt install neovim``
- gnome-tweaks ``sudo apt install gnome-tweaks``
___

### Extensions

gnome-extensions ``sudo apt install gnome-shell-extensions``
https://extensions.gnome.org/
- ``Caffeine`` Quick Disable Sleep
- ``Clipboard Indicator`` Show Clipboard History
- ``Disable Workspace Switcher Popup`` Disable Workspace Popup
- ``Hide Activities Button`` Hide Activities Button
- ``Open Weather`` Weather Applet
- ``Panel OSD`` Change Notification Popup Screen Placement
- ``Simply Workspaces`` Workspace Indicator
- ``Virtualbox Applet`` Virtualbox Shortcut
___

### Tiling Manager
https://www.linuxuprising.com/2020/05/how-to-install-pop-shell-tiling.html
- git clone https://github.com/pop-os/shell ``make local-install``
___

### Settings
dconf-editor ``sudo apt install dconf-editor``
- **dcof editor** -> ``org/gnome/shell/keybindings`` change ``switch-to-application`` to ['']
#### Keyboard Shortcuts
| Shortcut | Function |
|----------|----------|
|``Super``+``T`` | Launch Terminal |
|``Super``+``Q`` | Close Window |
|``Super``+``M`` | Maximize Window |
|``Super``+``1`` | Workspace 1 |
|``Super``+``2`` | Workspace 2 |
|``Super``+``3`` | Workspace 3 |
|``Super``+``4`` | Workspace 4 |
___
