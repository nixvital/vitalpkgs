{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "644479f503f92c96034eeea627c0ea82d0de7b9b";
    sha256 = "sha256-wfzmllS4fw1DQmdd0OlrFQRAg9teVt9/PxJJui7caP0=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
