;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Viet Nguyen"
      user-mail-address "anhvietdlkid@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")

;; for using planuml in orgmode
(after! org
  (setq org-plantuml-jar-path (expand-file-name "~/Dropbox/emacsTools/plantuml.jar"))
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

;; for org roam
(setq org-roam-directory "~/Dropbox/org/roam")

(after! org
  (setq +org-capture-todo-file "~/Dropbox/org/inbox.org")
  (setq org-capture-templates
        '(("t" "Capture TODO" entry
           (file +org-capture-todo-file)
           "* TODO %? [/] [%]\n\
/Enter on/ %U\n\
- Ref:\n\
- Brain storming:\n\
Actions:\n\
- [ ] ")
        ("d" "Deployment" entry
           (file +org-capture-todo-file)
           "* TODO %? [%]\n\
- Ref:\n\
  + Jira ticket: \n\
  + MR link: \n\
  + Branch name: \n\
Actions:\n\
- [ ] Check The MR to see whether all the comments are resolved yet\n\
- [ ] Merged master to feature branch\n\
- [ ] Lateset local change of feature branch have been pushed\n\
- [ ] Merged to test branch again to make sure code in test is latest\n\
- [ ] Pull UAT changes and merged to UAT\n\
- [ ] Update the release check list while deploy to UAT\n\
- [ ] Verify UAT for this feature\n\
- [ ] Ask for mergeing the feature branch\n\
- [ ] Deployed to staging with release checklist is verified with staging\n\
- [ ] Regression test")))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "CLARIFY(c)" "DOING(n)" "|" "DONE(d)" "DELEGATE(D)")))
  (setq org-todo-keywords-for-agenda
        '((sequence "TODO(t)" "CLARIFY(c)" "DOING(n)" "|" "DONE(d)" "DELEGATE(D)")))
  (setq hl-todo-keyword-faces
        '(("TODO" . "#d0bf8f")
          ("CLARIFY" . "#cc9393")
          ("DOING" . "#8c5353")
          ("DONE" . "#7cb8bb")
          ("DELETEGATE" . "#5f7f5f")))

  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo . " %i %-12:c")
          (tags . " %i %-12:c")
          (search . " %i %-12:c")))

  (setq org-agenda-custom-commands
        '(("g" "Get Things Done (GTD)"
           ((agenda ""
                    ((org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'deadline))
                     (org-deadline-warning-days 0)))
            (todo "DOING"
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-agenda-prefix-format "  %i %-12:c [%e] ")
                   (org-agenda-overriding-header "\nDoing tasks\n")))
            (agenda nil
                    ((org-agenda-entry-types '(:deadline))
                     (org-agenda-format-date "")
                     (org-deadline-warning-days 7)
                     (org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'notregexp "\\* DOING"))
                     (org-agenda-overriding-header "\nDeadlines 7 days")))
            (todo "CLARIFY"
                  ((org-agenda-prefix-format "  %?-12t% s")
                   (org-agenda-overriding-header "\nNext tasks\n")))
            (todo "TODO"
                  ((org-agenda-prefix-format "  %?-12t% s")
                   (org-agenda-overriding-header "\nInbox\n")))
            (tags "CLOSED>=\"<today> - 7d\""
                  ((org-agenda-overriding-header "\nCompleted last 7 days\n")))))))
  )


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; for deft
(setq deft-directory "~/Dropbox/org"
      deft-extensions '("org" "org_archive" "txt")
      deft-recursive t)



;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
