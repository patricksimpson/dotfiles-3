;===evil-leader===;
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
		 ;;rebind help key
     (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-b") 'projectile-switch-project)
     (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

;re-bind evil-scroll-up ¯\_(ツ)_/¯
(global-set-key (kbd "C-u") 'evil-scroll-up)

;===helm===;
;helm init!
(global-set-key (kbd "M-x") 'helm-M-x)
;helm buffers list
(global-set-key (kbd "C-=") 'helm-buffers-list)
;helm find files
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;helm + projectfile find files
(define-key evil-normal-state-map "\C-p" 'helm-projectile-find-file)
;helm + projectile do ag search
(evil-leader/set-key "f" 'helm-projectile-ag)

;git-gutter navigate hunks
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;magit status key
(global-set-key (kbd "C-SPC") nil)
(global-set-key (kbd "C-SPC") 'magit-status)

;toggle emmet
(global-set-key (kbd "C-c e") 'emmet-expand-line)

;fill-column-line
(evil-leader/set-key "c" 'fci-mode)

;===neotree===;
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(evil-leader/set-key "\S-t" 'neotree-toggle)

;redefine things to work with evil mode
(add-hook 'neotree-mode-hook
  (lambda ()
    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
    (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;===keychord===;
;;Exit insert mode by pressing j and then k quickly
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
;evil-key
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
;comment line/region
(key-chord-define-global "//" 'comment-region)
;uncomment line/region
(key-chord-define-global "??" 'uncomment-region)
