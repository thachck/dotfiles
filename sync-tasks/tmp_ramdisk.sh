diskutil erasevolume hfs+ "tmp_ramdisk" `hdiutil attach -nomount ram://1330860`
mkdir /Volumes/tmp_ramdisk/log
mkdir /Volumes/tmp_ramdisk/tmp
ln -sf /Volumes/tmp_ramdisk/tmp ~/code/nvoi-platform/tmp
ln -sf /Volumes/tmp_ramdisk/log ~/code/nvoi-platform/log

launchctl unload ~/code/sync-tasks/local.cache_sync.plist
mkdir /Volumes/tmp_ramdisk/RubyMine2019.2
ln -sf /Volumes/tmp_ramdisk/RubyMine2019.2 ~/Library/Caches
rsync -a --delete --recursive --force ~/code/sync-tasks/rubymine_caches/ /Volumes/tmp_ramdisk/RubyMine2019.2/
launchctl load ~/code/sync-tasks/local.cache_sync.plist
