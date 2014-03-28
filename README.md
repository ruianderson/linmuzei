# linmuzei

  ![Muzei](http://i.imgur.com/vEFoIpw.png)

Port of [Muzei](https://github.com/romannurik/muzei/) to Bash.
Fork of [Muzei-Bash] (https://github.com/Feminist-Software-Foundation/).

Set this script as a(n) (ana)cronjob, and it'll download a new "famous work of art" from WikiPaintings.org everyday and set it as your wallpaper.

Currently supports GNU/Linux running in a Gnome-settings-daemon-based environment (Gnome-Shell, Unity, Pantheon, etc.; sets wallpaper via gsettings).  If Gnome-settings-daemon is not running, background is set using [feh](http://feh.finalrewind.org/), hsetroot, or [nitrogen](http://projects.l3ib.org/nitrogen/).  Preliminary support for OSX is there.  Project is still new, so we don't support blurring or dimming yet (though I don't think those are useful for desktop, unlike smartphones and tablets).

**Suggestions and patches welcome!**

## Requirements

* Bash (duh!)
* GNU sed (some sed flavours do not have the -i prefix)
* cURL (for downloading stuff over the internet)
* jq (for parsing Muzei's JSON; can be found in Debian, Ubuntu, Arch AUR, Gentoo, and Fedora repos.  If it's not in your distro's repos, check [here](http://stedolan.github.io/jq/download/).)

### Requirements specific to GNU/Linux / BSD

* libnotify-bin & a notification server (for sending "wallpaper changed" notifications)
* feh, hsetroot, or nitrogen (only if you aren't running gnome-settings-daemon)

### Requirements specific to OSX

* terminal-notifier (for sending "wallpaper changed" notifications)

## Installation

Simply set the script as a cronjob or anacronjob with your desired running time.  If you're a noob you can use things like Gnome Schedule or KDE's Task Scheduler (KCron) to do this with a GUI.

If you're an übernoob then there's an installMuzei.sh that will do the stuff for you (copy the scripts to /usr/bin, set a cronjob that checks for new wallpaper every hour).
