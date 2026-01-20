;; HABILITA O LINE NUMBERS
(global-display-line-numbers-mode)

;; MOSTRA OS COMANDOS DO EMACS ABAIXO
(require 'which-key)
(setq which-key-idle-delay 1)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)


;; MOVER LINHAS (<M> cima | <M> baixo | <M> esquerda | <M> direita)
(add-to-list 'load-path "/home/lucas/.emacs.d/elpa/drag-stuff")
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)
(require 'drag-stuff)

(icomplete-mode 1)

(global-set-key (kbd "C-<tab>") 'other-window)
