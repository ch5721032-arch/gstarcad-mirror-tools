;; mirror-text.lsp - Mirror a selection but keep text readable
;; Command: MIRTXT
(defun c:MIRTXT ( / mirr ss p1 p2 )
  (setq mirr (getvar "MIRRTEXT"))
  (setq ss (ssget "\nSelect objects to mirror: "))
  (if ss
    (progn
      (setq p1 (getpoint "\nFirst point of mirror line: "))
      (setq p2 (getpoint p1 "\nSecond point of mirror line: "))
      (if (and p1 p2)
        (progn
          (setvar "MIRRTEXT" 0)
          (command "_.MIRROR" ss "" p1 p2 "_Y")
          (setvar "MIRRTEXT" mirr)
          (princ "\nMirrored with readable text.")
        )
      )
    )
  )
  (princ)
)
