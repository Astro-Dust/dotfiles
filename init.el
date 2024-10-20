;; ----- VISUAL -----

;; Remover tela de boas-vindas
(setq inhibit-startup-message t) ; "t" é true


;; Remover o menus superiores
(tool-bar-mode -1)
(menu-bar-mode -1)
; Não tem "setq" pq o menu é um modo do emacs e não uma variável


;; Remover barra de rolagem
(scroll-bar-mode -1)


;; Habilitar número de linhas
;(global-linum-mode t)
; "global" pra habilitar em todos os arquivos
(global-display-line-numbers-mode 1)


;; Tamanho da fonte
(set-face-attribute 'default nil :height 150)


;; NOTE: Organizar esta seção de pacotes/plugins
;;
;; ----- PACOTES/PLUGINS -----

(require 'package)
(setq package-enable-at-startup nil) ; desabilitar início de ativação

; MELPA - Repositório de pacotes
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))


(package-initialize) ; iniciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

; Dá pra testar pacotes desse jeito
(use-package try
  :ensure t)

; Menu inferior que lista os comandos do EMACS
(use-package which-key
  :ensure t
  :config
  (progn
    (setq which-key-idle-delay 0) ; mostra o menuzinho imediatamente
    (which-key-mode)
  )
  )

; Auto-complete de texto (não de código)
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    )
)

; Menu lateral
(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    (global-set-key [f8] 'neotree-toggle)
  )
)

; Ícones pra o neotree
;(use-package all-the-icons
;  :ensure t
;)


; EMACS Ergonômico
(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "pt-nativo")
    (ergoemacs-mode 0) ; mudar para "1" caso queira ativar
  )
)


;; ----- TEMA -----
;; (use-package catppuccin-theme
;;   :ensure t
;;   :config
;;   (progn
;;     (setq catppuccin-flavor 'frappe)
;;     (load-theme 'catppuccin t)
;;   ))


;; ----- CHECAGEM DE SINTAXE -----
;(use-package flycheck
;  :ensure t
;  :init (global-flycheck-mode t))


;; ----- AUTO-CLOSE PARENTESIS -----
(add-hook 'prog-mode-hook #'electric-pair-mode)


;; ----- ATALHOS PERSONALIZADOS -----
(global-set-key (kbd "C-<tab>") 'other-window) ; mudando o foco da janela
(global-set-key (kbd "M-<up>") 'enlarge-window) ; aumenta o tamanho da janela focada
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)


;; ----- GRIP MODE (Markdown) -----
(setq grip-binary-path "/home/$USER/.local/bin/grip") ; caminho do grip

; quando abrir um arquivo markdown ou o org mode, vai chamar o grip-mode
(add-hook 'markdown-mode-hook #'grip-mode)
(add-hook 'org-mode-hook #'grip-mode)

(setq grip-url-browser "firefox") ; abrindo o live preview no navegador

(setq grip-update-after-change nil) ; atualiza o preview sempre que salvar o arquivo


;; ----- ABRIR ARQUIVOS RECENTES -----
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


;; ----- IMPEDINDO DE CRIAR ARQUIVO DE BACKUP (~) -----
(setq make-backup-files nil)


;; ----- COMPILAR CÓDIGO C -----
(defun compile-and-run-c ()
  "Compila e executa um programa C."
  (interactive)
  (let ((file (file-name-nondirectory buffer-file-name)))
    (compile (format "gcc -o %s %s && ./%s" 
                     (file-name-sans-extension file) file
                     (file-name-sans-extension file)))))

(global-set-key (kbd "<f5>") 'compile-and-run-c)


;; ----- DASHBOARD -----
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "Pronto pra acabar com a doutrinação... \nMas só depois do carinho atrás da orelha :cat::guitar:")
(setq dashboard-startup-banner "/home/calavera/Imagens/nando gatinho4.png")
(setq dashboard-center-content t)

(setq dashboard-startupify-list '(dashboard-insert-newline
				  dashboard-insert-newline
				  dashboard-insert-banner
                                  dashboard-insert-newline
				  dashboard-insert-banner-title
                                  dashboard-insert-navigator
                                  dashboard-insert-newline
                                  dashboard-insert-init-info
                                  dashboard-insert-items
                                  dashboard-insert-newline
                                  dashboard-insert-footer))


;; ----- ROLAGEM SUAVE -----
(use-package good-scroll
  :ensure t
  :config
  (good-scroll-mode 1))


;; ----- RESTART EMACS -----
(use-package restart-emacs
  :ensure t)


;; ----- EMOJI -----
(use-package emojify
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-emojify-mode))


;; ----- AUTOCOMPLETE MELHOR NO C-x C-f -----
(setq read-file-name-completion-ignore-case t)


;; ----- NERD ICONS -----
(use-package nerd-icons
  :ensure t)


; fonte Iosevka para ícones
(set-frame-font "-UKWN-GeistMono Nerd Font Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1" nil t)


; nerd icons para o dired
(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))


