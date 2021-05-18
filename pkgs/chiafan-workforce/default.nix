{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "2f8bf5bc7cf731f3824df07e794a1b530a16e10b";
    sha256 = "sha256-N38q7pVYJ4/vg2NWetBGtPTitK2o6ZOnQtvfkNT5IDI=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
