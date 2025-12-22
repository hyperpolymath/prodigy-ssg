;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;
;;; ECOSYSTEM.scm — prodigy-ssg
;;; Project Ecosystem Relationships

(ecosystem
  (version "1.1.0")
  (name "prodigy-ssg")
  (type "satellite-ssg")
  (purpose "The DEFINITIVE Prolog static site generator")

  (language-identity
    (primary "Prolog")
    (interpreter "SWI-Prolog 8.0+")
    (rationale "prodigy-ssg exists to be THE Prolog SSG. The entire engine is written in Prolog.")
    (forbidden ("Python" "JavaScript" "TypeScript" "Ruby" "Go" "Rust" "Java"))
    (exceptions ("ReScript in adapters/" "Nickel in ncl/"))
    (enforcement "This is not negotiable. Any non-Prolog implementation will be rejected."))

  (position-in-ecosystem
    "Satellite SSG in the poly-ssg constellation.
     Each satellite is the definitive SSG for its language.
     prodigy-ssg represents Prolog in the polyglot SSG universe.
     Connected to poly-ssg-mcp hub via ReScript adapter.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28+ SSGs - provides adapter interface")
      (integration "adapters/src/ProdigyAdapter.res"))

    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")
      (description "Repository quality guidelines and templates")
      (compliance-level "gold"))

    (project
      (name "PLAYBOOK.scm")
      (url "https://github.com/hyperpolymath/PLAYBOOK.scm")
      (relationship "specification")
      (description "Executable plans specification"))

    (project
      (name "AGENTIC.scm")
      (url "https://github.com/hyperpolymath/AGENTIC.scm")
      (relationship "specification")
      (description "Operational gating policy framework"))

    (project
      (name "NEUROSYM.scm")
      (url "https://github.com/hyperpolymath/NEUROSYM.scm")
      (relationship "specification")
      (description "Symbolic semantics and operational algebra")))

  (what-this-is
    "- The DEFINITIVE static site generator written in Prolog
     - Part of the poly-ssg satellite constellation (28+ SSGs)
     - Uses Prolog's pattern matching and DCG for elegant parsing
     - Backtracking-powered template matching
     - Query-based content discovery
     - RSR Gold compliant repository
     - 44-component structure for comprehensive functionality
     - Full accessibility support (BSL, GSL, ASL, Makaton)")

  (what-this-is-not
    "- NOT a template that can be reimplemented in other languages
     - NOT optional about being in Prolog
     - NOT a general-purpose Prolog library
     - NOT maintained outside the hyperpolymath ecosystem"))

;;; End of ECOSYSTEM.scm
