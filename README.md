# GstarCAD Mirror Tools

Mirror a selection while keeping the original, keep text readable, or mirror across an existing line.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Mirroring usually means deciding whether to keep the original and worrying about flipped text. These commands mirror while keeping the original, mirror with text left readable, and mirror across any existing line in the drawing, covering the three most common mirror jobs.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/mirror-copy.lsp` | ;; mirror-copy.lsp - Mirror a selection and keep the original
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
 |
| `scripts/mirror-text.lsp` | ;; mirror-text.lsp - Mirror a selection but keep text readable
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
 |
| `scripts/mirror-line.lsp` | ;; mirror-line.lsp - Mirror a selection across an existing line
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
