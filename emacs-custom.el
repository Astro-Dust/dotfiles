;; ================================
;; FULLSCREEN AO ABRIR
;; ================================
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (toggle-frame-maximized))))

;; ================================
;; UI BÁSICA
;; ================================
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; ================================
;; PACKAGE + USE-PACKAGE
;; ================================
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; ================================
;; LINE NUMBERS
;; ================================
(global-display-line-numbers-mode 1)

;; ================================
;; WHICH-KEY
;; ================================
(use-package which-key
  :init
  (setq which-key-idle-delay 1
        which-key-idle-secondary-delay 0.05)
  :config
  (which-key-mode 1))

;; ================================
;; DRAG-STUFF
;; ================================
(use-package drag-stuff
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

;; ================================
;; ICOMPLETE (BUILT-IN)
;; ================================
(icomplete-mode 1)

;; ================================
;; ATALHOS
;; ================================
(global-set-key (kbd "C-<tab>") #'other-window)
(global-set-key (kbd "C-j") #'dired)

;; ================================
;; AUTOCLOSING ()
;; ================================
(add-hook 'prog-mode-hook #'electric-pair-mode)

;; ================================
;; SCROLL SUAVE
;; ================================
(use-package good-scroll
  :config
  (good-scroll-mode 1))

;; ================================
;; FILE COMPLETION
;; ================================
(setq read-file-name-completion-ignore-case t)

;; ================================
;; TEMA CUSTOMIZADO
;; ================================

(mapc #'disable-theme custom-enabled-themes)
(load-theme 'doom-wilmersdorf t)
;;(load-theme 'doom-flatwhite t)
