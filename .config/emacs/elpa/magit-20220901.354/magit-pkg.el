(define-package "magit" "20220901.354" "A Git porcelain inside Emacs."
  '((emacs "25.1")
    (compat "28.1.1.2")
    (dash "20210826")
    (git-commit "20220222")
    (magit-section "20220325")
    (transient "20220325")
    (with-editor "20220318"))
  :commit "c1def981857614f737561ff38bac89fc19d4bc21" :authors
  '(("Marius Vollmer" . "marius.vollmer@gmail.com")
    ("Jonas Bernoulli" . "jonas@bernoul.li"))
  :maintainer
  '("Jonas Bernoulli" . "jonas@bernoul.li")
  :keywords
  '("git" "tools" "vc")
  :url "https://github.com/magit/magit")
;; Local Variables:
;; no-byte-compile: t
;; End:
