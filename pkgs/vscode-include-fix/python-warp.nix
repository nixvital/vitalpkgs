{ buildPythonPackage
, requests
, click
, pandas
, numpy
}:

buildPythonPackage rec {
  pname = "vscode-include-fix-warp";
  version = "1.0.0";

  src = ./.;

  propagatedBuildInputs = [ requests click ];

  doCheck= false;
}
