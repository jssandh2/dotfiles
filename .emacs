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
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "e3fc83cdb5f9db0d0df205f5da89af76feda8c56d79a653a5d092c82c7447e02" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(default-input-method "TeX")
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#000000" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#000000")
     (varField :foreground "#600e7a" :slant italic)
     (valField :foreground "#600e7a" :slant italic)
     (functionCall :foreground "#000000" :slant italic)
     (implicitConversion :underline
			 (:color "#c0c0c0"))
     (implicitParams :underline
		     (:color "#c0c0c0"))
     (operator :foreground "#000080")
     (param :foreground "#000000")
     (class :foreground "#20999d")
     (trait :foreground "#20999d" :slant italic)
     (object :foreground "#5974ab" :slant italic)
     (package :foreground "#000000")
     (deprecated :strike-through "#000000"))))
 '(package-selected-packages
   (quote
    (jedi-direx jedi racer auto-complete-c-headers popwin popup-complete spacemacs-theme intellij-theme idris-mode intero ssh rvm markdown-mode flycheck-pycheckers flycheck-liquidhs flycheck github-theme go-mode pretty-mode log4j-mode mips-mode monochrome-theme json-navigator json-reformat maude-mode highlight ghc enh-ruby-mode dracula-theme cmake-mode auto-complete-auctex exec-path-from-shell company-ghci ghci-completion ## racket-mode company-jedi company-irony company-irony-c-headers company-c-headers sml-mode rust-mode python-mode python-django python-environment company-coq))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA Packages
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))

;; Coq - Proof General
;; Open .v files with Proof-General's coq-mode      
(require 'proof-site "~/.emacs.d/lisp/PG/generic/proof-site")
;; Load company-coq when opening Coq files
(add-hook 'coq-mode-hook #'company-coq-mode)

;; Company Mode Backends 
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
   '(add-to-list
     'company-backends '(company-irony-c-headers company-irony company-jedi company-c-headers)))

;; GHCI - Haskell completion
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)

;; Python
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'python)

;; TeX Mode -> Default
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; Exec Path Shell
(when (memq window-system '(mac ns))
(exec-path-from-shell-initialize))


;; Configure eldoc mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; c-make mode
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/cmake-mode-20160928.505/cmake-mode") load-path))
(require 'cmake-mode)

;; enh-ruby-mode
(add-to-list 'load-path "~/.emacs.d/elpa/enh-ruby-mode-20171101.1638//Enhanced-Ruby-Mode") ; must be added after any path containing old ruby-mode
;; (setq enh-ruby-program "(path-to-ruby1.9)/bin/ruby") - so that still works if ruby points to ruby1.8

;; TAB autocompletion
(setq tab-always-indent 'complete)

;;log4j-mode
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))

;; Fly-Check (Syntax) + Fly-Check (Python)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (global-flycheck-mode 1)
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

;; For 'pretty-mode'
(require 'pretty-mode)
(global-pretty-mode t)

(pretty-deactivate-groups
 '(:equality :ordering :ordering-double :ordering-triple
             :arrows :arrows-twoheaded :punctuation
             :logic :sets))

(pretty-activate-groups
 '(:sub-and-superscripts :greek :arithmetic-nary))

(global-prettify-symbols-mode 1)

(add-hook
 'python-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
         '(;; Syntax
           ("def" .      #x2131)
           ("not" .      #x2757)
           ("in" .       #x2208)
           ("not in" .   #x2209)
           ("return" .   #x27fc)
           ("yield" .    #x27fb)
           ("for" .      #x2200)
           ;; Base Types
           ("int" .      #x2124)
           ("float" .    #x211d)
           ("str" .      #x1d54a)
           ("True" .     #x1d54b)
           ("False" .    #x1d53d)
           ;; Mypy
           ("Dict" .     #x1d507)
           ("List" .     #x2112)
           ("Tuple" .    #x2a02)
           ("Set" .      #x2126)
           ("Iterable" . #x1d50a)
           ("Any" .      #x2754)
           ("Union" .    #x22c3)))))


;; Enable FiraCode
(when (window-system)
  (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
			  `([,(cdr char-regexp) 0 font-shape-gstring]))))

;; Pop-up to fit in window
(require 'popwin)
(popwin-mode 1)

;; Auto-complete backed -> C/C++
(global-auto-complete-mode t)
(require 'auto-complete-c-headers)
(add-to-list 'ac-sources 'ac-source-c-headers)

;; Rust Mode -> racer-rust
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
