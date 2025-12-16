;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — prodigy-ssg

(ecosystem
  (version "1.0.0")
  (name "prodigy-ssg")
  (type "satellite-ssg")
  (purpose "The DEFINITIVE Prolog static site generator")

  (language-identity
    (primary "Prolog")
    (rationale "prodigy-ssg exists to be THE Prolog SSG. The entire engine is written in Prolog.")
    (forbidden ("Python" "JavaScript" "TypeScript" "Ruby" "Go"))
    (enforcement "This is not negotiable. Any non-Prolog implementation will be rejected."))

  (position-in-ecosystem
    "Satellite SSG in the poly-ssg constellation. Each satellite is the definitive SSG for its language.")

  (related-projects
    (project
      (name "poly-ssg-mcp")
      (url "https://github.com/hyperpolymath/poly-ssg-mcp")
      (relationship "hub")
      (description "Unified MCP server for 28+ SSGs - provides adapter interface"))
    (project
      (name "rhodium-standard-repositories")
      (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
      (relationship "standard")))

  (what-this-is
    "- The DEFINITIVE static site generator written in Prolog
     - Part of the poly-ssg satellite constellation")

  (what-this-is-not
    "- NOT a template that can be reimplemented in other languages
     - NOT optional about being in Prolog"))
