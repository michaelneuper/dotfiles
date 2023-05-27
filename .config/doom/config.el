;;  __  __ _   _
;; |  \/  | \ | |
;; | \  / |  \| |  Michael Neuper
;; | |\/| | . ` |  https://michaelneuper.com
;; | |  | | |\  |  https://github.com/michaelneuper
;; |_|  |_|_| \_|
;;
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; CONFIGURATION
(setq doom-theme 'one-dark)

(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default))

(custom-set-faces!
  '(dashboard-startup-banner :inherit default))

(setq display-line-numbers-type 'relative)

;; (setq auto-save-default t
;;       make-backup-files t)

(setq confirm-kill-emacs nil)

(when (version< "29.0.50" emacs-version)
  (pixel-scroll-precision-mode))

;; CREDENTIALS
(setq user-full-name "Michael Neuper"
      user-mail-address "michael@michaelneuper.com")

;;FONTS
; SPC h v doom-font
(setq doom-font (font-spec :family "Fira Code" :size 12.5)
     doom-variable-pitch-font (font-spec :family "Noto Sans" :size 15))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

; disable certain ligatures
(plist-put! +ligatures-extra-symbols
  :and           nil
  :or            nil
  :not           nil
  :true          nil
  :false         nil
  :int           nil
  :float         nil
  :str           nil
  :bool          nil
  :list          nil
)

;; WINDOW MANAGEMENT
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; DASHBOARD
(setq doom-fallback-buffer-name "*dashboard*")
(use-package! dashboard
  :ensure t
  :init
  (setq dashboard-items '((recents . 3)
                          (projects . 3)
                          (bookmarks . 5)))
  (setq dashboard-show-shortcuts t)
  (setq dashboard-center-content t)
  (setq dashboard-startup-banner (concat doom-user-dir "doom-banners/splashes/emacs/M-x_butterfly.png"))
  (setq dashboard-banner-logo-title "Welcome back to Emacs!")
  (setq dashboard-display-icons-p t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
  `(;; line 1
    ((,(all-the-icons-octicon "mark-github" :height 1.0 :v-adjust 0.0)
        "GitHub"
        "Browse GitHub"
        (lambda (&rest _) (browse-url "https://github.com/michaelneuper"))))
        (;; line 2
        (,(all-the-icons-faicon "calendar" :height 1.0 :v-adjust 0.0)
        "Agenda"
        "View org-agenda"
        (lambda (&rest _) (org-agenda)) warning)
        (,(all-the-icons-octicon "book" :height 1.0 :v-adjust 0.0)
        "Docs"
        "Show documentation"
        (lambda (&rest _) (doom/help)) warning))))
  :config
  (dashboard-setup-startup-hook))

;; MODELINE
(nyan-mode)
(setq nyan-animate-nyancat t
      nyan-wavy-trail t)

(setq doom-modeline-enable-word-count t
      doom-modeline-persp-name t
      doom-modeline-persp-icon t
      doom-modeline-major-mode-icon t)

;; TABS
(after! centaur-tabs
  :ensure t
  :config
   (setq centaur-tabs-style "bar"
         centaur-tabs-set-bar 'left
         centaur-tabs-height 32
         centaur-tabs-set-icons t
         centaur-tabs-gray-out-icons 'buffer)
   (centaur-tabs-headline-match)
   (centaur-tabs-mode t)
   (centaur-tabs-group-by-projectile-project))

;; LATEX
(require 'org)
(add-to-list 'org-latex-packages-alist '("" "amsmath" t))
(add-to-list 'org-latex-packages-alist '("" "amssymb" t))
(setq org-preview-latex-default-process 'dvipng)

;; ORG MODE
(setq org-directory "~/Org"
      org-use-property-inheritance t ; fix weird issue with src blocks
      org-startup-with-inline-images t
      org-startup-with-latex-preview t)

(after! org
  (setq org-agenda-files
        '("~/Org/" "~/Documents/Org/agenda.org")))

;; ORG ROAM
(setq org-roam-directory "~/RoamNotes"
      org-attach-id-dir "attachments/")

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq org-roam-database-connector 'sqlite3)

;; ELISP
(map! :leader
      (:prefix ("e". "evaluate")
       :desc "Evaluate elisp in buffer"  "b" #'eval-buffer
       :desc "Evaluate defun"            "d" #'eval-defun
       :desc "Evaluate elisp expression" "e" #'eval-expression
       :desc "Evaluate last sexpression" "l" #'eval-last-sexp
       :desc "Evaluate elisp in region"  "r" #'eval-region))

;; COMPANY MODE
(add-hook 'after-init-hook 'global-company-mode)
;; from modules/completion/company/config.el
(use-package! company
  :commands (company-mode global-company-mode company-complete
        company-complete-common company-manual-begin company-grab-line)
  :config
  (setq company-idle-delay nil
        company-tooltip-limit 10
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
  [...])

;; LSP MODE
(setq lsp-enable-symbol-highlighting t
      lsp-ui-doc-enable t
      lsp-lens-enable t
      lsp-headerline-breadcrumb-enable t
      lsp-modeline-code-actions-enable t
      lsp-diagnostics-provider :flycheck
      lsp-ui-sideline-enable t
      lsp-completion-show-detail t
      lsp-completion-show-kind t)

;; JAVA
;; (after! lsp-mode (require 'lsp-java))
;; ;; Configure LSP Java
;; (after! lsp-java
;;   (add-hook 'java-mode-hook #'lsp))

;; (setq lsp-java-format-on-type-enabled nil
;;       lsp-java-format-enabled nil)
;; ;; Set path to the language server executable
;; (set-lsp-priority! 'eclipse-jdt .80)
;; (setq lsp-java-server-install-dir "/bin/jdtls")
;; (setq lsp-java-workspace-dir "~/Projects/java")
;;
;; (setq ansi-color-for-compilation-mode 'filter)
;; (require 'ansi-color)
;; (setq org-babel-java-command "ansi-color-for-comint-mode-on && javac")
;; (defun my-enable-ansi-colors ()
;;   (when (eq major-mode 'compilation-mode)
;;     (ansi-color-apply-on-region compilation-filter-start (point-max))))
;; (add-hook 'compilation-filter-hook 'my-enable-ansi-colors)
