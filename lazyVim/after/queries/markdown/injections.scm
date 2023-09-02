;extends

(fenced_code_block
  ((info_string) @_lang
    (#match? @_lang "(fortran)"))
  (code_fence_content) @fortran
)

((inline) @_inline (#match? @_inline "^\(import\|export\)")) @tsx
