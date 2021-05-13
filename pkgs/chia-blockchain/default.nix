{ lib, buildPythonApplication,
  blspy, # Need importing
  
  
  ... }:

buildPythonApplication rec {
  pname = "chia-blockchain";
  version = "1.0.5";

  src = fetchPypi {
    inherit pname version;
    sha256 = "4b3a1301e57bfd8dce939bf25ef8fbb4b23967fd0f878eede328bdcc41386bae";
  };

  propagatedBuildInputs = [];

  checkPhase = ''
    $out/bin/chia --help > /dev/null
  '';

  meta = with lib; {
    description = ''
      Chia is a modern cryptocurrency built from scratch, designed to be efficient, 
      decentralized, and secure. 
    '';
    homepage = "https://chia.net/";
    license = licenses.asl20;
    maitainers = with maintainers; [ breakds ];
  };
}
