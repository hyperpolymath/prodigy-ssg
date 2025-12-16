;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — prodigy-ssg

(define-module (prodigy-ssg meta)
  #:export (architecture-decisions development-practices design-rationale language-rules))

(define language-rules
  '((mandatory-language . "Prolog")
    (enforcement-level . "absolute")
    (rationale . "Each SSG satellite is the DEFINITIVE implementation for its language. prodigy-ssg IS the Prolog SSG.")
    (violations
     ("Python implementation" . "FORBIDDEN")
     ("JavaScript/TypeScript" . "FORBIDDEN")
     ("Any non-Prolog language" . "FORBIDDEN - defeats the purpose of this satellite"))
    (correct-implementation
     (interpreter . "SWI-Prolog")
     (mcp-adapter . "adapters/ in ReScript (only exception - adapters are in ReScript/Deno)"))))

(define architecture-decisions
  '((adr-001
     (title . "Prolog-Only Implementation")
     (status . "accepted")
     (date . "2025-12-16")
     (context . "SSG satellites must be in their target language")
     (decision . "prodigy-ssg is written entirely in Prolog")
     (consequences . ("Language-specific features" "Idiomatic patterns")))
    (adr-002
     (title . "RSR Compliance")
     (status . "accepted")
     (date . "2025-12-15")
     (context . "Part of hyperpolymath ecosystem")
     (decision . "Follow Rhodium Standard Repository guidelines")
     (consequences . ("RSR Gold target" "SHA-pinned actions" "SPDX headers")))))

(define development-practices
  '((code-style (languages . ("Prolog")))
    (security (sast . "CodeQL for workflow scanning") (credentials . "env vars only"))
    (versioning (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-Prolog "This is THE Prolog SSG. No other language is acceptable.")))
