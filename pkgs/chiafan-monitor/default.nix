{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-monitor";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-monitor";
    rev = "853c46d9c7ec7991b249791121066e5724a67934";
    sha256 = "sha256-xAUmUn2ZHRSyDQGNm5jz1YmdjmudjvftWDf5ZdwVAQK=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
