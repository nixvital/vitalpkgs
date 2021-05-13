{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "f07e62f1c4271b9158930e50c4b6ab6106459b6f";
    sha256 = "sha256-nY7E8fVzNWwNnFv5DUo20otVr3ciiBs0PyLrYcT693A=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
