Reproduction case for #1549: too many parentheses in installed .dune files

  $ dune build --root backend
  Entering directory 'backend'

  $ cat backend/_build/install/default/lib/dune_inline_tests/dune-package
  (lang dune 1.8)
  (name dune_inline_tests)
  (library
   (name dune_inline_tests)
   (kind normal)
   (archives (byte simple_tests.cma) (native simple_tests.cmxa))
   (plugins (byte simple_tests.cma) (native simple_tests.cmxs))
   (foreign_archives (native simple_tests$ext_lib))
   (main_module_name Simple_tests)
   (modes byte native)
   (modules
    (alias_module
     (name Simple_tests)
     (obj_name simple_tests)
     (visibility public)
     (impl))
    (main_module_name Simple_tests)
    (wrapped true))
   (inline_tests.backend
    (flags :standard)
    (generate_runner
     (run sed "s/(\\*TEST:\\(.*\\)\\*)/let () = \\1;;/" %{impl-files}))))

  $ env OCAMLPATH=backend/_build/install/default/lib dune runtest --root example
  Entering directory 'example'
