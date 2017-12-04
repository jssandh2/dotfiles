
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages
   (quote
    (pretty-mode company-coq company-irony cmake-mode web weather-metno sublimity ssh slime slack skype rvm rust-mode peg package+ org-jekyll monochrome-theme mips-mode maude-mode math-symbols mark-tools malinka magic-latex-buffer macro-math log4j-mode lispxmp json-reformat json-navigator json-snatcher js-auto-beautify jedi intero import-js highlight govet google-maps go-add-tags go-mode gmail-message-mode github-theme ghci-completion ghc gh-md gh geiser git git-auto-commit-mode git-command git-commit format-sql fancy-battery ensime enh-ruby-mode emoji-display emoji-cheat-sheet-plus emoji-recall emacsql-mysql elscreen dracula-theme flylisp racket-mode redis all markdown-preview-eww markdown-mode math-symbol-lists lex ## sml-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable LaTeX (Math) Mode
(add-hook 'LaTeX-mode-hook 'LateX-math-mode)

;; LISP support
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; Proof-General (Front-End : Coq, Agda)
(load "~/.emacs.d/lisp/PG/generic/proof-site")

;; Company-Coq --> Make Coq Great Again!
;; Load company-coq when opening Coq files
(add-hook 'coq-mode-hook #'company-coq-mode)

;; Add Lisp directory
(load "~/.emacs.d/lisp/PG/quack.el")

;; For Haskell
(add-hook 'inferior-haskell-mode-hook 'turn-on-ghci-completion)

;; For GO (linting)
;; (add-to-list 'load-path "PATH CONTAINING govet.el" t)
;; (require 'govet)

;; Macs
(require 'macro-math)
(global-set-key "\C-x~" 'macro-math-eval-and-round-region)
(global-set-key "\C-x=" 'macro-math-eval-region)

;; LaTeX highlighting
(require 'magic-latex-buffer)
(add-hook 'latex-mode-hook 'magic-latex-buffer)

;; For cmake mode
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

;; For C++ stuff (irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

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


;; Skype
;;(require 'skype)
;;(setq skype--my-user-handle "juspreet.sandhu3")

;; For 'Sublime's' features of smooth scrolling
;;(require 'sublimity)
;;(require 'sublimity-scroll)

;;(require 'sublimity-map)
;;(sublimity-global-mode)