;; ----- IDO -----
(ido-mode 1)




;; ----- ABAIXO GERADO PELO MELPA -----
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   [("#383a62" "#383a62")
    ("#7aa5ff" "#383a62")
    ("#ae81ff" "#383a62")
    ("#a0a0c5" "#a0a0c5")
    ("#2de0a7" "#2de0a7")
    ("#8eaee0" "#8eaee0")
    ("#6dfedf" "#6dfedf")
    ("#ccccff" "#ccccff")])
 '(custom-enabled-themes '(doom-monokai-spectrum))
 '(custom-safe-themes
   '("c8c4baac2988652a760554e0e7ce11a0fe0f8468736be2b79355c9d9cc14b751" "350fef8767e45b0f81dd54c986ee6854857f27067bac88d2b1c2a6fa7fecb522" "3c08da65265d80a7c8fc99fe51df3697d0fa6786a58a477a1b22887b4f116f62" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "8b148cf8154d34917dfc794b5d0fe65f21e9155977a36a5985f89c09a9669aa0" "5a548c9d5a6ca78d13283ed709bddf3307b65a7695e1b2e2b7e0a9dde45e8599" "e14991397ba1341f1240216392f48889a343506b1f9c8e9c37ed391151f87463" "2a1d0e4e6bd665fb532cb07cdf466e3bba1e4f2e5e6e01eee1fa913edabe8759" "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "262589c790e262af5fa62d59838f40d0e23bc6455e267aca1816eda86c936c8c" "189b44ac85bbcfbbf8886eb14925c10a6f09f6485b7e3c19503aa44131de2999" "c16e6e4c874b36de1567c34822b88aacff073153190bfbafa6472d816e4613ae" "8bf5fd44a428a76bb252d7bfe7c8bc04c2a966894aec368565286548f6615eef" "80f6ec0264b1b0a1449a6b74f7fb407e25118853bf6c96a9c21f4eef3143d926" "7bcbee7c5eaef0eca0dad6c5ec0ee8f665efd857be421a67be1ce84003d71417" default))
 '(fci-rule-color "#555555")
 '(ispell-dictionary nil)
 '(nrepl-message-colors
   '("#183691" "#555555" "#539100" "#555555" "#0086b3" "#183691" "#539100" "#555555"))
 '(package-selected-packages
   '(nerd-icons-dired nerd-icons ample-theme catppuccin-theme emojify nerd-icons-completion restart-emacs doom-themes good-scroll dashboard smooth-scrolling darktooth-theme gruvbox-theme grip-mode smartparens flycheck lavender-theme kanagawa-theme inkpot-theme cloud-theme ergoemacs-mode all-the-icons neotree auto-complete which-key-posframe which-key try use-package cmake-mode))
 '(pdf-view-midnight-colors '("#555555" . "#edf5dc"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(vc-annotate-background "#d5dec4")
 '(vc-annotate-color-map
   '((20 . "#555555")
     (40 . "#183691")
     (60 . "#555555")
     (80 . "#555555")
     (100 . "#555555")
     (120 . "#539100")
     (140 . "#555555")
     (160 . "#555555")
     (180 . "#555555")
     (200 . "#555555")
     (220 . "#63a35c")
     (240 . "#0086b3")
     (260 . "#183691")
     (280 . "#555555")
     (300 . "#0086b3")
     (320 . "#555555")
     (340 . "#539100")
     (360 . "#555555")))
 '(vc-annotate-very-old-color "#555555"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
