;; Minimal Spacemacs user config managed by nix-config
;; You can extend layers and settings here.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; add layers here, e.g. ivy, lsp, git, (org :variables org-enable-hugo-support t)
   )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5) (projects . 7))
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC m"
   dotspacemacs-ex-command-key ":"
   ;; put caches under XDG cache dir to avoid writing into .emacs.d
   dotspacemacs-cache-directory (expand-file-name "spacemacs" (or (getenv "XDG_CACHE_HOME") "~/.cache"))
   ))

(defun dotspacemacs/user-init ()
  ;; User init before layer configuration loads
  )

(defun dotspacemacs/user-config ()
  ;; User config after layers load
  )

