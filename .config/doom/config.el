;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.

;;   (after! PACKAGE
;;     (setq x y))

;; The exceptions to this rule:
;;     - Setting file/directory variables (like `org-directory')
;;     - Setting variables which explicitly tell you to set them before their
;;         package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;     - Setting doom variables (which start with 'doom-' or '+').

;; Here are some additional functions/macros that will help you configure Doom.

;;     - `load!' for loading external *.el files relative to this one
;;     - `use-package!' for configuring packages
;;     - `after!' for running code after a package has loaded
;;     - `add-load-path!' for adding directories to the `load-path', relative to
;;          this file. Emacs searches the `load-path' when you load packages with
;;         `require' or `use-package'.
;;     - `map!' for binding new keys

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).

;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-localleader-key "SPC l"
      doom-localleader-alt-key "M-SPC l")

;; (setq auto-save-default t
;;       make-backup-files t)

(setq confirm-kill-emacs nil)

(setq user-full-name "Michael Neuper"
      user-mail-address "michael@michaelneuper.com")

(load! "api-keys.el")

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(defadvice! prompt-for-buffers (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (consult-buffer))

(setq doom-theme 'doom-one)

(custom-set-faces!
  '(doom-dashboard-banner :inherit default)
  '(doom-dashboard-loaded :inherit default)
  '(dashboard-banner :inherrit default))

(custom-set-faces!
  '(dashboard-startup-banner :inherit default))

(setq display-line-numbers-type 'visual)

(setq display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; (when (version< "29.0.50" emacs-version)
;;   (pixel-scroll-precision-mode))

;; (unless (eq system-type 'darwin)
;;   (require 'good-scroll)
;;   (good-scroll-mode 1))

(setq doom-font (font-spec :family "Fira Code" :size 12.5)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 15))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

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

(after! org
  (setq org-ellipsis " ▾ ")
  (appendq! +ligatures-extra-symbols
            `(:checkbox      "☐"
              :pending       "◼"
              :checkedbox    "☑"
              :list_property "∷"
              :em_dash       "—"
              :ellipses      "…"
              :arrow_right   "→"
              :arrow_left    "←"
              :begin_quote   "❝"
              :end_quote     "❞"
              :header        "›"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)
              :priority_d   ,(propertize "⬇" 'face 'all-the-icons-green)
              :priority_e   ,(propertize "❓" 'face 'all-the-icons-blue)
              :roam_tags nil
              :filetags nil))
  (set-ligatures! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[X]"
    :list_property "::"
    :em_dash       "---"
    :ellipsis      "..."
    :arrow_right   "->"
    :arrow_left    "<-"
    :title         "#+title:"
    :subtitle      "#+subtitle:"
    :author        "#+author:"
    :date          "#+date:"
    :property      "#+property:"
    :options       "#+options:"
    :startup       "#+startup:"
    :macro         "#+macro:"
    :html_head     "#+html_head:"
    :html          "#+html:"
    :latex_class   "#+latex_class:"
    :latex_header  "#+latex_header:"
    :beamer_header "#+beamer_header:"
    :latex         "#+latex:"
    :attr_latex    "#+attr_latex:"
    :attr_html     "#+attr_html:"
    :attr_org      "#+attr_org:"
    :begin_quote   "#+begin_quote"
    :end_quote     "#+end_quote"
    :caption       "#+caption:"
    :header        "#+header:"
    :begin_export  "#+begin_export"
    :end_export    "#+end_export"
    :results       "#+RESULTS:"
    :property      ":PROPERTIES:"
    :end           ":END:"
    :priority_a    "[#A]"
    :priority_b    "[#B]"
    :priority_c    "[#C]"
    :priority_d    "[#D]"
    :priority_e    "[#E]"
    :roam_tags     "#+roam_tags:"
    :filetags      "#+filetags:")
  (plist-put +ligatures-extra-symbols :name "⁍"))

(use-package! info-colors
  :commands (info-colors-fontify-node))

(add-hook 'Info-selection-hook
          'info-colors-fontify-node)

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq doom-fallback-buffer-name "*dashboard*")

