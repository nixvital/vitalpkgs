{ buildPythonApplication, setuptools, click, flask, requests,
  fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-monitor";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-monitor";
    rev = "ee9e98b8cb91f37de63482d829b0910e8a594e35";
    sha256 = "sha256-my1Nj3xVfO3YKKg/8kVEL8XVtHbxGebR5LNH/Ir7HUA=";
  };

  propagatedBuildInputs = [
    setuptools click flask requests
  ];
}
