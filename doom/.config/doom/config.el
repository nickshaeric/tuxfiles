;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; -*- no-byte-compile: t; -*-

;;; Credentials
(setq user-full-name "Nicksha Eric"
      user-mail-address "nicksha.eric@gmail.com")
(setq confirm-kill-emacs nil)

;;; Appearance
;; Theme
(setq doom-theme 'doom-gruvbox
      fancy-splash-image "~/tuxfiles/doom/.config/doom/emacs.png")

;; Fonts
(setq doom-font (font-spec :family "JetBrains Mono Nerd Font" :size 16)
      doom-big-font (font-spec :family "JetBrains Mono Nerd Font" :size 26)
      doom-variable-pitch-font (font-spec :family "Inter" :size 16)
      doom-symbol-font (font-spec :family "Symbols Nerd Font Mono"))

;;; Editor Settings
(setq display-line-numbers-type 'relative
      indent-bars-display-on-blank-lines nil
      global-hl-line-modes '(prog-mode dired-mode))

;; Column indicator
(setq-default fill-column 80)
(global-display-fill-column-indicator-mode t)

;; macOS specific
(menu-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated . t))

;;; Org Mode
(setq org-directory "~/org/")

;;; Dashboard
(remove-hook! '+doom-dashboard-functions
  #'doom-dashboard-widget-shortmenu
  #'doom-dashboard-widget-footer)

(defcustom my/dashboard-footer-messages
  '("The one true editor, Emacs!"
    "Who the hell uses VIM anyway? Go Evil!"
    "Free as free speech, free as free Beer"
    "Vi Vi Vi, the editor of the beast"
    "Welcome to the church of Emacs"
    "I showed you my source code, pls respond")
  "List of messages on doom dashboard."
  :type '(repeat string)
  :group 'doom-dashboard)

(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center
                +doom-dashboard--width
                (let* ((icon (propertize
                              #(" " 0 1 (display (height 1.5)))
                              'face `(:foreground ,(doom-color 'magenta))))
                       (msg (nth (random (length my/dashboard-footer-messages))
                                 my/dashboard-footer-messages)))
                  (concat icon msg)))
          "\n"))

(setq-hook! '+doom-dashboard-mode-hook
  mode-line-format nil
  evil-normal-state-cursor (list nil))

;;; LaTeX Configuration
(setq +latex-viewers '(pdf-tools)
      lsp-tex-server 'texlab)

;; Math packages for org-mode
(after! org
  (add-to-list 'org-latex-packages-alist '("" "amsmath" t))
  (add-to-list 'org-latex-packages-alist '("" "amssymb" t))
  (add-to-list 'org-latex-packages-alist '("" "mathtools" t))
  (add-to-list 'org-latex-packages-alist '("" "mathrsfs" t)))

;; Xenops for inline LaTeX rendering
(use-package! xenops
  :hook (org-mode . xenops-mode)
  :config
  (setq xenops-math-latex-process 'dvipng
        xenops-math-image-scale-factor 2
        xenops-reveal-on-entry t))

;;; Org-Roam Configuration
(after! org-roam
  (setq org-roam-directory "~/org/roam/")

  ;; Capture templates
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("c" "course" plain
           "* Course Info\n- Instructor: \n- Term: \n\n* Week 1\n\n* Assignments\n"
           :target (file+head "courses/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :course:\n")
           :unnarrowed t)
          ("t" "topic" plain
           "* Definition\n\n* Key Points\n\n* Examples\n\n* Related Concepts\n"
           :target (file+head "topics/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :topic:\n")
           :unnarrowed t))))

;; Org-Roam keybindings (outside after! block)
(map! :leader
      (:prefix ("r" . "roam")
       :desc "Find node"          "f" #'org-roam-node-find
       :desc "Insert node"        "i" #'org-roam-node-insert
       :desc "Capture to node"    "c" #'org-roam-capture
       :desc "Toggle roam buffer" "b" #'org-roam-buffer-toggle
       :desc "Open random note"   "r" #'org-roam-node-random))
