(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/") t)
(package-initialize))
(load-theme 'molokai t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#839496" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"))
; '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("cdfc5c44f19211cfff5994221078d7d5549eeb9feda4f595a2fd8ca40467776c" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(display-time-mode t)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(fci-rule-color "#073642")
 '(package-selected-packages
   (quote
    (molokai-theme markdown-mode zenburn-theme solarized-theme polymode auto-complete color-theme-sanityinc-tomorrow ## color-theme-sanityinc-solarized)))
 '(scroll-bar-mode nil)
 '(scroll-down-aggressively 1.0)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
;; '(font-lock-builtin-face ((t (:foreground "light sea green"))))
;; '(font-lock-constant-face ((t (:foreground "#7aa6da"))))
;; '(font-lock-function-name-face ((t (:foreground "plum3"))))
;; '(font-lock-keyword-face ((t (:foreground "plum3"))))
;; '(font-lock-string-face ((t (:foreground "#b9ca4a"))))
;; '(font-lock-type-face ((t (:foreground "dark orange")))))
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-start nil)
(define-key ac-mode-map [tab] 'auto-complete)
(define-key ac-completing-map [return] nil)
(setq ac-quick-help-delay 0.1)
(setq ess-tab-complete-in-script t)
(require 'ido)
(ido-mode t)

(require 'multiple-cursors)
(global-set-key (kbd "C-x m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(require 'move-text)
(move-text-default-bindings)

(global-set-key [f1] `shell)

(global-set-key (kbd "C-c <left>") 'windmove-left)
(global-set-key (kbd "C-c <right>" ) 'windmove-right)
(global-set-key (kbd "C-c <up>"  ) 'windmove-up)
(global-set-key (kbd "C-c <down>" ) 'windmove-down)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)
(add-to-list 'load-path "~/.emacs.d/ESS/lisp/")
(add-to-list 'load-path "~/usr/share/emacs/25.3/lisp")
(load "ess-site")
;(split-window-right)
;(split-window-below)

(defun volatile-kill-buffer ()
   "Kill current buffer unconditionally."
   (interactive)
   (let ((buffer-modified-p nil))
     (kill-buffer (current-buffer))))
(global-set-key (kbd "C-x k") 'volatile-kill-buffer)
(setq inhibit-startup-message t) ;; hide the startup message
(menu-bar-mode -1)
;;;(w32-send-sys-command 61488)
;;;(set-message-beep 'silent)
(setq ring-bell-function nil)
(global-linum-mode t)


;;; configure R-markdown mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t) (add-to-list 'auto-mode-alist'("\.text\'" . markdown-mode)) (add-to-list 'auto-mode-alist'("\.markdown\'" . markdown-mode)) (add-to-list 'auto-mode-alist'("\.md\'" . markdown-mode))

(setq load-path
      (append '("~/.emacs.d/elpa/polymode"  "~/.emacs.d/elpa/polymode/modes")
              load-path))
(require 'poly-R)
(require 'poly-markdown)
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(require 'elpy)
(elpy-enable)
;;; opening recent files(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key "\C-x\ \C-m" 'execute-extended-command)
(global-set-key "\C-c\ \C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\ \C-k" 'kill-region)
(global-set-key "\C-c\ \C-k" 'kill-region)


