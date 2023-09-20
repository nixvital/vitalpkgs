{ buildPythonApplication, pytestCheckHook, click}:

buildPythonApplication {
  pname = "vscode-include-fix";

  version = "1.0.0";

  srcs = ./.;

  propagatedBuildInputs = [ click ];

  checkInputs = [ pytestCheckHook ];

  doCheck = false;
}