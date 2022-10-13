(require 'package) 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package evil
  :ensure evil
  :config
  (evil-mode 1))


(use-package which-key
  :ensure t
  :config (which-key-mode))


(use-package doom-themes
  :ensure t
  :config
  ;;  (load-theme 'doom-spacegrey t))
  (load-theme 'doom-solarized-light t))
;;  (load-theme 'doom-nord-light t))


(use-package avy
  :ensure t
  :init
  (setq avy-keys '(?f ?l ?i ?o ?a ?h ?h ?r ?y ?w))
  )

(use-package quickrun
  :ensure t)

;; Use this parameter as python default
(quickrun-add-command "py3"
  '((:command . "python3")
    (:exec    . ("%c %s")))
  :default "python")

(use-package expand-region
  :ensure t
  :bind
  ("C-k" . er/expand-region)
  ;; ("C-w" . er/contract-region)
  )

(use-package treemacs
  :ensure t
  :bind
  (:map global-map
	([f8] . treemacs)
	("C-<f8>" . treemacs-select-window))
  :config
  (setq treemacs-is-never-other-window t))


(use-package magit
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package projectile
 :ensure t
 :config
 (projectile-mode +1))

;; (use-package lsp-pyright
  ;; :hook (python-mode . (lambda () (require 'lsp-pyright)))
  ;; :init (when (executable-find "python3")
          ;; (setq lsp-pyright-python-executable-cmd "python3")))


(use-package lsp-pyright
  :ensure t
  :defer t
  :custom
  (lsp-pyright-disable-language-service nil)
  (lsp-pyright-disable-organize-imports nil)
  (lsp-pyright-auto-import-completions t)
  (lsp-pyright-use-library-code-for-types t)
  (lsp-completion-enable t)
  :hook ((python-mode-hook . (lambda ()
			       (poetry-tracking-mode)
			       (require 'lsp-pyright)
			       (lsp-deferred)))))




(use-package lsp-mode
  :hook ((c-mode          ; clangd
          ;; c++-mode        ; clangd
          ;; c-or-c++-mode   ; clangd
          ;; java-mode       ; eclipse-jdtls
          ;; js-mode         ; ts-ls (tsserver wrapper)
          ;; js-jsx-mode     ; ts-ls (tsserver wrapper)
          ;; typescript-mode ; ts-ls (tsserver wrapper)
          python-mode     ; pyright
          ;; web-mode        ; ts-ls/HTML/CSS
          ;; haskell-mode    ; haskell-language-server
          ) . lsp-deferred)
  :commands lsp
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-log-io nil)
  (setq lsp-restart 'auto-restart)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-signature-render-documentation nil)
  (setq lsp-eldoc-hook nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-semantic-tokens-enable nil)
  (setq lsp-enable-folding nil)
  (setq lsp-enable-imenu nil)
  (setq lsp-enable-snippet nil)
  (setq read-process-output-max (* 1024 1024)) ;; 1MB
  (setq lsp-idle-delay 0.5))


(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-use-webkit t)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-border (face-foreground 'default))
  (setq lsp-ui-sideline-show-code-actions t)
  (setq lsp-ui-sideline-delay 0.05))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))


(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode 1))

;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs
      '(
        (?\" . ?\")
        (?\{ . ?\})))
