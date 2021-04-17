{ lib
, pkgs
, buildPythonPackage
, isPy37
, isPy38
, isPy39
, fetchPypi
, setuptools
}:

let url = if isPy37 then "https://files.pythonhosted.org/packages/a9/aa/009e1df2113fe12f5671e2a97d9bdfb5095110ae9dfb448b8ba334f22f69/chiapos-1.0.1-cp37-cp37m-manylinux2010_x86_64.whl"
          else if isPy38 then "https://files.pythonhosted.org/packages/79/ae/c3614451fff6347577d1e28b2b311d3519b21a525ee4a68b16f8f8a423b7/chiapos-1.0.1-cp38-cp38-manylinux2010_x86_64.whl"
          else if isPy39 then "https://files.pythonhosted.org/packages/2e/2a/a8eca3abee5737e343e576e867bf35e46ae64120846127a77bb561c97f72/chiapos-1.0.1-cp39-cp39-manylinux2010_x86_64.whl"
          else "WRONG!";

in buildPythonPackage rec {
  pname = "chiapos";
  version = "1.0.1";

  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "1g6zvcnq7ais5v251360z5a48jpl63jsaf0zb1p0sid96shqg4za";
  };

  propagatedBuildInputs = [ setuptools ];

  meta = with lib; {
    description = ''
      Chia's proof of space is written in C++. Includes a plotter, prover, and verifier. 
      It exclusively runs on 64 bit architectures. 
    '';
    homepage = "https://github.com/Chia-Network/chiapos";
    license = licenses.asl20;
    maintainers = with maintainers; [ breakds ];
  };
}
