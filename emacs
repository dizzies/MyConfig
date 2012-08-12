(setq visible-bell t)
(setq inhibit-startup-message t)
(setq column-number-mode t) 
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill-column 60)
(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;      (setq tab-stop-list (cons (* x 4) tab-stop-list)))
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
(setq enable-recursive-minibuffers t)
(setq scroll-margin 3
      scroll-conservatively 10000)
(setq default-major-mode 'text-mode)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(mouse-avoidance-mode 'animate)
(setq frame-title-format "emacs@%b")
(auto-image-file-mode)
(global-font-lock-mode t)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)
(mapcar
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)))
(setq user-full-name "Dongpeng Li")
(setq user-mail-address "ldp1221@gmail.com")
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;some my preference(little change);;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'line-num)
(global-linum-mode 1)
(setq-default cursor-type 'bar) ; 设置光标为竖线
(setq x-select-enable-clipboard t);;copy and past

;;滚动页面时比较舒服，不要整页的滚动 
(setq scroll-step 1 
scroll-margin 3 
scroll-conservatively 10000) 
;;去掉烦人的警告铃声 
(setq visible-bell nil) 
;;允许自动打开图片，如wiki里面 
(auto-image-file-mode) 
;;所有的问题用y/n方式，不用yes/no方式。有点懒，只想输入一个字母 
(fset 'yes-or-no-p 'y-or-n-p) 
;;不要滚动栏，现在都用滚轴鼠标了，可以不用滚动栏了 (unactivate)
(scroll-bar-mode nil)
(set-frame-position (selected-frame) 0 0);;position:top-left
(set-frame-width (selected-frame) 108);;window's width
(set-frame-height (selected-frame) 37);;window's height


;;emacs code browser
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(require 'ecb)
;;To load ecb at startup:
;;(require 'ecb)
;;- or -
;;To load ecb first after starting it by ecb-activate:
(require 'ecb-autoloads)
;;no help
(require 'ecb-autoloads) 
(setq ecb-auto-activate t 
ecb-tip-of-the-day nil 
inhibit-startup-message t 
ecb-auto-compatibility-check nil 
ecb-version-check nil)

;;etags
(require 'etags-select)
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)  
;;cscope
(require 'xcscope)


;;;;;;;;;;;;;;;;;;;;;;;;
;set the theme;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;config for python;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(require 'ipython)
(require 'lambda-mode)
(add-hook 'python-mode-hook #'lambda-mode 1)
;;auto complete
(require 'anything) (require 'anything-ipython)
 (when (require 'anything-show-completion nil t)
    (use-anything-show-completion 'anything-ipython-complete
                                  '(length initial-pattern)))


;; Comint is a minor-mode to deal with interpreter commands in an emacs buffer. It’s used by many modes, including ipython. 
;;Comint uses M-p and M-nto cycle backwards and forward through input history. I prefer to use the up and down arrow keys:
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

;;templates
(require 'yasnippet)
(require 'yasnippet-bundle)
(yas/initialize)
;;(yas/load-directory "/usr/share/emacs/site-lisp/yas/")


;;use auto-complete
;;(require 'complete.el)
;;(require 'auto-complete-config)
;(ac-config-default)

;;use pycomplete


