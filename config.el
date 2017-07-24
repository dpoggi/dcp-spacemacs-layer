;;; config.el --- dcp layer configuration file for Spacemacs.
;;
;; Copyright (c) 2017 Dan Poggi
;;
;; Author: Dan Poggi <dan.poggi@gmail.com>
;; URL: https://github.com/dpoggi/dcp-spacemacs-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defvar dcp-java-path
  (let ((executable-name (if (spacemacs/system-is-mswindows) "javaw" "java")))
    (locate-file executable-name exec-path exec-suffixes 1))
  "Path to Java executable for the dcp layer.")

(when (configuration-layer/package-usedp 'osx-plist)
  (defvar dcp-mucommander-app-path "/Applications/muCommander.app"
    "Full path to muCommander.app."))

;;; config.el ends here
