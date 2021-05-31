{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "4e37a31f14d27bcfa6f963e8b10dcea3bd8c80ad";
    sha256 = "sha256-C8Eg/WLkLLm9FekncvluZodCzz9WCeojOBaz2wgxVR4=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
