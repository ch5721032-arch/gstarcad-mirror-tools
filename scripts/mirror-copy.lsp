;; mirror-copy.lsp - Mirror a selection and keep the original
;; Command: MIRCOPY
(defun c:MIRCOPY ( / ss p1 p2 )
  (setq ss (ssget "\nSelect objects to mirror: "))
  (if ss
    (progn
      (setq p1 (getpoint "\nFirst point of mirror line: "))
      (setq p2 (getpoint p1 "\nSecond point of mirror line: "))
      (if (and p1 p2)
        (progn
          (command "_.MIRROR" ss "" p1 p2 "_Y")
          (princ "\nMirrored copy created.")
        )
      )
    )
  )
  (princ)
)
