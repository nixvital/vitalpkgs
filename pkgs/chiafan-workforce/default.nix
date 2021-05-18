{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "7fb684106f92f71d34b121de6e781bf8163e625c";
    sha256 = "sha256-/9FtwIRbYnRbBEOqZFQxupn9HqKjUqXEyDEgcif32TA=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
