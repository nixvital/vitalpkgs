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
      "https://files.pythonhosted.org/packages/41/37/e50556e0d83656b2057b8e653a9f84b6203cc333c3c99fc85ef7ab3e0f74/chiavdf-1.0.1-cp37-cp37m-manylinux2010_x86_64.whl"
    else if isPy38 then
      "https://files.pythonhosted.org/packages/29/9f/d817e7817e1565d53f1de5e16599a8592cd2b6da7f79c963c3291e94c33f/chiavdf-1.0.1-cp38-cp38-manylinux2010_x86_64.whl"
    else if isPy39 then
      "https://files.pythonhosted.org/packages/cf/a4/e376908ee0de0c2ccfae4c59fbab771cc971225ff99f9155bb989a7c2d37/chiavdf-1.0.1-cp39-cp39-manylinux2010_x86_64.whl"
    else "WRONG!";

in buildPythonPackage rec {
  pname = "chiavdf";
  version = "1.0.1";

  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "1ybpc8rknx2y1j948g4ib26hi3zfcxa7grsb9ifik3p68qa9fb67";
  };

  propagatedBuildInputs = [ setuptools ];

  meta = with lib; {
    description = "Contains core VDF process that completes the Proof of Time submitted to it by the Timelord";
    homepage = "https://github.com/Chia-Network/chiavdf";
    license = licenses.asl20;
    maintainers = with maintainers; [ breakds ];
  };
}
