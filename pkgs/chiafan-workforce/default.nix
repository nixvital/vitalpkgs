{ buildPythonApplication, setuptools, click, flask, fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-workforce";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-workforce";
    rev = "bb301e0e2a19077bdf203279f432af46438f6a80";
    sha256 = "sha256-xAUmUn2ZHRSyDQGNm5jz1YmdjmudjvftWDf5ZdwVAQI=";
  };

  propagatedBuildInputs = [
    setuptools click flask
  ];
}
