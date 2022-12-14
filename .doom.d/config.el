;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Vikas Sharma"
      user-mail-address "vickysharma0812@gmail.com")
;; (setq doom-font (font-spec :family "Hack Nerd Font" :size 16)
;;      doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 16))
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16)
     doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font" :size 16))
;; ;; (setq doom-font (font-spec :family "FiraCode Nerd Font" :style "Retina" :size 16)
;;       doom-variable-pitch-font (font-spec :family "FiraCode Nerd Font" :style "Retina" :size 16))
;; ;; (setq doom-font (font-spec :family "Hurmit Nerd Font Mono" :size 16)
;;       doom-variable-pitch-font (font-spec :family "Hurmit Nerd Font Mono" :size 16))
;; (setq doom-font (font-spec :family "MesloLGS NF" :size 14)
;;       doom-variable-pitch-font (font-spec :family "MesloLGS NF" :size 16))
;; (setq doom-font (font-spec :family "Iosevka Nerd Font" :size 15)
;;       doom-variable-pitch-font (font-spec :family "Hack Nerd Font" :size 15)
;;       doom-big-font (font-spec :family "Iosevka Nerd Font" :size 24))

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;
(setq
 doom-theme 'doom-dracula
 ;;doom-theme 'doom-dracula
 ;; doom-theme 'doom-Iosvkem
 ;; org-directory "~/Dropbox/org/"
 ;; projectile-project-search-path '("~/Dropbox/easifem/")
 projectile-project-search-path '(
                                  "~/Dropbox/easifem/easifem-pages/docs/examples/"
                                  )
 default-buffer-file-coding-system 'utf-8
 create-lockfiles nil
 )
;
(setq explicit-shell-file-name "/bin/zsh")
(setq shell-file-name "zsh")
;
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;
;
(add-hook 'f90-mode-hook #'lsp-deferred)
(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . f90-mode))
(setq-default tab-width 2)
(setq
 lsp-clients-fortls-args '(
                           "--incremental_sync"
                           "--autocomplete_no_prefix"
                           "--variable_hover"
                           "--hover_signature"
                           "--use_signature_help"
                           )
 lsp-clients-fortls-executable "fortls"
 )
;;
;;(setq lsp-headerline-breadcrumb-segments '(project file symbols))
;;
;; "--incremental_sync"
;; $DOOMDIR/config.el
(use-package! org-pandoc-import :after org)
;;
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key (kbd "C-D") 'duplicate-line)
;;
;; for cut/copy/paste
;; (cua-mode)
;; handling transparency
;;
(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(90 . 70))
(add-to-list 'default-frame-alist '(alpha . (90 . 70)))
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(90 . 70) '(100 . 100)))))
(global-set-key (kbd "C-t t") 'toggle-transparency)


;; hide all buffers starting with an asterisk.
;; (add-to-list 'ibuffer-never-show-predicates "^\\*")

