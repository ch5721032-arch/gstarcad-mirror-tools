;; mirror-line.lsp - Mirror a selection across an existing line
;; Command: MIRLINE
(defun c:MIRLINE ( / ss en ed p1 p2 )
  (setq ss (ssget "\nSelect objects to mirror: "))
  (if ss
    (progn
      (setq en (car (entsel "\nSelect mirror line: ")))
      (setq ed (entget en))
      (if (= (cdr (assoc 0 ed)) "LINE")
        (progn
          (setq p1 (cdr (assoc 10 ed)))
          (setq p2 (cdr (assoc 11 ed)))
          (command "_.MIRROR" ss "" p1 p2 "_Y")
          (princ "\nMirrored across the selected line.")
        )
        (princ "\nSelected object is not a line.")
      )
    )
  )
  (princ)
)
