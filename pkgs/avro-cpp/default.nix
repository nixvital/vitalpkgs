{ lib, stdenv, cmake, boost, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "avro-cpp";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "breakds";
    repo = "avro";
    rev = "ed7c7673eb444d6349fe4d2eb496d7ba83d42b9e";
    sha256 = "sha256-xjHY9ODOXR1V5lOtHWUd5GLog4IN298PwtOagzcbfTY=";
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
