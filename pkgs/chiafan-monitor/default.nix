{ buildPythonApplication, setuptools, click, flask, requests,
  fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-monitor";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-monitor";
    rev = "d59715a3cb9f6a611d00a3b11b89aedde4110fa2";
    sha256 = "sha256-K/kaAjEMZDyLEGqC892YmgoCMgFdgoCSXfXR0fovwjk=";
  };

  propagatedBuildInputs = [
    setuptools click flask requests
  ];
}
