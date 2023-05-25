;;  __  __ _   _
;; |  \/  | \ | |
;; | \  / |  \| |  Michael Neuper
;; | |\/| | . ` |  https://michaelneuper.com
;; | |  | | |\  |  https://github.com/michaelneuper
;; |_|  |_|_| \_|
;;
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Michael Neuper"
      user-mail-address "michael@michaelneuper.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 12.5)
     doom-variable-pitch-font (font-spec :family "Noto Sans" :size 15))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; Doom banner
;; (setq fancy-splash-image "~/.config/doom/doom-banners/splashes/emacs/emacs-e-logo.png")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org")


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
;;
;; WINDOW MANAGEMENT
(setq evil-split-window-below t
      evil-vsplit-window-right t)

; Enable pixel precision scrolling
(when (version< "29.0.50" emacs-version)
  (pixel-scroll-precision-mode))

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
(setq org-use-property-inheritance t) ; fix weird issues with src blocks
(setq org-startup-with-inline-images t) ; show inline images

;; ORG ROAM
(setq org-roam-directory "~/RoamNotes")
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

;; (setq org-roam-database-connector 'sqlite3)

;; GNUPLOT
(after! org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((gnuplot . t))))

;; COMPANY MODE
(add-hook 'after-init-hook 'global-company-mode)
;; from modules/completion/company/config.el
(use-package! company  ; `use-package!' is a thin wrapper around `use-package'
                        ; it is required that you use this in Doom's modules,
                        ; but not required to be used in your private config.
:commands (company-mode global-company-mode company-complete
        company-complete-common company-manual-begin company-grab-line)
:config
(setq company-idle-delay nil
        company-tooltip-limit 10
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
[...])

;; LSP MODE
(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-lens-enable t)
(setq lsp-headerline-breadcrumb-enable t)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-diagnostics-provider :flycheck)
(setq lsp-ui-sideline-enable t)
(setq lsp-completion-show-detail t)
(setq lsp-completion-show-kind t)

;; JAVA
;; (after! lsp-mode (require 'lsp-java))
;; ;; Configure LSP Java
;; (after! lsp-java
;;   (add-hook 'java-mode-hook #'lsp))
;;
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