(use-package! dashboard
  :custom-face
  (dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
  (dashboard-banner ((t (:inherit default))))
  :hook
  (dashboard-mode . (lambda ()
                      ;; Enable `page-break-lines-mode'
                      (when (fboundp 'page-break-lines-mode)
                        (page-break-lines-mode 1))))
  :init
  (setq dashboard-items '((recents . 4)
                          (projects . 3)
                          (bookmarks . 5))
        dashboard-show-shortcuts t
        dashboard-center-content t
        dashboard-startup-banner 'official
        ;; dashboard-startup-banner (concat doom-user-dir "doom-banners/splashes/emacs/emacs-e-logo.png")
        dashboard-banner-logo-title "Welcome Back to Emacs!"
        dashboard-page-separator "\n\f\n"
        dashboard-display-icons-p t
        dashboard-set-file-icons t
        dashboard-set-heading-icons t
        dashboard-set-navigator t)
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

(add-to-list 'recentf-exclude "~/Repos/dotfiles/.config/emacs/elpa")
(add-to-list 'recentf-exclude "~/Repos/dotfiles/.config/emacs/.local/etc/workspaces/autosave")
(add-to-list 'recentf-exclude "~/Repos/dotfiles/.config/emacs/bookmarks")
(add-to-list 'recentf-exclude "~/Repos/dotfiles/.config/emacs/recentf")
(add-to-list 'recentf-exclude "~/Repos/dotfiles/.config/emacs/ido.last")
(add-to-list 'recentf-exclude "~/.cache/treemacs-persist")

(use-package! nyan-mode
  :init
  (nyan-mode)
  :config
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t))

(after! doom-modeline
  (setq doom-modeline-enable-word-count t
        doom-modeline-persp-name t
        doom-modeline-persp-icon t
        doom-modeline-major-mode-icon t))

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

(require 'svg-tag-mode)

(defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
(defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
(defconst day-re "[A-Za-z]\\{3\\}")
(defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

(defun svg-progress-percent (value)
  (svg-image (svg-lib-concat
              (svg-lib-progress-bar (/ (string-to-number value) 100.0)
                                    nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
              (svg-lib-tag (concat value "%")
                           nil :stroke 0 :margin 0)) :ascent 'center))

(defun svg-progress-count (value)
  (let* ((seq (mapcar #'string-to-number (split-string value "/")))
         (count (float (car seq)))
         (total (float (cadr seq))))
    (svg-image (svg-lib-concat
                (svg-lib-progress-bar (/ count total) nil
                                      :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
                (svg-lib-tag value nil
                             :stroke 0 :margin 0)) :ascent 'center)))

(setq svg-tag-tags
      `(
        ;; Org tags :TAG1:TAG2:TAG3:
        (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
        (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

        ;; Org tags #+author
        ("#\+\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
        ("#\+\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))

        ;; Task priority [#A] [#B] [#C]
        ("\\[#[A-Z]\\]" . ( (lambda (tag)
                              (svg-tag-make tag :face 'org-priority
                                            :beg 2 :end -1 :margin 0))))

        ;; Progress [1/3]
        ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
                                            (svg-progress-percent (substring tag 1 -2)))))
        ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
                                          (svg-progress-count (substring tag 1 -1)))))

        ;; TODO / DONE
        ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
        ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))

        ;; Citation of the form [cite:@Knuth:1984]
        ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
                                          (svg-tag-make tag
                                                        :inverse t
                                                        :beg 7 :end -1
                                                        :crop-right t))))
        ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
                                                   (svg-tag-make tag
                                                                 :end -1
                                                                 :crop-left t))))


        ;; Active date (with or without day name, with or without time) <2021-12-24 Fri 14:00>
        (,(format "\\(<%s>\\)" date-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :end -1 :margin 0))))
        (,(format "\\(<%s \\)%s>" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
        (,(format "<%s \\(%s>\\)" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))

        ;; Inactive date  (with or without day name, with or without time) [2021-12-24 Fri 14:00]
        (,(format "\\(\\[%s\\]\\)" date-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
        (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
        (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
         ((lambda (tag)
            (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))))

;; (add-hook! 'org-mode-hook '(svg-tag-mode t))

(use-package! lsp-mode
  :init
  (setq lsp-enable-symbol-highlighting t
        lsp-lens-enable t
        lsp-headerline-breadcrumb-enable t
        lsp-modeline-code-actions-enable t
        lsp-diagnostics-provider :flycheck
        lsp-completion-show-detail t
        lsp-completion-show-kind t))

(use-package! lsp-ui
  :init
  (setq lsp-ui-doc-enable t
        lsp-ui-sideline-enable t))

(add-hook 'after-init-hook 'global-company-mode)
;; from modules/completion/company/config.el
(use-package! company
  :commands (company-mode global-company-mode company-complete
                          company-complete-common company-manual-begin company-grab-line)
  :config
  (setq company-idle-delay 0.3
        company-tooltip-limit 10
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)
  [...])

;; (require 'company-tabnine)
;; (add-to-list 'company-backends #'company-tabnine)

;; (setq company-idle-delay 0
;;       company-show-numbers t)

(add-hook! 'latex-mode-hook
  (setq TeX-engine 'xelatex) 99)

(setq TeX-auto-save t
      TeX-parse-self t)
(setq-default TeX-master nil)

(setq +latex-viewers '(pdf-tools zathura))

(setq auto-revert-interval 0.5)

(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

(map! :after latex
      :map cdlatex-mode-map
      :localleader
      :desc "Insert math symbol"
      "i" #'cdlatex-math-symbol
      :desc "Begin environment"
      "e" #'cdlatex-environment)

(map! :leader
      (:prefix ("e" . "evaluate")
       :desc "Evaluate elisp in buffer"
       "b" #'eval-buffer
       :desc "Evaluate defun"
       "d" #'eval-defun
       :desc "Evaluate elisp expression"
       "e" #'eval-expression
       :desc "Evaluate last sexpression"
       "l" #'eval-last-sexp
       :desc "Evaluate elisp in region"
       "r" #'eval-region))

(after! lsp-mode (require 'lsp-java))

(after! lsp-java
  (add-hook 'java-mode-hook #'lsp)
  (add-hook 'java-mode-hook
            (lambda ()
              (setq c-basic-offset 4
                    tab-width 4
                    indent-tabs-mode nil))))

(map! :after lsp-java
      :map java-mode-map
      :localleader
      :desc "Add missings imports"
      "i" #'lsp-java-add-import
      :desc "Organize imports"
      "o" #'lsp-java-organize-imports
      :desc "Build project"
      "b" #'lsp-java-build-project
      :desc "Add toString()"
      "t" #'lsp-java-generate-to-string
      :desc "Generate getters and setters"
      "g" #'lsp-java-generate-getters-and-setters
      :desc "Extract to method"
      "m" #'lsp-java-extract-method
      :desc "Extract to constant"
      "c" #'lsp-java-extract-to-constant
      :desc "Extract to local variable"
      "v" #'lsp-java-extract-to-local-variable)

(after! text-mode
  (add-hook! 'text-mode-hook
    (unless (derived-mode-p 'org-mode)
      (with-silent-modifications
        (ansi-color-apply-on-region (point-min) (point-max) t)))))

(use-package! smudge
  :init
  (setq smudge-status-location 'modeline
        smudge-transport 'connect) ; requires spotify premium
  :config
  ;; General keybindings
  (map! :leader
        (:prefix ("m" . "music")
         :desc "Toggle shuffle"
         "s" #'smudge-controller-toggle-shuffle
         :desc "Toggle repeat"
         "r" #'smudge-controller-toggle-repeat
         :desc "Play/pause"
         "SPC" #'smudge-controller-toggle-play
         :desc "Next track"
         "f" #'smudge-controller-next-track
         :desc "Next track"
         "n" #'smudge-controller-next-track
         :desc "Previous track"
         "b" #'smudge-controller-previous-track
         :desc "My playlists"
         "m" #'smudge-my-playlists
         :desc "Select playback device"))
  ;; Playlist keybindings
  (map! :leader
        (:prefix ("m p" . "playlists")
         :desc "Featured playlists"
         "f" #'smudge-featured-playlists
         :desc "Search playlists"
         "s" #'smudge-playlist-search
         :desc "Show user's playlists"
         "u" #'smudge-user-playlists
         :desc "Create new playlist"
         "c" #'smudge-create-playlist))
  ;; Track keybindings
  (map! :leader
        (:prefix ("m t" . "tracks")
         :desc "List recently played tracks"
         "r" #'smudge-recently-played
         :desc "Search for trakcs"
         "s" #'smudge-track-search))
  ;; Volume keybindings
  (map! :leader
        (:prefix ("m v" . "volume")
         :desc "Increase volume"
         "u" #'smudge-controller-volume-up
         :desc "Decrease volume"
         "d" #'smudge-controller-volume-down
         :desc "Toggle mute"
         "m" #'smudge-controller-voume-mute-unmute)))

(setq undo-limit 80000000)

(setq evil-want-fine-undo t)

(setq org-directory "~/Org"
      org-use-property-inheritance t ; fix weird issue with src blocks
      org-startup-with-inline-images t
      org-startup-with-latex-preview t)

(require 'org)
(add-to-list 'org-latex-packages-alist '("" "amsmath" t))
(add-to-list 'org-latex-packages-alist '("" "amssymb" t))
(setq org-preview-latex-default-process 'dvipng)

(after! org
  (setq org-agenda-files
        '("~/Org/" "~/Documents/Org/agenda.org")))

(defun my/babel-ansi ()
  (when-let ((beg (org-babel-where-is-src-block-result nil nil)))
    (save-excursion
      (goto-char beg)
      (when (looking-at org-babel-result-regexp)
        (let ((end (org-babel-result-end))
              (ansi-color-context-region nil))
          (ansi-color-apply-on-region beg end))))))
(add-hook 'org-babel-after-execute-hook 'my/babel-ansi)

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

;; (setq org-roam-database-connector 'sqlite3)
