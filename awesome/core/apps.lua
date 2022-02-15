local apps = {}
apps.terminal = 'alacritty'
apps.browser = 'firefox'
apps.explorer = 'nautilus'
apps.discord = 'discord'
apps.whatsapp = 'whatsapp-nativefier'
apps.editor = os.getenv("EDITOR") or "vi"
apps.editor_cmd = apps.terminal .. " -e " .. apps.editor
apps.musicPlayer = 'com.spotify.Client'
return apps
