;;; packages.el --- dcp layer packages file for Spacemacs.
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

(defconst dcp-packages
  '(
    osx-plist
    )
  "The list of Lisp packages required by the dcp layer.")

(when (spacemacs/system-is-mac)
  (defun dcp/init-osx-plist ()
    (use-package osx-plist)))

;;; packages.el ends here
