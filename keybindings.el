;;; keybindings.el --- dcp layer key bindings file for Spacemacs.
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

(when (configuration-layer/package-usedp 'osx-plist)
  (spacemacs/set-leader-keys "bF" 'dcp/reveal-in-mucommander))

;;; keybindings.el ends here
