{ lib, stdenv, cmake, boost, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "avro-cpp";
  version = "1.11.0";

  src = fetchFromGitHub {
    owner = "breakds";
    repo = "avro";
    rev = "a1da5e854c45fbf7a485c4bde106e628aff1d30f";
    sha256 = "sha256-hP/bG7MxgffwyzJUWcbAo+oGB6LA2hqqAP6/XDD7W50=";
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
