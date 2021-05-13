{ lib, buildPythonPackage,
  stdenv,
  pytest,
  blspy }:

buildPythonPackage rec {
  pname = "clvm";
  version = "0.9.6";

  src = builtins.fetchTarball {
    url = https://github.com/Chia-Network/clvm/archive/refs/tags/0.9.6.tar.gz;
    sha256 = "1h1d5fcbcnv815a502q0fy9q7r2z4cz31i6n9wj1v1y5a250852w";
  };

  checkInputs = [ pytest ];

  buildInputs = [
    stdenv.cc.cc.lib
  ];

  propagatedBuildInputs = [ blspy ];

  meta = with lib; {
    description = ''
      This is the in-development version of a LISP-like language for encumbering and 
      releasing funds with smart-contract capabilities.
    '';
    homepage = "https://github.com/Chia-Network/clvm";
    license = licenses.asl20;
    maitainers = with maintainers; [ breakds ];
  };
}
