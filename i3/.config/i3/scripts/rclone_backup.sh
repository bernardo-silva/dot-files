#!/bin/bash

Dirs="
Documents
Pictures
Videos
Projects
.zshrc
.vim
.config
"

Exclude="BraveSoftware discord"

for dir in $Dirs; do
        rclone copy --update --transfers 30 --checkers 8 --contimeout 60s\
        --timeout 300s --retries 3 --low-level-retries 10 --verbose --stats 1s\
        --exclude "BraveSoftware/" --exclude "discord/"\
        ~/$dir DriveIST:EndeavourOSBackup/$dir/
done

