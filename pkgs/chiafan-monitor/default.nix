{ buildPythonApplication, setuptools, click, flask, requests,
  fetchFromGitHub }:

buildPythonApplication rec {
  pname = "chiafan-monitor";
  version = "0.9.0";

  src = fetchFromGitHub {
    owner = "chiafan-org";
    repo = "chiafan-monitor";
    rev = "afde6a30f7802d4c8c3efcfc1bcfbb8528051ec0";
    sha256 = "sha256-zUcXNc7a1CdHWLCCc/T6k5k7Np6VQcNEruOA7yFm6ok=";
  };

  propagatedBuildInputs = [
    setuptools click flask requests
  ];
}
