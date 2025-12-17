;;; STATE.scm — prodigy-ssg
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "1.0.1")
    (updated . "2025-12-17")
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
  '((phase . "v1.0 - Core Complete, MCP Adapter Ready")
    (overall-completion . 85)
    (components ((Prolog-engine ((status . "complete") (completion . 100)))
                 (mcp-adapter ((status . "implemented") (language . "ReScript") (completion . 90)))
                 (security ((status . "reviewed") (completion . 100)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority (("Test in production environment" . pending)))))

(define critical-next-actions
  '((immediate (("Publish to npm for MCP adapter" . high)
                ("Add integration tests" . medium)))
    (short-term (("Expand markdown parser features" . medium)
                 ("Add YAML frontmatter support" . medium)))
    (long-term (("Plugin system" . low)
                ("Live reload development server" . low)))))

(define state-summary
  '((project . "prodigy-ssg")
    (language . "Prolog")
    (completion . 85)
    (blockers . 0)
    (updated . "2025-12-17")))
