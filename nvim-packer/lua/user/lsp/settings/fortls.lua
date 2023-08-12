return {
  settings = {

    fortran = {
      cmd = {
        "fortls",
        "--version",
        "--lowercase_intrisics",
        "--hover_signature",
        "--hover_language=fortran",
        "--use_signature_help",
        "--config=.fortls",
      },
    },
  },
}
