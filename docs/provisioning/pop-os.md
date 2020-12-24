# Pop_OS! Provisioning Tips

In this document I will cover any steps that were not implemented in the automatic provisioning process.

## Post Installation Tweaks

- Install the Dash-to-Dock extension [instructions](https://support.system76.com/articles/dash-to-dock/).
- To configure it to show all the time while overlayed on top of any window, see this [answer from AskUbuntu](https://askubuntu.com/a/1204273).
    1. Don't turnoff the Auto-hide feature.
    1. Locate the dash-to-dock extension directory, it could be either in `$HOME/.local/share/gnome-shell/extensions/` or `/usr/share/gnome-shell/extensions/`.
    1. Open the file `intellihide.js`.
    1. At the line inside the "enable" function where it assigns `this._isEnabled = true;`, change the value to false.
        ```
        enable: function() {
            this._isEnabled = false;
            this._status = OverlapStatus.UNDEFINED;
            global.get_window_actors().forEach(function(wa) {
                this._addWindowSignals(wa);
            }, this);
            this._doCheckOverlap();
        },
        ```
