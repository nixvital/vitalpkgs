{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "23d9b578f0783ca3113c4522eec6470922dcd224";
    sha256 = "sha256-w8g/RHDxBEGvf6e1d35IgfDoTzffRmzsJta2o345wNA=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
