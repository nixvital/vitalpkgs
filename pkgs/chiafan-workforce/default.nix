{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "50816f23f783059b1c8dd0ae944e90fb142e7df7";
    sha256 = "sha256-ljptIM1NlJivbuu+fUTBnOZTFf3O4uw67t+d8mVnv+E=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
