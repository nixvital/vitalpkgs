{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "0ed4262df46b62c3164cda17899d3dade79110b6";
    sha256 = "sha256-pt4LkhwgBIG9tiBvPepnZaZJ2rwvNq03FE/HRLdNiMg=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
