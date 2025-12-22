;;; STATE.scm — prodigy-ssg
;;; Project Checkpoint and AI Conversation Context
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

;;;============================================================================
;;; METADATA
;;;============================================================================

(define metadata
  '((version . "1.0.1")
    (updated . "2025-12-17")
    (project . "prodigy-ssg")
    (repo . "github.com/hyperpolymath/prodigy-ssg")))

;;;============================================================================
;;; PROJECT CONTEXT
;;;============================================================================

(define project-context
  '((name . "prodigy-ssg")
    (tagline . "Logic-based static site generator in Prolog")
    (version . "1.1.0")
    (license . "AGPL-3.0-or-later")
    (rsr-compliance . "gold-target")
    (language . "Prolog")

    (tech-stack
     ((primary . "Prolog (SWI-Prolog 8.0+)")
      (adapter . "ReScript")
      (config . "Nickel")
      (ci-cd . "GitHub Actions")
      (security . "CodeQL + Dependabot")))))

;;;============================================================================
;;; CURRENT POSITION - 44/44 Components
;;;============================================================================

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
