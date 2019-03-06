#!/bin/bash
#
# Usage: chmod +x install_black.sh; ./install_black.sh
#
#get latest css
echo "Grabbing latest CSS version..."
curl -o /Applications/Slack.app/Contents/Resources/black.css https://raw.githubusercontent.com/cr3ative/slack-night-mode/master/css/raw/black.css
#make slack load css
if [[ `grep 'filePath = "/Applications/Slack.app/Contents/Resources/black.css"' /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js | wc -l` -lt 1 ]]; then
    echo 'Installed CSS loader.';
echo 'document.addEventListener("DOMContentLoaded", function() {
  var fs = require("fs"),
  filePath = "/Applications/Slack.app/Contents/Resources/black.css";
  fs.readFile(filePath, {encoding: "utf-8"}, function(err, data) {
    if (!err) {
      var css = document.createElement("style")
      css.innerText = data;
      document.getElementsByTagName("head")[0].appendChild(css);
    }
  })
});' >> /Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js;
else echo 'CSS loader already installed.';
fi
