{ lib
, pkgs
, stdenv
, buildPythonPackage
, isPy37
, isPy38
, isPy39
, fetchPypi
, setuptools
}:

let url = if isPy37 then 
      "https://files.pythonhosted.org/packages/77/a1/128bb7ebd7306d1ef16763f3f7f562eacd710808d64ee686cb0ca8acbbdc/chiabip158-1.0-cp37-cp37m-manylinux2010_x86_64.whl"
    else if isPy38 then
      "https://files.pythonhosted.org/packages/2a/65/3f62365ecb82d8e143d742f2a268d7c9b836a67333114a2d118541f0d70c/chiabip158-1.0-cp38-cp38-manylinux2010_x86_64.whl"
    else if isPy39 then
      "https://files.pythonhosted.org/packages/89/0b/e49baf09060504bfbd79918c17af4a6ce172c84f0cc2cd4e7b197a7a88ea/chiabip158-1.0-cp39-cp39-manylinux2010_x86_64.whl"
    else "WRONG!";

in buildPythonPackage rec {
  pname = "chiabip158";
  version = "1.0";

  format = "wheel";

  src = builtins.fetchurl {
    inherit url;
    sha256 = "0wh6k3fiyc2ymb12asx3w297qcwkbn7n69j3dxg64yvr05vnhzfg";
  };

  buildInputs = [ stdenv.cc.cc.lib ];

  propagatedBuildInputs = [ setuptools ];

  nativeBuildInputs = [ pkgs.autoPatchelfHook ];  

  meta = with lib; {
    description = "This implements the compact block filter construction in BIP 158";
    homepage = "https://github.com/Chia-Network/chiabip158";
    license = licenses.asl20;
    maintainers = with maintainers; [ breakds ];
  };
}
