{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "fe91adbd610a5f6a2cd751df8bb50819f542879d";
    sha256 = "sha256-AZ6o+fu5RlzjJTWzdE6hN5WszrjZx3AMMiPYWjycDyE=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
