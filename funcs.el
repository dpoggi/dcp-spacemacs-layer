;;; funcs.el --- dcp layer functions file for Spacemacs.
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

(defun dcp/load-theme (theme-str)
  "Loads the given theme by name."
  (mapc 'disable-theme custom-enabled-themes)
  (if (string= theme-str "default")
      t
    (load-theme (intern theme-str) t)))

(defun dcp/start-process (name buffer program &rest program-args)
  "Helper function for start-process which flattens its arguments."
  (apply #'start-process
         (-replace :nil nil
                   (-flatten
                    (-replace nil :nil
                              `(,name ,buffer ,program ,program-args))))))

(when (configuration-layer/package-usedp 'osx-plist)
  (defun dcp/reveal-in-mucommander-as (dir-path)
    "Helper function for dcp/reveal-in-mucommander."
    (message (format "Revealing %s in muCommander" (directory-file-name dir-path)))
    (if (f-dir-p dcp-mucommander-app-path)
        (let* ((plist-path (f-join dcp-mucommander-app-path "Contents" "Info.plist"))
               (jvm-options (append (gethash "JVMOptions" (osx-plist-parse-file plist-path)) nil))
               (jar-path
                (car (file-expand-wildcards
                      (f-join dcp-mucommander-app-path "Contents" "Java" "mucommander-*-all.jar")))))
          (dcp/start-process "muCommander" nil dcp-java-path jvm-options "-jar" jar-path dir-path))
      (message (format "%s does not exist or is not an app bundle" dcp-mucommander-app-path))))

  (defun dcp/reveal-in-mucommander ()
    "Reveal the directory containing the file associated with the current buffer
in muCommander."
    (interactive)
    (let ((dir-path
           (cond ((derived-mode-p 'dired-mode) (f-dirname dired-file-name-at-point))
                 (buffer-file-name (f-dirname buffer-file-name))
                 (t (f-expand default-directory)))))
      (if dir-path
          (dcp/reveal-in-mucommander-as dir-path)
        (message "No file associated with this buffer")))))

;;; funcs.el ends here
