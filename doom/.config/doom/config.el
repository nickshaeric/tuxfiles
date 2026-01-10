;;; config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nicksha Eric"
      user-mail-address "nicksha.eric@gmail.com"
      confirm-kill-emacs nil)

(setq doom-theme 'doom-gruvbox
      fancy-splash-image "~/tuxfiles/doom/.config/doom/logo.svg")

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "Inter" :size 18)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 28))

;; Reduce garbage collection frequency
(setq gc-cons-threshold 200000000)  ; 200MB

;; Use GCMH (Garbage Collector Magic Hack) for better performance
(use-package! gcmh
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 258 1024 1024))  ; 256MB during idle
  :config
  (gcmh-mode 1))

(setq display-line-numbers-type 'relative)

(setq indent-bars-display-on-blank-lines nil)

(setq global-hl-line-modes '(prog-mode dired-mode))

(setq-default fill-column 80)
(global-display-fill-column-indicator-mode t)

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
  "A list of messages, one of which dashboard chooses to display.")

(add-hook! '+doom-dashboard-functions :append
  (let* ((icon (propertize
                #(" " 0 1 (display (height 1.5)))
                'face `(:foreground ,(doom-color 'magenta))))
         (msg  (nth (random (length my/dashboard-footer-messages))
                    my/dashboard-footer-messages))
         (line (concat icon msg)))
    (insert "\n" (+doom-dashboard--center +doom-dashboard--width line) "\n")))

(setq-hook! '+doom-dashboard-mode-hook
  evil-normal-state-cursor (list nil))

(setq org-directory "~/Org/")

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
           :unnarrowed t))))

(map! :leader
      (:prefix ("r" . "roam")
       :desc "Find node"          "f" #'org-roam-node-find
       :desc "Insert node"        "i" #'org-roam-node-insert
       :desc "Capture to node"    "c" #'org-roam-capture
       :desc "Toggle roam buffer" "b" #'org-roam-buffer-toggle
       :desc "Open random note"   "r" #'org-roam-node-random))

(setq +latex-viewers '(pdf-tools)
      TeX-electric-sub-and-superscript t)

(add-hook! 'LaTeX-mode-hook #'prettify-symbols-mode)

(use-package! org-latex-preview
  :after org
  :hook (org-mode . org-latex-preview-mode)
  :init
  (setq org-latex-preview-process-precompiled nil
        org-startup-with-latex-preview nil)

  :config
  ;; Packages available during fragment compilation
  (after! org
    (dolist (pkg '("amsmath" "amssymb" "mathtools" "mathrsfs" "xcolor"))
      (add-to-list 'org-latex-packages-alist `("" ,pkg t))))

  ;; Appearance - increased vertical margin to prevent cutoff
  (plist-put org-latex-preview-appearance-options :page-width 1.0)
  (plist-put org-latex-preview-appearance-options :scale 1.5)
  (plist-put org-latex-preview-appearance-options :margin '(2 . 4))

  ;; Live preview behavior
  (setq org-latex-preview-mode-display-live t
        org-latex-preview-mode-update-delay 0.25
        org-latex-preview-mode-ignored-commands
        '(next-line previous-line mwheel-scroll ultra-scroll
          scroll-up-command scroll-down-command
          evil-scroll-up evil-scroll-down
          evil-scroll-line-up evil-scroll-line-down)))

;; Vertical alignment
(after! org-latex-preview
  (setq org-latex-preview-ascent 70))
