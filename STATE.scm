;;; STATE.scm — prodigy-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "1.0.0")
    (updated . "2025-12-16")
    (project . "prodigy-ssg")
    (required-language . "Prolog")))

(define language-enforcement
  '((primary-language . "Prolog")
    (file-extension . ".pl")
    (interpreter . "SWI-Prolog")
    (forbidden-languages . ("Python" "JavaScript" "TypeScript" "Ruby" "Go"))
    (rationale . "prodigy-ssg is the DEFINITIVE Prolog static site generator. It MUST be written entirely in Prolog. No other implementation languages are permitted.")
    (enforcement . "strict")))

(define current-position
  '((phase . "v1.0 - Prolog Implementation Complete")
    (overall-completion . 100)
    (components ((Prolog-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "pending") (language . "ReScript") (completion . 0)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority ())))

(define critical-next-actions
  '((immediate (("Connect MCP adapter in ReScript" . high)))))

(define state-summary
  '((project . "prodigy-ssg")
    (language . "Prolog")
    (completion . 100)
    (blockers . 0)
    (updated . "2025-12-16")))
