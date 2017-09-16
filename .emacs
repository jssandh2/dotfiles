
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(package-selected-packages
   (quote
    (php-mode rust-mode scheme-complete scheme-here sml-mode ghci-completion company-coq company-jedi company-ghci company-irony auto-complete-c-headers ac-c-headers ac-clang))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Package support
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Supoprt for LISP/Scheme
(load "~/.emacs.d/lisp/quack.el")

;; C/C++ Header autocomplete
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

;; Enable LaTeX mode by default for files
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Autocomplete for generic company mode
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony 'company-jedi))

;; Use PROOF-GENERAL for Coq
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Load company-coq-mode when open *.v (Coq) files
(add-hook 'coq-mode-hook #'company-coq-mode)

;; ghci - completion for Haskell
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)

;; scheme - smart autocomplete
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))
  
