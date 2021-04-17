{ lib
, pkgs
, buildPythonPackage
, isPy37
, isPy38
, isPy39
, fetchPypi
, setuptools
}:

let url = if isPy37 then 
      "https://files.pythonhosted.org/packages/6f/9d/bf6ddb26bea4e04f1ba09725ce4a1eb92883b037e2fa8613ccfb00442b3e/blspy-1.0.1-cp37-cp37m-manylinux2010_x86_64.whl"
    else if isPy38 then
      "https://files.pythonhosted.org/packages/4b/99/74154d22dcb42faff37ca86154254542532e249acc40b2cd1025071f06d7/blspy-1.0.1-cp38-cp38-manylinux2010_x86_64.whl"
    else if isPy39 then
      "https://files.pythonhosted.org/packages/3b/52/89047e3fba2a55290bcc37b69a55b307779f81afdaece9829bae3faa0d2f/blspy-1.0.1-cp39-cp39-manylinux2010_x86_64.whl"
    else "WRONG!";

in buildPythonPackage rec {
  pname = "blspy";
  version = "1.0.1";

  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "1mms0by14v7lxcskm0x5r3gyfw1ixyaf00h6l1ld65zsp1pp0ys9";
  };

  propagatedBuildInputs = [ setuptools ];

  meta = with lib; {
    description = "BLS Signatures implementation";
    homepage = "https://github.com/Chia-Network/bls-signatures";
    license = licenses.mit;
    maintainers = with maintainers; [ breakds ];
  };
}
