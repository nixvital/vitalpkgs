{ lib, stdenv, cmake, boost, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "avro-cpp";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "breakds";
    repo = "avro";
    rev = "5c12f990f25eab9fc5c75886721aa9d2e6658942";
    sha256 = "sha256-SHe65cJfiWY9zYY0XFnIzrcwCMWNXXdcPrCTptEb1cY=";
  };

  cmakeDir = "../lang/c++";

  nativeBuildInputs = [ cmake ];
  buildInputs = [ boost ];

  meta = with lib; {
    homepage = "https://github.com/apache/avro/tree/master/lang/c%2B%2B";
    description = ''
      The C++ port of the Apache avro library.
    '';
    platforms = with platforms; linux ++ darwin;
    licencse = licenses.asl2;
  };
}
