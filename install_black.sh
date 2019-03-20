#!/bin/bash
#
# Usage: chmod +x install_black.sh; ./install_black.sh
#
#make slack load css
if [[ `grep 'raw/black.css' /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js | wc -l` -lt 1 ]]; then
  echo 'Installed CSS loader.';
  echo 'document.addEventListener("DOMContentLoaded", function() {
  $.ajax({
    url: "https://raw.githubusercontent.com/laCour/slack-night-mode/master/css/raw/black.css",
    success: function(css) {
      $("<style></style>").appendTo("head").html(css);
    }
  });
 });' >> /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js;
else echo 'CSS loader already installed.';
fi
