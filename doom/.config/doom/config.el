;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nicksha Eric"
      user-mail-address "nicksha@tuta.io"
      confirm-kill-emacs nil)

(setq doom-theme 'doom-nord
      fancy-splash-image "~/tuxfiles/doom/.config/doom/logo.svg")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Inter" :size 16)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 26))

(when (featurep :system 'macos)
  (setq mac-option-modifier 'meta          ; Use Option as Meta
        mac-command-modifier 'super        ; Keep Cmd for system shortcuts
        ns-use-proxy-icon nil
        ns-use-native-fullscreen t)

  ;; Hide menu bar and window decorations
  (menu-bar-mode -1)
  (add-to-list 'default-frame-alist '(undecorated . t)))

;; Reduce garbage collection frequency
(setq gc-cons-threshold 200000000)  ; 200MB

;; Use GCMH (Garbage Collector Magic Hack) for better performance
(use-package! gcmh
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 256 1024 1024))  ; 256MB during idle
  :config
  (gcmh-mode 1))

(setq display-line-numbers-type 'relative)

(setq indent-bars-display-on-blank-lines nil)

(setq global-hl-line-modes '(prog-mode dired-mode))

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode t)

(setq-default indent-tabs-mode nil
              tab-width 4)

(after! corfu
  (setq corfu-auto nil
        corfu-preselect 'first
        corfu-preview-current nil
        +corfu-want-tab-prefer-expand-snippets t))

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
  "A list of messages, one of which dashboard chooses to display."
  :type '(repeat string)
  :group 'doom-dashboard)

(add-hook! '+doom-dashboard-functions :append
  (let* ((icon (propertize
                #(" " 0 1 (display (height 1.5)))
                'face `(:foreground ,(doom-color 'cyan))))
         (msg  (nth (random (length my/dashboard-footer-messages))
                    my/dashboard-footer-messages))
         (line (concat icon msg)))
    (insert "\n" (+doom-dashboard--center +doom-dashboard--width line) "\n")))

(setq-hook! '+doom-dashboard-mode-hook
  evil-normal-state-cursor (list nil)
  mode-line-format nil)

(setq org-directory "~/Org/")

(after! org
  (setq org-src-preserve-indentation t))

(after! org-roam
  (setq org-roam-directory "~/Org/roam/")

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
           :unnarrowed t)
          ("l" "lecture" plain
           "* Lecture Notes\n\n* Key Concepts\n\n* Examples\n"
           :target (file+head "lectures/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :lecture:\n")
           :unnarrowed t))))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Find node"          "f" #'org-roam-node-find
       :desc "Insert node"        "i" #'org-roam-node-insert
       :desc "Capture to node"    "c" #'org-roam-capture
       :desc "Toggle roam buffer" "b" #'org-roam-buffer-toggle
       :desc "Open random note"   "r" #'org-roam-node-random
       :desc "Open graph UI"      "u" #'org-roam-ui-mode))

(setq +latex-viewers '(pdf-tools)
      TeX-electric-sub-and-superscript t)

(add-hook! 'LaTeX-mode-hook #'prettify-symbols-mode)

;; Make fragment compilation aware of extra LaTeX packages
(after! org
  (dolist (pkg '("amsmath" "amssymb" "mathtools" "mathrsfs" "xcolor"))
    (add-to-list 'org-latex-packages-alist `("" ,pkg t))))

(use-package! org-latex-preview
  :after org
  :hook (org-mode . org-latex-preview-mode)
  :init
  (setq org-latex-preview-process-precompiled nil
        org-startup-with-latex-preview t)
  :config
  ;; Appearance (guarded for dev-branch churn)
  (when (boundp 'org-latex-preview-appearance-options)
    (plist-put org-latex-preview-appearance-options :page-width 1.0)
    (plist-put org-latex-preview-appearance-options :scale 1.5)
    (plist-put org-latex-preview-appearance-options :margin '(2 . 4)))

  ;; Live preview behavior (guarded)
  (when (boundp 'org-latex-preview-mode-ignored-commands)
    (setq org-latex-preview-mode-display-live t
          org-latex-preview-mode-update-delay 0.25
          org-latex-preview-mode-ignored-commands
          '(next-line previous-line mwheel-scroll ultra-scroll
            scroll-up-command scroll-down-command
            evil-scroll-up evil-scroll-down
            evil-scroll-line-up evil-scroll-line-down))))

(after! pdf-tools
  ;; Fit PDF to window width by default
  (setq pdf-view-display-size 'fit-width)

  ;; Use normal state (vim motions) in PDF buffers
  (evil-set-initial-state 'pdf-view-mode 'normal)

  ;; Continuous scrolling between pages
  (setq pdf-view-continuous t)

  ;; Better image quality
  (setq pdf-view-use-scaling t
        pdf-view-use-imagemagick nil))

(map! :map pdf-view-mode-map
      :n "j" #'pdf-view-next-line-or-next-page
      :n "k" #'pdf-view-previous-line-or-previous-page
      :n "h" #'image-backward-hscroll
      :n "l" #'image-forward-hscroll
      :n "J" #'pdf-view-next-page
      :n "K" #'pdf-view-previous-page
      :n "gg" #'pdf-view-first-page
      :n "G" #'pdf-view-last-page
      :n "d" #'pdf-view-scroll-up-or-next-page
      :n "u" #'pdf-view-scroll-down-or-previous-page
      ;; Fit modes
      :n "W" #'pdf-view-fit-width-to-window
      :n "P" #'pdf-view-fit-page-to-window)
